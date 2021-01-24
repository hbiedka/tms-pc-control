/*
 * tms_setup.c
 *
 *  Created on: 24 sty 2021
 *      Author: Bogdan
 */

#include "system_externs.h"
#include "master_header.h"

void setupTimers(void){
    EALLOW;
    CpuTimer0Regs.TCR.bit.TSS = 1;            //stop timers
    CpuTimer1Regs.TCR.bit.TSS = 1;
    CpuTimer2Regs.TCR.bit.TSS = 1;

    CpuTimer0Regs.PRD.all = definePRD(0.5);   //define first PRDs remainder (timer)
    Timer_Multiplier[0] = defineQuotient(0.5);//quotient
    CpuTimer1Regs.PRD.all = definePRD(0.5);
    Timer_Multiplier[1] = defineQuotient(0.5);
    CpuTimer2Regs.PRD.all = definePRD(0.5);
    Timer_Multiplier[2] = defineQuotient(0.5);

    CpuTimer0Regs.TPR.bit.TDDR = 0x00;        // no timer prescalers
    CpuTimer0Regs.TPRH.bit.TDDRH = 0x00;
    CpuTimer1Regs.TPR.bit.TDDR = 0x00;
    CpuTimer1Regs.TPRH.bit.TDDRH = 0x00;
    CpuTimer2Regs.TPR.bit.TDDR = 0x00;
    CpuTimer2Regs.TPRH.bit.TDDRH = 0x00;

    XIntruptRegs.XNMICR.bit.SELECT = 0;       //mux on INT13 set to pass Timer 1 interrupt

    CpuTimer0Regs.TCR.bit.TIE = 1;            //enable timer interrupts
    CpuTimer1Regs.TCR.bit.TIE = 1;
    CpuTimer2Regs.TCR.bit.TIE = 1;
    CpuTimer0Regs.TCR.bit.TRB = 1;
    CpuTimer1Regs.TCR.bit.TRB = 1;
    CpuTimer2Regs.TCR.bit.TRB = 1;

    CpuTimer0Regs.TCR.bit.TSS = 0;            //start timers
    CpuTimer1Regs.TCR.bit.TSS = 0;
    CpuTimer2Regs.TCR.bit.TSS = 0;
    EDIS;
}

void setupUART(){
    EALLOW;

    //RX GPIO Conf
    GpioCtrlRegs.GPAMUX2.bit.GPIO28=1;
    GpioCtrlRegs.GPAPUD.bit.GPIO28=1;
    GpioCtrlRegs.GPADIR.bit.GPIO28=1;

    //TX GPIO Conf
    GpioCtrlRegs.GPAMUX2.bit.GPIO29=1;
    GpioCtrlRegs.GPAPUD.bit.GPIO29=0;
    GpioCtrlRegs.GPADIR.bit.GPIO29=0;

    SysCtrlRegs.PCLKCR0.bit.SCICENCLK = 1;

    SciaRegs.SCIFFTX.bit.SCIRST=0;
    SciaRegs.SCICTL1.bit.SWRESET=0; //enable SCI reset mode
    SciaRegs.SCIFFRX.bit.RXFIFORESET=0;

    SysCtrlRegs.LOSPCP.bit.LSPCLK=0; //sysclk/1
    SciaRegs.SCIHBAUD=0x01;
    SciaRegs.SCILBAUD=0x45;

    SciaRegs.SCICCR.bit.STOPBITS=0;
    SciaRegs.SCICCR.bit.PARITY=0;
    SciaRegs.SCICCR.bit.PARITYENA=1; //aktualnie jest 8n1, mo�na zmieni� na 8o1
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
    PieCtrlRegs.PIEIER9.bit.INTx1=1;
    /* INTERRUPT VECTORS */
    PieVectTable.SCIRXINTA=&SCI_RX;   //UART
    PieVectTable.TINT0 = &TIMER0INT;  //TIMER 0
    PieVectTable.XINT13 = &TIMER1INT; //TIMER 1
    PieVectTable.TINT2 = &TIMER2INT;  //TIMER 2
    /* INTERRUPT ENABLE REGISTERS */
    IER|=M_INT1;
    IER|=M_INT8;
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


