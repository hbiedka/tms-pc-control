#include "DSP28x_Project.h"
#include "math.h"
#include "stdlib.h"
#include "string.h"
#include "master_header.h"

#include "limits.h"

#define LEN(arr) ((int) (sizeof (arr) / sizeof (arr)[0]))
#define uC_clockPeriod 1/150.0e6f                 //TMS320F28335 clock period in seconds

void initMCU(void){
    InitSysCtrl();

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
    SciaRegs.SCICCR.bit.PARITYENA=0; //aktualnie jest 8n1, mo¿na zmieniæ na 8e1
    SciaRegs.SCICCR.bit.LOOPBKENA=0;
    SciaRegs.SCICCR.bit.ADDRIDLE_MODE=0;
    SciaRegs.SCICCR.bit.SCICHAR=7;

    SciaRegs.SCIFFTX.bit.SCIRST=1; //disable SCI TX reset mode
    SciaRegs.SCICTL1.bit.TXENA=1;  //enable tx

//    SciaRegs.SCICTL1.bit.RXENA=1;
//    SciaRegs.SCIFFRX.bit.RXFIFORESET=1;
//    SciaRegs.SCIRXST.bit.RXRDY=1;
//    SciaRegs.SCICTL2.bit.RXBKINTENA=0;

    SciaRegs.SCICTL1.bit.SWRESET=1; //disable SCI reset mode
    EDIS;
}



void main(void)
{
    initMCU();
    setupUART();

    while(1){
        DELAY_US(500000);
        SciaRegs.SCITXBUF='A';
        __asm(" NOP");
    }
}
