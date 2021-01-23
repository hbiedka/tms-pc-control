#include "DSP28x_Project.h"
#include "math.h"
#include "stdlib.h"
#include "string.h"
#include "master_header.h"

#include "limits.h"

#define LEN(arr) ((int) (sizeof (arr) / sizeof (arr)[0]))
#define uC_clockPeriod 1/150.0e6f                 //TMS320F28335 clock period in seconds

__interrupt void SCI_RX();

unsigned long int RX_counter=0;
unsigned char RX_char;

void initMCU(void){
    InitSysCtrl();

    //status LED conf.
    EALLOW;
    GpioCtrlRegs.GPAMUX1.bit.GPIO9=0;
    GpioCtrlRegs.GPAPUD.bit.GPIO9=1;
    GpioCtrlRegs.GPADIR.bit.GPIO9=1;
    EDIS;
}

void setupUART(){
    EALLOW;

    SysCtrlRegs.PCLKCR0.bit.SCIBENCLK = 1;
    SciaRegs.SCIFFTX.bit.SCIRST=0; //enable SCI TX reset mode
    SciaRegs.SCICTL1.bit.SWRESET=0; //enable SCI reset mode

    //RX GPIO Conf
    GpioCtrlRegs.GPAMUX2.bit.GPIO28=01;
    GpioCtrlRegs.GPAPUD.bit.GPIO28=0;
    GpioCtrlRegs.GPADIR.bit.GPIO28=0;

    //TX GPIO Conf
    GpioCtrlRegs.GPAMUX2.bit.GPIO29=01;
    GpioCtrlRegs.GPAPUD.bit.GPIO29=1;
    GpioCtrlRegs.GPADIR.bit.GPIO29=1;

    SysCtrlRegs.LOSPCP.bit.LSPCLK=2; //sysclk/4
    SciaRegs.SCIHBAUD=1; //487 -> 9600 bps
    SciaRegs.SCILBAUD=231;

    SciaRegs.SCICCR.bit.STOPBITS=1;
    SciaRegs.SCICCR.bit.PARITY=1;
    SciaRegs.SCICCR.bit.PARITYENA=0; //aktualnie jest 8n1, mo�na zmieni� na 8e1
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
    PieVectTable.SCIRXINTA=&SCI_RX;
    IER|=M_INT9;
    EINT;
    ERTM;
    EDIS;
}

void main(void)
{
    initMCU();
    setupUART();
    setupInterrupts();

    while(1){
        DELAY_US(500000);
        GpioDataRegs.GPATOGGLE.bit.GPIO9=1;
        SciaRegs.SCITXBUF=100;
        __asm(" NOP");
    }
}

__interrupt void SCI_RX(){
    RX_counter++;
    PieCtrlRegs.PIEACK.bit.ACK9=1;
    RX_char=SciaRegs.SCIRXBUF.bit.RXDT; //read received character
}
