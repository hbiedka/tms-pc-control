#include "DSP28x_Project.h"
#include "math.h"
#include "stdlib.h"
#include "string.h"
#include "PIandTableDec.h"
#include "stpCtrlTable_event.c"
//TODO: TIMERTHRESHOLDCONSTANT needs checking! LOAD new Table & check dt!

//continuous PWM on idle DISABLED!

#include "limits.h"
/* IF PROGRAM WORKS WRONG, check different PWM CMP behavior*/
/* SHOULD EVERY INTERRUPT SETUP BE PRECEDED BY DINT;?*/

#define LEN(arr) ((int) (sizeof (arr) / sizeof (arr)[0]))
#define uC_clockPeriod 1/150.0e6f                 //TMS320F28335 clock period in seconds

//__interrupt void PWM_isr(void);

float iDestTest = 0.5;
float newP = 1.65;
float newI = 200.0;
float newS = 1.0;
short adjustPIa = 0, adjustPIb = 0, adjustPIall = 1;

unsigned int i=0;
short direction = 1;
short runFlag=0;
short runMem;
/* !! 3.6 Hz MAX when absolute encoder CLK works in 500 kHz mode !! */
/* divider max 6.1 for Lebesgue-pcos */
double T = 4.0*5e-3; //period of one full motor step in seconds
double Tdest;
double RPMdest = 15.0;     //RPM set by user
double RPMtoT = 4.0*5e-3*60.0;
double TtoRPM = 1/(4.0*5e-3*60.0);
short TadjFlag = 0; //flag set if user changes the destination speed
long int TinTimer,TinTimerDest; //period of step in number of Machine Cycles
unsigned int Tmul;
int TincrementStep = 200; //Step in timer cycles for engine speed-up/speed-down
double TincrementStepConst = 200.0*60.0;
unsigned long int TimerThreshold = 4294967295; //timer 'capacity'
double TimerThresholdConstant = 1.0/4294967295.0;
unsigned int timerDivision = 1; //defined by 1/(TDDRH:TDDR)
int currPos=0;
unsigned int PWMthreshold = 1499; //PWM counter max value
short flag_manualPWMmode = 0;
float manualPWM[2] = {0.0, 0.0};

//static float currTable[5][4];
//static float currTable[5][8];
//static float currTable[5][16];
//static float currTable[5][29];
//static float currTable[5][28];
//static float currTable[5][32];
//static float currTable[5][64];
//static float currTable[5][60];
static float currTable[5][128];
//static float currTable[5][124];
//static float currTable[5][256];
//static float currTable[5][252];

int arrayLength = LEN(currTable[0]); //length of data array (number of columns)

struct regPI regA, regB;
float iDest = 1.5; //current destination value
float iA,iB,adcA,adcB; //coil current
float eA, eB; //coil current's error
int ADCthreshold = 4095;
float ADCconst = 1.0/4095.0; //1/ADCthreshold
float adcBiasA = 0;
float adcBiasB = 0;
short biasMeasurement = 0; //FLAG to initialize measurements of actual zero coil current values
int biasSampleNum = 1000; //number of samples from which system extracts average value -> VoltageBias
double biasSampleNumConst = 1.0/1000.0;
int biasSample = 0; //iterator for sampling;
unsigned int biasSamplesA[1000],biasSamplesB[1000];
Uint16 adcBufferA[1]={0},adcBufferB[1]={0};
short adcBufferSize=1;
short adcBufferIterator=0;

///* Experimental data */
//float aA = 0.00624739;
//float bA = -13.4389807*0;
//float aB = 0.0062118914;
//float bB = -13.3745379906*0;

/* MCA1101 */
float aA = 3.0/(0.230*4096);
float aB = 3.0/(0.230*4096);
#define A_GAIN 0.003148486432366
#define B_GAIN 0.003121966667957

/* Encoder */
short dataBits[13];
int currentBit = 13; // 13 means START; -1 means delay
short upDownSSIBit = 0;
unsigned int Tclk = 150; // for 0.5 [MHz] CLK
unsigned int delayCycles = 2250; //delay == 15 [us] when CLK == 150 [MHz]
float positionConstant = 360.0/8192.0;
unsigned int bitVal = 0;
float currAngle = 0;

unsigned int qckPow2(unsigned int exponent){
    unsigned int exp = exponent;
    unsigned int ret=1;
    while (exp!=0){
        ret*=2;
        exp--;
    }
    return ret;
}

int cmpfunc (const void * a, const void * b) {
   return ( *(int*)a - *(int*)b );
}

long definePRD(int coil,int position){
    long tmp = (long)(currTable[coil][position]*TinTimer) % TimerThreshold;
    if (tmp==0) tmp=TimerThreshold;
    return tmp;
}

int defineQuotient(int coil,int position){
    return (int)floor((currTable[coil][position]*TinTimer*TimerThresholdConstant));
}

void setAPWMout(float nextVal){
    if (nextVal>=0){
        /*Set Ap, pull-down Am*/
        EALLOW;
        EPwm1Regs.CMPA.half.CMPA = (int)(nextVal*PWMthreshold); // ustawienie rejestru komparatora a //Ap
        EPwm1Regs.CMPB = 0; // ustawienie rejestru komparatora b //Am
        EDIS;
    }
    else {
        /*Set Am, pull-down Ap*/
        EALLOW;
        EPwm1Regs.CMPA.half.CMPA = 0; // ustawienie rejestru komparatora a //Ap
        EPwm1Regs.CMPB = (int)(-nextVal*PWMthreshold); // ustawienie rejestru komparatora b //Am
        EDIS;
    }
}

void setBPWMout(float nextVal){
    if (nextVal>=0){
        /*Set Bp, pull-down Bm*/
        EALLOW;
        EPwm2Regs.CMPA.half.CMPA = (int)(nextVal*PWMthreshold); // ustawienie rejestru komparatora a //Bp
        EPwm2Regs.CMPB = 0; // ustawienie rejestru komparatora b //Bm
        EDIS;
    }
    else {
        /*Set Bm, pull-down Bp*/
        EALLOW;
        EPwm2Regs.CMPA.half.CMPA = 0; // ustawienie rejestru komparatora a //Bp
        EPwm2Regs.CMPB = (int)(-nextVal*PWMthreshold); // ustawienie rejestru komparatora b //Bm
        EDIS;
    }
}

__interrupt void coilsControl()
{
    if (runFlag)
    {
        if (!Tmul)
        {
            currPos++;
            if (!(currPos-arrayLength))//(currPos == arrayLength)
                currPos = 0;
            /*set timer here*/
            if (TadjFlag)
            {
                TinTimer += TincrementStep * TadjFlag;
                if (TinTimer > TinTimerDest && (TadjFlag+1)
                        || TinTimer < TinTimerDest && !(TadjFlag+1))
                    TinTimer = TinTimerDest;
                if (TinTimer == TinTimerDest)
                    T = Tdest;
            }

            CpuTimer0Regs.PRD.all = definePRD(3 - direction, currPos); //define first PRDs remainder (timer)
            Tmul = defineQuotient(3 - direction, currPos); //quotient

//        /*set PWM here for open loop control*/
//        setAPWMout(currTable[1][currPos]);
//        setBPWMout(currTable[2][currPos]);
        }
        else
            Tmul--;
    }
    PieCtrlRegs.PIEACK.bit.ACK1 = 1;
}

__interrupt void currentControl(){
//AdcMirror.ADCRESULT0 & AdcMirror.ADCRESULT8
//    GpioDataRegs.GPBSET.bit.GPIO61 = 1;
    adcA = AdcMirror.ADCRESULT0;
    adcB = AdcMirror.ADCRESULT8;
    adcBiasA = AdcMirror.ADCRESULT1;
    adcBiasB = AdcMirror.ADCRESULT9;

        iA = (adcA-adcBiasA) * A_GAIN;
        iB = (adcB-adcBiasB) * B_GAIN;

        eA = iDest * currTable[0][currPos] - iA;
        eB = iDest * currTable[2-direction][currPos] - iB;
//          eA = iDestTest - iA;
//          eB = iDestTest - iB;

        calculatePI(&regA, eA);
        calculatePI(&regB, eB);

        if (runFlag)
        {
            if (flag_manualPWMmode){
                setAPWMout(manualPWM[0]);
                setBPWMout(manualPWM[1]);
            }
            else{
                /* Coil A */
                setAPWMout(regA.y);
                /* Coil B */
                setBPWMout(regB.y);
            }
        }
        else
        {
            setAPWMout(0);
            setBPWMout(0);
        }

        if (biasMeasurement)
        {
            biasSamplesA[biasSample] = AdcMirror.ADCRESULT0;
            biasSamplesB[biasSample] = AdcMirror.ADCRESULT8;
            biasSample++;
            if (biasSample == biasSampleNum)
            {
                double biasTmpA = 0, biasTmpB = 0;
                for (biasSample = 0; biasSample < biasSampleNum; biasSample++)
                {
                    biasTmpA += biasSamplesA[biasSample];
                    biasTmpB += biasSamplesB[biasSample];
                }
                adcBiasA = biasTmpA * biasSampleNumConst;
                adcBiasB = biasTmpB * biasSampleNumConst;
                biasMeasurement=0;
                biasSample = 0;
                runFlag = runMem;
            }
        }

//        GpioDataRegs.GPBCLEAR.bit.GPIO61 = 1;
    /* Acknowledge INT */

    AdcRegs.ADCTRL2.bit.RST_SEQ1 = 1;         // Reset SEQ1
    AdcRegs.ADCTRL2.bit.RST_SEQ2 = 1;         // Reset SEQ2
    AdcRegs.ADCST.bit.INT_SEQ1_CLR = 1;       // Clear INT SEQ1 bit
    PieCtrlRegs.PIEACK.bit.ACK1 = 1;
}

__interrupt void acquireFromEncoder(void){
    //PIN 61 as CLK; PIN 60 as DATA
    switch (currentBit){
    case 13:
    /* START */
        GpioDataRegs.GPBSET.bit.GPIO61 = 1; //because of pull-up
        CpuTimer2Regs.PRD.all = Tclk;
        CpuTimer2Regs.TCR.bit.TRB = 1; //reload TIM with PRD
        currentBit--;
        break;
    case -1:
    /* DELAY */
        CpuTimer2Regs.PRD.all = delayCycles;
        CpuTimer2Regs.TCR.bit.TRB = 1; //reload TIM with PRD
        GpioDataRegs.GPBCLEAR.bit.GPIO61 = 1;
        for (currentBit=12;currentBit>-1;currentBit--){
            bitVal+=dataBits[currentBit]*qckPow2(currentBit);
        }
        currAngle=bitVal*positionConstant;
        bitVal=0;
        currentBit=13;
        break;
    default:
        if (upDownSSIBit){
            /* ACQUIRE */
            GpioDataRegs.GPBSET.bit.GPIO61=1;
            dataBits[currentBit] = GpioDataRegs.GPBDAT.bit.GPIO60;
            currentBit--;
            upDownSSIBit = 0;
        }
        else{
            GpioDataRegs.GPBCLEAR.bit.GPIO61=1;
            upDownSSIBit = 1;
        }
    }
}

__interrupt void button1(){
    runFlag = !runFlag;
    PieCtrlRegs.PIEACK.all = PIEACK_GROUP1;
}

__interrupt void button2(){
    DINT;
    float a = currTable[0][currPos];
    float b = currTable[2-direction][currPos];
    int newPos = 0;
    direction = -direction;
    while (currTable[0][newPos]!=a && currTable[2-direction][newPos]!=b){
        newPos++;
    }
    currPos = newPos;
    EINT;

    //    if (biasSample==0){
    //        biasMeasurement = 1;
    //        runMem = runFlag;
    //        runFlag=0;
    //    }

    PieCtrlRegs.PIEACK.all = PIEACK_GROUP12;
}

void configurePI(void){
    float T = L / R;
    float K = T / (2.0 * Us/R * tau);
    float kpa = K;
    float kia = kpa / T;
    float ksa = 1.0/kpa;
    float kpb = K;
    float kib = kpb / T;
    float ksb = 1.0/kpb;
    float outBound = 0.99;
    kpa = 1.65;
    kpb = kpa;
    kia = 200.0;
    kib = kia;
    ksa = 1.0/kia;
    ksb = ksa;
    initPI(&regA,kpa,kia,ksa,-outBound,outBound);
    initPI(&regB, kpb, kib, ksb, -outBound, outBound);
}

void configureGPIO(void)
{
    EALLOW;
    /* PWMs */
    GpioCtrlRegs.GPAMUX1.bit.GPIO0 = 1; // ustawienie muxa GPIO0 na wyjscie ePWM1A //Ap <- 1A
    GpioCtrlRegs.GPAMUX1.bit.GPIO1 = 1; // ustawienie muxa GPIO1 na wyjscie ePWM1B //Am <- 1B
    GpioCtrlRegs.GPAMUX1.bit.GPIO2 = 1; // ustawienie muxa GPIO2 na wyjscie ePWM2A //Bp <- 2A
    GpioCtrlRegs.GPAMUX1.bit.GPIO3 = 1; // ustawienie muxa GPIO3 na wyjscie ePWM2B //Bm <- 2B
    GpioCtrlRegs.GPADIR.bit.GPIO0 = 1;  // ustawienie GPIO na tryb wyjscia
    GpioCtrlRegs.GPADIR.bit.GPIO1 = 1;
    GpioCtrlRegs.GPADIR.bit.GPIO2 = 1;
    GpioCtrlRegs.GPADIR.bit.GPIO3 = 1;

    /* Enable coils (for infirm H-bridges) */
    GpioCtrlRegs.GPBMUX2.bit.GPIO60=0; //enable A coil
    GpioCtrlRegs.GPBMUX2.bit.GPIO61=0; //enable B coil
    GpioCtrlRegs.GPBDIR.bit.GPIO60=1; //pins set to out state
    GpioCtrlRegs.GPBDIR.bit.GPIO61=1;
    GpioCtrlRegs.GPBPUD.bit.GPIO60=1; //pull-up disable
    GpioCtrlRegs.GPBPUD.bit.GPIO61=1;
    GpioDataRegs.GPBCLEAR.bit.GPIO60=1; //set bits to 0
    GpioDataRegs.GPBCLEAR.bit.GPIO61=1;

    /* ADC frequency test */
    GpioCtrlRegs.GPBMUX2.bit.GPIO61=0;
    GpioCtrlRegs.GPBDIR.bit.GPIO61=1;
    GpioCtrlRegs.GPBPUD.bit.GPIO61=1;
    GpioDataRegs.GPBSET.bit.GPIO61=1;

    /* LED 1 */
    GpioCtrlRegs.GPAMUX1.bit.GPIO9 = 0x00;
    GpioCtrlRegs.GPADIR.bit.GPIO9 = 1;
    GpioCtrlRegs.GPAPUD.bit.GPIO9 = 1;
    /* LED 2 */
    GpioCtrlRegs.GPAMUX1.bit.GPIO11 = 0x00;
    GpioCtrlRegs.GPADIR.bit.GPIO11 = 1;
    GpioCtrlRegs.GPAPUD.bit.GPIO11 = 1;
    /* LED 3 */
    GpioCtrlRegs.GPBMUX1.bit.GPIO34 = 0x00;
    GpioCtrlRegs.GPBDIR.bit.GPIO34 = 1;
    GpioCtrlRegs.GPBPUD.bit.GPIO34 = 1;
    /* LED 4 */
    GpioCtrlRegs.GPBMUX2.bit.GPIO49 = 0x00;
    GpioCtrlRegs.GPBDIR.bit.GPIO49 = 1;
    GpioCtrlRegs.GPBPUD.bit.GPIO49 = 1;

    /* Button 1 */
    GpioCtrlRegs.GPAPUD.bit.GPIO17=1;
    GpioCtrlRegs.GPAMUX2.bit.GPIO17=0;
    GpioCtrlRegs.GPADIR.bit.GPIO17=0;
    GpioCtrlRegs.GPACTRL.bit.QUALPRD2=255; //sampling period for GPIO17
    GpioCtrlRegs.GPAQSEL2.bit.GPIO17=1; //number of samples taken
    GpioIntRegs.GPIOXINT1SEL.bit.GPIOSEL=17;
    XIntruptRegs.XINT1CR.bit.ENABLE=1;
    XIntruptRegs.XINT1CR.bit.POLARITY=0;
    PieVectTable.XINT1 = &button1;
    PieCtrlRegs.PIEIER1.bit.INTx4=1;

    /* Button 2 */
    GpioCtrlRegs.GPBPUD.bit.GPIO48 = 1;
    GpioCtrlRegs.GPBMUX2.bit.GPIO48 = 0;
    GpioCtrlRegs.GPBDIR.bit.GPIO48 = 0;
    GpioCtrlRegs.GPBCTRL.bit.QUALPRD2=255;
    GpioCtrlRegs.GPBQSEL2.bit.GPIO48=1;
    GpioIntRegs.GPIOXINT3SEL.bit.GPIOSEL = (Uint16)(48%32);
    XIntruptRegs.XINT3CR.bit.ENABLE = 1;
    XIntruptRegs.XINT3CR.bit.POLARITY = 0;
    PieVectTable.XINT3 = &button2;
    PieCtrlRegs.PIEIER12.bit.INTx1=1;
    PieCtrlRegs.PIECTRL.bit.ENPIE=1;

    EDIS;
}

void configurePWM(void){
    EALLOW;
    /* Coil A */
    EPwm1Regs.TBCTL.bit.CLKDIV =  0;    // Dzielnik zegara dla PWMa coil A
    EPwm1Regs.TBCTL.bit.HSPCLKDIV = 0;  // Dodatkowy dzielnik zegara PWMb coil A
    EPwm1Regs.TBCTL.bit.CTRMODE = 2;    // Tryb pracy - up - down
    EPwm1Regs.TBCTL.bit.FREE_SOFT = 3;  // free run
    EPwm1Regs.AQCTLA.bit.CAU=1;         //ustaw wyjscie na 0 przy porownaniu CMPA i zliczanniu w gore //PWMAp
    EPwm1Regs.AQCTLA.bit.CAD=2;         //ustaw wyjscie na 1 przy porownaniu CMPA i zliczanniu w dol  //PWMAp
    EPwm1Regs.AQCTLB.bit.CBU=1;         //ustaw wyjscie na 0 przy porownaniu CMPB i zliczanniu w gore //PWMAm
    EPwm1Regs.AQCTLB.bit.CBD=2;         //ustaw wyjscie na 1 przy porownaniu CMPB i zliczanniu w dol  //PWMAm
    EPwm1Regs.TBPRD = PWMthreshold;     // Okres licznika (wartosc maksymalna licznika)
    EPwm1Regs.TBCTL.bit.CLKDIV = 0;     // set all timer divisors to 1
//    EPwm1Regs.DBCTL.bit.IN_MODE = 2; //dead Time generated on A&B channel
//    EPwm1Regs.DBCTL.bit.OUT_MODE = 3;
//    EPwm1Regs.DBFED = (int) ceil(250/(uC_clockPeriod*0.5e9));
//    EPwm1Regs.DBRED = (int) ceil(250/(uC_clockPeriod*0.5e9));


    EPwm1Regs.ETSEL.bit.SOCASEL = 2;    // set PWMthreshold as SOC trigger
    EPwm1Regs.ETSEL.bit.SOCBSEL = 2;
    EPwm1Regs.ETPS.bit.SOCAPRD = 1;     // generate SOC pulse on every PWMthreshold
    EPwm1Regs.ETPS.bit.SOCBPRD = 1;
    EPwm1Regs.ETSEL.bit.SOCAEN = 1;     // SOC A/B enable on PWM1
    EPwm1Regs.ETSEL.bit.SOCBEN = 1;

    setAPWMout(currTable[0][currPos]);

    /* Coil B */
    EPwm2Regs.TBCTL.bit.CLKDIV =  0;    // Dzielnik zegara dla PWMa coil B
    EPwm2Regs.TBCTL.bit.HSPCLKDIV = 0;  // Dodatkowy dzielnik zegara PWMb coil B
    EPwm2Regs.TBCTL.bit.CTRMODE = 2;    // Tryb pracy - up - down
    EPwm2Regs.TBCTL.bit.FREE_SOFT = 3;  // free run
    EPwm2Regs.AQCTLA.bit.CAU=1;         //ustaw wyjscie na 0 przy porownaniu CMPA i zliczanniu w gore //PWMAp
    EPwm2Regs.AQCTLA.bit.CAD=2;         //ustaw wyjscie na 1 przy porownaniu CMPA i zliczanniu w dol  //PWMAp
    EPwm2Regs.AQCTLB.bit.CBU=1;         //ustaw wyjscie na 0 przy porownaniu CMPB i zliczanniu w gore //PWMAm
    EPwm2Regs.AQCTLB.bit.CBD=2;         //ustaw wyjscie na 1 przy porownaniu CMPB i zliczanniu w dol  //PWMAm
    EPwm2Regs.TBPRD = PWMthreshold;            // Okres licznika (wartosc maksymalna licznika)
//    EPwm2Regs.DBCTL.bit.IN_MODE = 2; //dead Time generated on A&B channel
//    EPwm2Regs.DBCTL.bit.OUT_MODE = 3;
//    EPwm2Regs.DBFED = (int) ceil(250/(uC_clockPeriod*1.0e9));
//    EPwm2Regs.DBRED = (int) ceil(250/(uC_clockPeriod*1.0e9));

    setBPWMout(currTable[2-direction][currPos]);
    EDIS;
}

void configureTimerInterrupts(void){
    InitPieCtrl();
    IER = 0x0000;
    IFR = 0x0000;
    InitPieVectTable();
    EALLOW;
    CpuTimer0Regs.TCR.bit.TSS = 1; //Stop timer
    CpuTimer0Regs.PRD.all = definePRD(0,0); //define first PRDs remainder (timer)
    CpuTimer0Regs.TPR.all = 0;
    Tmul = defineQuotient(0,0); //quotient
    PieVectTable.TINT0 = &coilsControl; //Timer 0 for both coils
    CpuTimer0Regs.TPR.bit.TDDR = 0x00; // set timer prescalers to 1
    CpuTimer0Regs.TPRH.bit.TDDRH = 0x00;
    CpuTimer0Regs.TCR.bit.TIE = 1; //enable timer interrupt
    CpuTimer0Regs.TCR.bit.TRB = 1;
    CpuTimer0Regs.TCR.bit.TSS = 0; //Start timer

    CpuTimer2Regs.TCR.bit.TSS = 1; //Stop timer
    CpuTimer2Regs.PRD.all = Tclk; //start reading ASAP
//    PieVectTable.TINT2 = &acquireFromEncoder; //interrupt definition
    CpuTimer2Regs.TPR.bit.TDDR = 0x00; //prescaler set to 1
    CpuTimer2Regs.TPRH.bit.TDDRH = 0x00;
//    CpuTimer2Regs.TCR.bit.TIE = 1; //enable interrupt
    CpuTimer2Regs.TCR.bit.TRB = 1; //reload PRDH:PRD to TIMH:TIM

    EDIS;
}

void configureADC(void){
/* ADCA2 - coil A; ADCB2 - coil B */
// DO NOT INITIALIZE PIE! ALREADY DONE IN TIMER INTERRUPTS!
// ALL GENERAL SYSTEM MASKS AND PIE GROUPS DISABLED IN initMCU()
//ADCCLKPS = b0000; (for 20*ADCCTRL1) HSPCLK = b101; (for SYSCLK/10) CPS = 1; (for ADCCLK/2 prescale) ==> SYSCLK/20 ==> 12.5 Mhz
    InitAdc();
    EALLOW;
    SysCtrlRegs.HISPCP.bit.HSPCLK = 3;
    AdcRegs.ADCTRL3.bit.ADCCLKPS = 0;
    AdcRegs.ADCTRL1.bit.CPS = 1;
    AdcRegs.ADCTRL1.bit.ACQ_PS = 15; //full SOC duty ==> max acquisition time
    AdcRegs.ADCCHSELSEQ1.bit.CONV00 = 2; //CONV00 reads A2 physical ADC pin
    AdcRegs.ADCCHSELSEQ1.bit.CONV01 = 3; //CONV01 reads A3 physical ADC pin
    AdcRegs.ADCCHSELSEQ3.bit.CONV08 = 10; //CONV08 reads B2 physical ADC pin
    AdcRegs.ADCCHSELSEQ3.bit.CONV09 = 11; //CONV09 reads B3 physical ADC pin
    AdcRegs.ADCTRL1.bit.SEQ_CASC = 0; //dual sequencer mode
    AdcRegs.ADCTRL1.bit.SEQ_OVRD = 0; //disable sequencer override
    AdcRegs.ADCTRL1.bit.CONT_RUN = 0; //continuous conversion mode disable
    AdcRegs.ADCTRL2.bit.EPWM_SOCA_SEQ1 = 1; //enable ePWM SOC for sequencers
    AdcRegs.ADCTRL2.bit.EPWM_SOCB_SEQ2 = 1;
    AdcRegs.ADCMAXCONV.bit.MAX_CONV1 = 1; //sequencers wrap around first of their CONV channels (00 & 08) IF autoconversion is active
    AdcRegs.ADCMAXCONV.bit.MAX_CONV2 = 1;

    PieVectTable.SEQ1INT = &currentControl;

    AdcRegs.ADCTRL2.bit.INT_MOD_SEQ1 = 0; //set INT_SEQ1 on every sequence
    AdcRegs.ADCTRL2.bit.INT_ENA_SEQ1 = 1; //enable SEQ1 interrupt
    AdcRegs.ADCTRL2.bit.SOC_SEQ1 = 1; //start ADC conversion
    AdcRegs.ADCTRL2.bit.SOC_SEQ2 = 1;
    EDIS;
}

void configureEQEP(void){
    EALLOW;
    /* GPIOs */
    GpioCtrlRegs.GPAPUD.bit.GPIO20 = 1;
    GpioCtrlRegs.GPAPUD.bit.GPIO21 = 1;
    GpioCtrlRegs.GPAPUD.bit.GPIO23 = 1;
    GpioCtrlRegs.GPAMUX2.bit.GPIO20 = 1; //eQEP1A
    GpioCtrlRegs.GPAMUX2.bit.GPIO21 = 1; //eQEP1B
    GpioCtrlRegs.GPAMUX2.bit.GPIO23 = 1; //eQEP1I (Z)

    EQep1Regs.QEPCTL.bit.PCRM = 2;  //posCtr reset on first Index edge
    EQep1Regs.QEPCTL.bit.IEL = 3;   //latch Index on Index Event Marker
    EQep1Regs.QCAPCTL.bit.CCPS = 0; //SYSCLK prescaler for eQEP capture timer
    EQep1Regs.QCAPCTL.bit.UPPS = 1; //unit position event for QCPRD measurement



    EDIS;
}

/* OUTDATED */
//void configureRegs(float Us, float tau){
//    float K = L/(2*Us*tau);
//    float T = L/R;
//    float kp = K;
//    float ki = K*Ts/(2*T);
//    float integBound = 1.08*1.5*R/Us;
//    float outBound = 2.5*R/Us;
//    initPIdisc(&regA,kp,ki,-integBound,integBound,-outBound,outBound);
//    initPIdisc(&regB,kp,ki,-integBound,integBound,-outBound,outBound);
//}
/* OUTDATED */

void initMCU(void){
    InitSysCtrl();
//    memcpy(&currTable,&fullStep,sizeof currTable);
//    memcpy(&currTable,&halfStep,sizeof currTable);
//    memcpy(&currTable, &normal_normal_x4, sizeof currTable);
//    memcpy(&currTable, &normal_pcos_x4, sizeof currTable);
//    memcpy(&currTable, &normal_relative_weakRev_x4, sizeof currTable);
//    memcpy(&currTable, &normal_relative_strongRev_x4, sizeof currTable);
//    memcpy(&currTable, &Lebesgue_pcos_x4, sizeof currTable);
//    memcpy(&currTable, &Lebesgue_normal_x4, sizeof currTable);
//    memcpy(&currTable,&normal_normal_x8,sizeof currTable);
//    memcpy(&currTable,&normal_pcos_x8,sizeof currTable);
//    memcpy(&currTable, &normal_relative_weakRev_x8, sizeof currTable);
//    memcpy(&currTable, &normal_relative_strongRev_x8, sizeof currTable);
//    memcpy(&currTable,&Lebesgue_pcos_x8,sizeof currTable);
//    memcpy(&currTable,&Lebesgue_normal_x8,sizeof currTable);
//    memcpy(&currTable, &normal_normal_x16, sizeof currTable);
//    memcpy(&currTable, &normal_pcos_x16, sizeof currTable);
//    memcpy(&currTable, &normal_relative_weakRev_x16, sizeof currTable);
//    memcpy(&currTable, &normal_relative_strongRev_x16, sizeof currTable);
//    memcpy(&currTable, &Lebesgue_pcos_x16, sizeof currTable);
//    memcpy(&currTable, &Lebesgue_normal_x16, sizeof currTable);
//    memcpy(&currTable, &normal_normal_x32, sizeof currTable);
    memcpy(&currTable, &normal_pcos_x32, sizeof currTable);
//    memcpy(&currTable, &normal_relative_weakRev_x32, sizeof currTable);
//    memcpy(&currTable, &normal_relative_strongRev_x32, sizeof currTable);
//    memcpy(&currTable, &Lebesgue_pcos_x32, sizeof currTable);
//    memcpy(&currTable, &Lebesgue_normal_x32, sizeof currTable);

    configurePI();
    TinTimer = (long int)ceil(T*150e6*timerDivision);
    DINT;
    configureTimerInterrupts();
    configurePWM();
    configureGPIO();
    configureADC();
    EALLOW;
    /* Additional register config goes here*/
    PieCtrlRegs.PIECTRL.bit.ENPIE = 1;
    PieCtrlRegs.PIEIER1.bit.INTx1 = 1;
    PieCtrlRegs.PIEIER1.bit.INTx7 = 1;

    IER |= M_INT1;
    IER |= M_INT12;
    IER |= M_INT14;
    EINT; // enable global interrupts
    ERTM; // enable real-time global interrupts
    EDIS;

    CpuTimer2Regs.TCR.bit.TSS = 0; //start Timer 2 for encoder data acquisition
}

void main(void)
{
    initMCU();
    biasMeasurement = 1;
    runMem = 0;
	while(1){
	    Tdest = RPMtoT/RPMdest;
	    if(Tdest!=T){
	        if (!runFlag){
	            TadjFlag=0;
	            T = Tdest;
	            TinTimerDest = (long int) ceil(Tdest*150e6*timerDivision);
	            TinTimer = TinTimerDest;
	        }
	        else{
	            DINT;
                TinTimerDest = (long int) ceil(Tdest*150e6*timerDivision);
                if (TinTimerDest>=TinTimer)
                    TadjFlag = 1;
                else
                    TadjFlag = -1;
                if (RPMdest < 60 || RPMdest > 400)
                {
                    TincrementStep = (int) ceil(TincrementStepConst * Tdest * TtoRPM);
                }
                else
                    TincrementStep = 200;
                EINT;
            }
	    }
	    else TadjFlag = 0;

	    if(!runFlag && (adjustPIa || adjustPIb || adjustPIall)){
//	        float T = L / R;
//	        float K = T / (2.0 * Us/R * tau);
	        float kp = newP;
	        float ki = newI;
	        float ks = newS/kp;
	        if (adjustPIa) changePI(&regA, kp, ki, ks);
	        if (adjustPIb) changePI(&regB, kp, ki, ks);
	        if (adjustPIall){
	            changePI(&regA, kp, ki, ks);
	            changePI(&regB, kp, ki, ks);
	        }
	    }
	}
}
