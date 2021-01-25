/*
 * system_setup.c
 *
 *  Created on: 24 sty 2021
 *      Author: Bogdan
 */

#include "system_externs.h"
#include "master_header.h"

void setupTimers(void){
    EALLOW;
    CpuTimer0Regs.TCR.bit.TSS = 1;  //stop timers
    CpuTimer1Regs.TCR.bit.TSS = 1;
    CpuTimer2Regs.TCR.bit.TSS = 1;

//    float T = 1.0/state.tim_freq[0];
//    TIMER_PRD[0] = definePRD(T);                //define first PRDs remainder (timer)
//    CpuTimer0Regs.PRD.all = TIMER_PRD[0];
//    TIMER_multiplier[0] = defineQuotient(T);    //quotient
//    TIMER_multiplierTmp[0] = TIMER_multiplier[0];
//    T = 1.0/state.tim_freq[1];
//    TIMER_PRD[1] = definePRD(T);
//    CpuTimer1Regs.PRD.all = TIMER_PRD[1];
//    TIMER_multiplier[1] = defineQuotient(T);
//    TIMER_multiplierTmp[1] = TIMER_multiplier[1];
//    T = 1.0/state.tim_freq[2];
//    TIMER_PRD[2] = definePRD(T);
//    CpuTimer2Regs.PRD.all = TIMER_PRD[2];
//    TIMER_multiplier[2] = defineQuotient(T);
//    TIMER_multiplierTmp[2] = TIMER_multiplier[2];

    CpuTimer0Regs.TPR.bit.TDDR = 0x00;   // no timer prescalers
    CpuTimer0Regs.TPRH.bit.TDDRH = 0x00;
    CpuTimer1Regs.TPR.bit.TDDR = 0x00;
    CpuTimer1Regs.TPRH.bit.TDDRH = 0x00;
    CpuTimer2Regs.TPR.bit.TDDR = 0x00;
    CpuTimer2Regs.TPRH.bit.TDDRH = 0x00;

    setTimerFreq(0,state.tim_freq[0]);
    setTimerFreq(1,state.tim_freq[1]);
    setTimerFreq(2,state.tim_freq[2]);

    XIntruptRegs.XNMICR.bit.SELECT = 0;  //mux on INT13 set to pass Timer 1 interrupt

    CpuTimer0Regs.TCR.bit.TIE = 1;  //enable timer interrupts
    CpuTimer1Regs.TCR.bit.TIE = 1;
    CpuTimer2Regs.TCR.bit.TIE = 1;
    CpuTimer0Regs.TCR.bit.TRB = 1;
    CpuTimer1Regs.TCR.bit.TRB = 1;
    CpuTimer2Regs.TCR.bit.TRB = 1;

    CpuTimer0Regs.TCR.bit.TSS = 0;  //start timers
    CpuTimer1Regs.TCR.bit.TSS = 0;
    CpuTimer2Regs.TCR.bit.TSS = 0;
    EDIS;
}

void setupUART(){
    EALLOW;

    //RX GPIO Conf
    GpioCtrlRegs.GPAMUX2.bit.GPIO28=1;
    GpioCtrlRegs.GPAPUD.bit.GPIO28=0;
    GpioCtrlRegs.GPADIR.bit.GPIO28=0;

    //TX GPIO Conf
    GpioCtrlRegs.GPAMUX2.bit.GPIO29=1;
    GpioCtrlRegs.GPAPUD.bit.GPIO29=1;
    GpioCtrlRegs.GPADIR.bit.GPIO29=1;

    SysCtrlRegs.PCLKCR0.bit.SCIAENCLK = 1;

    SciaRegs.SCIFFTX.bit.SCIRST=0;
    SciaRegs.SCICTL1.bit.SWRESET=0; //enable SCI reset mode
    SciaRegs.SCIFFRX.bit.RXFIFORESET=0;

    SysCtrlRegs.LOSPCP.bit.LSPCLK=0; //sysclk/1
    SciaRegs.SCIHBAUD=0x01;
    SciaRegs.SCILBAUD=0x45;

    SciaRegs.SCICCR.bit.STOPBITS=0;
    SciaRegs.SCICCR.bit.PARITY=0;
    SciaRegs.SCICCR.bit.PARITYENA=1; //aktualnie jest 8o1
    SciaRegs.SCICCR.bit.LOOPBKENA=0;
    SciaRegs.SCICCR.bit.ADDRIDLE_MODE=0;
    SciaRegs.SCICCR.bit.SCICHAR=7;

    SciaRegs.SCIFFTX.bit.SCIRST=1; //disable SCI TX reset mode
    SciaRegs.SCICTL1.bit.TXENA=1;  //enable tx

    SciaRegs.SCICTL1.bit.RXENA=1;
    SciaRegs.SCIFFRX.bit.RXFIFORESET=1;
    SciaRegs.SCIRXST.bit.RXRDY=1;
    SciaRegs.SCICTL2.bit.RXBKINTENA=1;

    SciaRegs.SCICTL1.bit.SWRESET=1; //disable SCI reset mode
    EDIS;
}

void setupPWM(void){
    EALLOW;
    /* Basic config */
    GpioCtrlRegs.GPAMUX1.bit.GPIO0 = 1;  // set mux GPIO0  as ePWM1A
    GpioCtrlRegs.GPAMUX1.bit.GPIO1 = 1;  // set mux GPIO1  as ePWM1B
    GpioCtrlRegs.GPAMUX1.bit.GPIO2 = 1;  // set mux GPIO2  as ePWM2A
    GpioCtrlRegs.GPAMUX1.bit.GPIO3 = 1;  // set mux GPIO3  as ePWM2B
    GpioCtrlRegs.GPAMUX1.bit.GPIO4 = 1;  // set mux GPIO4  as ePWM3A
    GpioCtrlRegs.GPAMUX1.bit.GPIO5 = 1;  // set mux GPIO5  as ePWM3B
    GpioCtrlRegs.GPAMUX1.bit.GPIO6 = 1;  // set mux GPIO4  as ePWM4A
    GpioCtrlRegs.GPAMUX1.bit.GPIO7 = 1;  // set mux GPIO7  as ePWM4B
    GpioCtrlRegs.GPAMUX1.bit.GPIO8 = 1;  // set mux GPIO8  as ePWM5A
    GpioCtrlRegs.GPAMUX1.bit.GPIO9 = 1;  // set mux GPIO9  as ePWM5B
    GpioCtrlRegs.GPAMUX1.bit.GPIO10 = 1; // set mux GPIO10 as ePWM6A
    GpioCtrlRegs.GPAMUX1.bit.GPIO11 = 1; // set mux GPIO11 as ePWM6B

    GpioCtrlRegs.GPADIR.bit.GPIO0 = 1;   // set PWM GPIOs as output
    GpioCtrlRegs.GPADIR.bit.GPIO1 = 1;   //...
    GpioCtrlRegs.GPADIR.bit.GPIO2 = 1;   //...
    GpioCtrlRegs.GPADIR.bit.GPIO3 = 1;   //...
    GpioCtrlRegs.GPADIR.bit.GPIO4 = 1;   //...
    GpioCtrlRegs.GPADIR.bit.GPIO5 = 1;   //...
    GpioCtrlRegs.GPADIR.bit.GPIO6 = 1;   //...
    GpioCtrlRegs.GPADIR.bit.GPIO7 = 1;   //...
    GpioCtrlRegs.GPADIR.bit.GPIO8 = 1;   //...
    GpioCtrlRegs.GPADIR.bit.GPIO9 = 1;   //...
    GpioCtrlRegs.GPADIR.bit.GPIO10 = 1;  //...
    GpioCtrlRegs.GPADIR.bit.GPIO11 = 1;  //...


    /* ePWM 1 */
    EPwm1Regs.TBCTL.bit.CTRMODE = 2;    // Mode: up - down
    EPwm1Regs.TBCTL.bit.FREE_SOFT = 3;  // free run
    EPwm1Regs.AQCTLA.bit.CAU=1;         // set output to 0 when CMPA==PWM and counting up
    EPwm1Regs.AQCTLA.bit.CAD=2;         // set output to 1 when CMPA==PWM and counting down
    EPwm1Regs.AQCTLB.bit.CBU=1;         // set output to 0 when CMPB==PWM and counting up
    EPwm1Regs.AQCTLB.bit.CBD=2;         // set output to 1 when CMPB==PWM and counting down
    EPwm1Regs.DBCTL.bit.IN_MODE = 0;    // both signals depend on channel A
    EPwm1Regs.DBCTL.bit.OUT_MODE = 3;   // allow full dead time usage
    EPwm1Regs.DBCTL.bit.POLSEL = 2;     // active high complementary mod
    EPwm1Regs.TZSEL.bit.OSHT6 = 1;      //enable one-shot trip zone on PB1
    EPwm1Regs.TZCTL.bit.TZA = 2;        //force channel A to low state on trip zone
    EPwm1Regs.TZCTL.bit.TZB = 2;        //force channel B to low state on trip zone

    /* ePWM 2 */
    EPwm2Regs.TBCTL.bit.CTRMODE = 2;    // Mode: up - down
    EPwm2Regs.TBCTL.bit.FREE_SOFT = 3;  // free run
    EPwm2Regs.AQCTLA.bit.CAU=1;         // set output to 0 when CMPA==PWM and counting up
    EPwm2Regs.AQCTLA.bit.CAD=2;         // set output to 1 when CMPA==PWM and counting down
    EPwm2Regs.AQCTLB.bit.CBU=1;         // set output to 0 when CMPB==PWM and counting up
    EPwm2Regs.AQCTLB.bit.CBD=2;         // set output to 1 when CMPB==PWM and counting down
    EPwm2Regs.DBCTL.bit.IN_MODE = 0;    // both signals depend on channel A
    EPwm2Regs.DBCTL.bit.OUT_MODE = 3;   // allow full dead time usage
    EPwm2Regs.DBCTL.bit.POLSEL = 2;     // active high complementary mod
    EPwm2Regs.TZSEL.bit.OSHT6 = 1;      //enable one-shot trip zone on PB1
    EPwm2Regs.TZCTL.bit.TZA = 2;        //force channel A to low state on trip zone
    EPwm2Regs.TZCTL.bit.TZB = 2;        //force channel B to low state on trip zone

    /* ePWM 3 */
    EPwm3Regs.TBCTL.bit.CTRMODE = 2;    // Mode: up - down
    EPwm3Regs.TBCTL.bit.FREE_SOFT = 3;  // free run
    EPwm3Regs.AQCTLA.bit.CAU=1;         // set output to 0 when CMPA==PWM and counting up
    EPwm3Regs.AQCTLA.bit.CAD=2;         // set output to 1 when CMPA==PWM and counting down
    EPwm3Regs.AQCTLB.bit.CBU=1;         // set output to 0 when CMPB==PWM and counting up
    EPwm3Regs.AQCTLB.bit.CBD=2;         // set output to 1 when CMPB==PWM and counting down
    EPwm3Regs.DBCTL.bit.IN_MODE = 0;    // both signals depend on channel A
    EPwm3Regs.DBCTL.bit.OUT_MODE = 3;   // allow full dead time usage
    EPwm3Regs.DBCTL.bit.POLSEL = 2;     // active high complementary mod
    EPwm3Regs.TZSEL.bit.OSHT6 = 1;      //enable one-shot trip zone on PB1
    EPwm3Regs.TZCTL.bit.TZA = 2;        //force channel A to low state on trip zone
    EPwm3Regs.TZCTL.bit.TZB = 2;        //force channel B to low state on trip zone

    /* ePWM 4 */
    EPwm4Regs.TBCTL.bit.CTRMODE = 2;    // Mode: up - down
    EPwm4Regs.TBCTL.bit.FREE_SOFT = 3;  // free run
    EPwm4Regs.AQCTLA.bit.CAU=1;         // set output to 0 when CMPA==PWM and counting up
    EPwm4Regs.AQCTLA.bit.CAD=2;         // set output to 1 when CMPA==PWM and counting down
    EPwm4Regs.AQCTLB.bit.CBU=1;         // set output to 0 when CMPB==PWM and counting up
    EPwm4Regs.AQCTLB.bit.CBD=2;         // set output to 1 when CMPB==PWM and counting down
    EPwm4Regs.DBCTL.bit.IN_MODE = 0;    // both signals depend on channel A
    EPwm4Regs.DBCTL.bit.OUT_MODE = 3;   // allow full dead time usage
    EPwm4Regs.DBCTL.bit.POLSEL = 2;     // active high complementary mod
    EPwm4Regs.TZSEL.bit.OSHT6 = 1;      //enable one-shot trip zone on PB1
    EPwm4Regs.TZCTL.bit.TZA = 2;        //force channel A to low state on trip zone
    EPwm4Regs.TZCTL.bit.TZB = 2;        //force channel B to low state on trip zone

    /* ePWM 5 */
    EPwm5Regs.TBCTL.bit.CTRMODE = 2;    // Mode: up - down
    EPwm5Regs.TBCTL.bit.FREE_SOFT = 3;  // free run
    EPwm5Regs.AQCTLA.bit.CAU=1;         // set output to 0 when CMPA==PWM and counting up
    EPwm5Regs.AQCTLA.bit.CAD=2;         // set output to 1 when CMPA==PWM and counting down
    EPwm5Regs.AQCTLB.bit.CBU=1;         // set output to 0 when CMPB==PWM and counting up
    EPwm5Regs.AQCTLB.bit.CBD=2;         // set output to 1 when CMPB==PWM and counting down
    EPwm5Regs.DBCTL.bit.IN_MODE = 0;    // both signals depend on channel A
    EPwm5Regs.DBCTL.bit.OUT_MODE = 3;   // allow full dead time usage
    EPwm5Regs.DBCTL.bit.POLSEL = 2;     // active high complementary mod
    EPwm5Regs.TZSEL.bit.OSHT6 = 1;      //enable one-shot trip zone on PB1
    EPwm5Regs.TZCTL.bit.TZA = 2;        //force channel A to low state on trip zone
    EPwm5Regs.TZCTL.bit.TZB = 2;        //force channel B to low state on trip zone

    /* ePWM 6 */
    EPwm6Regs.TBCTL.bit.CTRMODE = 2;    // Mode: up - down
    EPwm6Regs.TBCTL.bit.FREE_SOFT = 3;  // free run
    EPwm6Regs.AQCTLA.bit.CAU=1;         // set output to 0 when CMPA==PWM and counting up
    EPwm6Regs.AQCTLA.bit.CAD=2;         // set output to 1 when CMPA==PWM and counting down
    EPwm6Regs.AQCTLB.bit.CBU=1;         // set output to 0 when CMPB==PWM and counting up
    EPwm6Regs.AQCTLB.bit.CBD=2;         // set output to 1 when CMPB==PWM and counting down
    EPwm6Regs.DBCTL.bit.IN_MODE = 0;    // both signals depend on channel A
    EPwm6Regs.DBCTL.bit.OUT_MODE = 3;   // allow full dead time usage
    EPwm6Regs.DBCTL.bit.POLSEL = 2;     // active high complementary mod
    EPwm6Regs.TZSEL.bit.OSHT6 = 1;      //enable one-shot trip zone on PB1
    EPwm6Regs.TZCTL.bit.TZA = 2;        //force channel A to low state on trip zone
    EPwm6Regs.TZCTL.bit.TZB = 2;        //force channel B to low state on trip zone

    /* Define PWM PRDs,CLKDIVs,HSPCLKDIVs,DEADTIMEs */
    int i;
    for (i=0;i<6;++i){
        definePWM_DIVSandPRD(state.pwm_freq[i], i);
        defineDeadBand(500.0e-9, i);
    }
    /* Initialize PWM counters */
    PWM_setDuty();
    EDIS;
}

void setupADC(void){
    //6.25 Mhz conversion rate
    InitAdc();
    EALLOW;
    SysCtrlRegs.HISPCP.bit.HSPCLK = 6;
    AdcRegs.ADCTRL3.bit.ADCCLKPS = 0;
    AdcRegs.ADCTRL1.bit.CPS = 1;
    AdcRegs.ADCTRL1.bit.ACQ_PS = 15; //full SOC duty ==> max acquisition time
    AdcRegs.ADCCHSELSEQ1.bit.CONV00 = 0; //CONV00 reads A0 physical ADC pin
    AdcRegs.ADCCHSELSEQ1.bit.CONV01 = 1; //CONV01 reads A1 physical ADC pin
    AdcRegs.ADCTRL1.bit.SEQ_CASC = 0; //dual sequencer mode
    AdcRegs.ADCTRL1.bit.SEQ_OVRD = 0; //disable sequencer override
    AdcRegs.ADCTRL1.bit.CONT_RUN = 0; //continuous conversion mode disable
    AdcRegs.ADCMAXCONV.bit.MAX_CONV1 = 1; //sequencer wraps around second of its CONV channel (01) IF autoconversion is active

    AdcRegs.ADCTRL2.bit.EPWM_SOCA_SEQ1 = 0; //disable ePWM SOC for sequencers
    AdcRegs.ADCTRL2.bit.EXT_SOC_SEQ1 = 0;   //disable external start-of-conversion init

    AdcRegs.ADCTRL2.bit.INT_MOD_SEQ1 = 0; //set INT_SEQ1 on every sequence
    AdcRegs.ADCTRL2.bit.INT_ENA_SEQ1 = 1; //enable SEQ1 interrupt
    AdcRegs.ADCTRL2.bit.SOC_SEQ1 = 1; //start ADC conversion
    EDIS;
}

void setupInterrupts(){
    DINT;
    InitPieCtrl();
    IER=0x0000;
    IFR=0x0000;
    InitPieVectTable();
    EALLOW;
    /* INTERRUPT VECTORS */
        PieVectTable.SCIRXINTA = &SCI_RX;  //UART
        PieVectTable.TINT0 = &TIMER0INT;   //TIMER 0
        PieVectTable.XINT13 = &TIMER1INT;  //TIMER 1
        PieVectTable.TINT2 = &TIMER2INT;   //TIMER 2
        PieVectTable.XINT1 = &BUTTON1INT;  //BUTTON 1
        PieVectTable.XINT3 = &BUTTON2INT;  //BUTTON 2
        PieVectTable.XINT2 = &ENCODERINT;  //HEX ENCODER
        PieVectTable.SEQ1INT = &ADCINT;    //ADC SEQ1
    /* INTERRUPT ENABLE REGISTERS : CHANNELS */
        PieCtrlRegs.PIEIER1.bit.INTx7 = 1; //TIMER 0
        //PieCtrlRegs.PIEIER8.bit.INTx5 = 1; //SCIC RX
        //PieCtrlRegs.PIEIER8.bit.INTx6 = 1; //SCIC TX
        PieCtrlRegs.PIEIER9.bit.INTx1=1;   //SCIA RX
        //PieCtrlRegs.PIEIER9.bit.INTx2=1; //SCIA TX
        PieCtrlRegs.PIEIER1.bit.INTx4 = 1; //PB1
        PieCtrlRegs.PIEIER12.bit.INTx1 = 1;//PB2
        PieCtrlRegs.PIEIER1.bit.INTx5 = 1; //HEX ENCODER
        PieCtrlRegs.PIEIER1.bit.INTx1 = 1; //ADC SEQ1

    /* INTERRUPT ENABLE REGISTERS : GROUPS */
        IER|=M_INT1;                       //TIMER 0, ENC, PB1,
        IER|=M_INT9;                       //       ,    ,    , SCIA
        IER|=M_INT12;                      //       ,    , PB2,
        IER|=M_INT13;                      //TIMER 1,    ,    ,
        IER|=M_INT14;                      //TIMER 2,    ,    ,
        //IER|=M_INT8;                       //       ,    ,    , SCIC
    EINT;
    ERTM;
    EDIS;
}


void setupGPIO(){
    EALLOW;
    /* GPIO input qualifiers */
    GpioCtrlRegs.GPACTRL.bit.QUALPRD1 = 255;   //sampling period for GPIO12:15 (hex encoder)
    GpioCtrlRegs.GPACTRL.bit.QUALPRD2 = 255;   //sampling period for GPIO17 (PB1)
    GpioCtrlRegs.GPBCTRL.bit.QUALPRD2 = 255;   //sampling period for GPIO17 (PB1)
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
    GpioCtrlRegs.GPAPUD.bit.GPIO17 = 1;
    GpioCtrlRegs.GPAMUX2.bit.GPIO17 = 3;       //TripZone6
    GpioCtrlRegs.GPADIR.bit.GPIO17 = 0;
    GpioCtrlRegs.GPAQSEL2.bit.GPIO17 = 2;      //6 samples taken
    GpioIntRegs.GPIOXINT1SEL.bit.GPIOSEL = 17;
    XIntruptRegs.XINT1CR.bit.ENABLE = 1;
    XIntruptRegs.XINT1CR.bit.POLARITY = 3;
    /* Button 2 */
    GpioCtrlRegs.GPBPUD.bit.GPIO48 = 1;
    GpioCtrlRegs.GPBMUX2.bit.GPIO48 = 0;
    GpioCtrlRegs.GPBDIR.bit.GPIO48 = 0;
    GpioCtrlRegs.GPBQSEL2.bit.GPIO48 = 2;
    GpioIntRegs.GPIOXINT3SEL.bit.GPIOSEL = (Uint16)(48 % 32);
    XIntruptRegs.XINT3CR.bit.ENABLE = 1;
    XIntruptRegs.XINT3CR.bit.POLARITY = 3;
    /* Hex encoder */
    GpioCtrlRegs.GPAPUD.bit.GPIO12 = 1;
    GpioCtrlRegs.GPAMUX1.bit.GPIO12 = 0;
    GpioCtrlRegs.GPADIR.bit.GPIO12 = 0;
    GpioCtrlRegs.GPAQSEL1.bit.GPIO12 = 2;
    GpioIntRegs.GPIOXINT2SEL.bit.GPIOSEL = 12;  //LSB triggers hex interrupt
    XIntruptRegs.XINT2CR.bit.ENABLE = 1;
    XIntruptRegs.XINT2CR.bit.POLARITY = 3;      //any change of LSB should trigger interrupt

    GpioCtrlRegs.GPAPUD.bit.GPIO13 = 1;
    GpioCtrlRegs.GPAMUX1.bit.GPIO13 = 0;
    GpioCtrlRegs.GPADIR.bit.GPIO13 = 0;
    GpioCtrlRegs.GPAQSEL1.bit.GPIO13 = 2;

    GpioCtrlRegs.GPAPUD.bit.GPIO14 = 1;
    GpioCtrlRegs.GPAMUX1.bit.GPIO14 = 0;
    GpioCtrlRegs.GPADIR.bit.GPIO14 = 0;
    GpioCtrlRegs.GPAQSEL1.bit.GPIO14 = 2;

    GpioCtrlRegs.GPAPUD.bit.GPIO15 = 1;
    GpioCtrlRegs.GPAMUX1.bit.GPIO15 = 0;
    GpioCtrlRegs.GPADIR.bit.GPIO15 = 0;
    GpioCtrlRegs.GPAQSEL1.bit.GPIO15 = 2;

    /* *END* */
    EDIS;
}

void setupTMSstate(){
    int i;
    for(i=0;i<6;++i){
        if (i<2)
            state.led_gpio[i] = 1;
        if (i<3)
            state.tim_freq[i] = pow(0.1,(float)(i-1));
        state.pwm_duty[5-i] = 0.1/6.0*i;
        state.pwm_freq[i] = 10.0*pow(10.0,i*0.5);
        state.pwm_deadtime[i] = 500.0e-9;
    }
    state.tim_freq[0] = 10000.0;
    LED3_ON;
    state.led_gpio[0] = 1;
    LED4_ON;
    state.led_gpio[1] = 1;
    state.pb_gpio[0] = PB1_STATE;
    state.pb_gpio[1] = PB2_STATE;
}

void initMCU(void){
    InitSysCtrl();
    setupTMSstate();  //BEFORE interrupts!
    setupInterrupts();
    setupGPIO();
    setupUART();
    setupTimers();
    setupPWM();
    setupADC();
    EALLOW;
    PieCtrlRegs.PIECTRL.bit.ENPIE=1;
    EINT; // enable global interrupts
    ERTM; // enable real-time global interrupts
    EDIS;
    state.pb_gpio[0] = PB1_STATE;
    state.pb_gpio[1] = PB2_STATE;
    readEncoder();
}


