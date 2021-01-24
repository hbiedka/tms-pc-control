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

    TIMER_PRD[0] = definePRD(60.0);                //define first PRDs remainder (timer)
    CpuTimer0Regs.PRD.all = TIMER_PRD[0];
    TIMER_multiplier[0] = defineQuotient(60.0);    //quotient
    TIMER_multiplierTmp[0] = TIMER_multiplier[0];
    TIMER_PRD[1] = definePRD(6.0);
    CpuTimer1Regs.PRD.all = TIMER_PRD[1];
    TIMER_multiplier[1] = defineQuotient(6.0);
    TIMER_multiplierTmp[1] = TIMER_multiplier[1];
    TIMER_PRD[2] = definePRD(1.0);
    CpuTimer2Regs.PRD.all = TIMER_PRD[2];
    TIMER_multiplier[2] = defineQuotient(1.0);
    TIMER_multiplierTmp[2] = TIMER_multiplier[2];

    CpuTimer0Regs.TPR.bit.TDDR = 0x00;   // no timer prescalers
    CpuTimer0Regs.TPRH.bit.TDDRH = 0x00;
    CpuTimer1Regs.TPR.bit.TDDR = 0x00;
    CpuTimer1Regs.TPRH.bit.TDDRH = 0x00;
    CpuTimer2Regs.TPR.bit.TDDR = 0x00;
    CpuTimer2Regs.TPRH.bit.TDDRH = 0x00;

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


void setupInterrupts(){
    DINT;
    InitPieCtrl();
    InitPieVectTable();
    EALLOW;
    IER=0;
    IFR=0;
    PieCtrlRegs.PIECTRL.bit.ENPIE=1;
    /* INTERRUPT VECTORS */
        PieVectTable.SCIRXINTA=&SCI_RX;    //UART
        PieVectTable.TINT0 = &TIMER0INT;   //TIMER 0
        PieVectTable.XINT13 = &TIMER1INT;  //TIMER 1
        PieVectTable.TINT2 = &TIMER2INT;   //TIMER 2
    /* INTERRUPT ENABLE REGISTERS : CHANNELS */
        PieCtrlRegs.PIEIER1.bit.INTx7 = 1; //TIMER 0
        //PieCtrlRegs.PIEIER8.bit.INTx5 = 1; //SCIC RX
        //PieCtrlRegs.PIEIER8.bit.INTx6 = 1; //SCIC TX
        PieCtrlRegs.PIEIER9.bit.INTx1=1;   //SCIA RX
        //PieCtrlRegs.PIEIER9.bit.INTx2=1;   //SCIA TX
    /* INTERRUPT ENABLE REGISTERS : GROUPS */
        IER|=M_INT1;                       //TIMER 0
        IER|=M_INT9;                       //SCIA
        IER|=M_INT13;                      //TIMER 1
        IER|=M_INT14;                      //TIMER 2
    EINT;
    ERTM;
    EDIS;
}


void setupGPIO(){

}

void initMCU(void){
    InitSysCtrl();
    setupGPIO();      //BEFORE interrupts!
    setupInterrupts();
    setupUART();
    setupTimers();
    //status LED conf.
    EALLOW;
    GpioCtrlRegs.GPAMUX1.bit.GPIO9=0;
    GpioCtrlRegs.GPAPUD.bit.GPIO9=1;
    GpioCtrlRegs.GPADIR.bit.GPIO9=1;
    EDIS;
}


