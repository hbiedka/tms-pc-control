/*
 * system_service.c
 *
 *  Created on: 24 sty 2021
 *      Author: Bogdan
 */

#include "system_externs.h"
#include "master_header.h"

__interrupt void SCI_RX(){
    RX_counter++;
    PieCtrlRegs.PIEACK.bit.ACK1=1;
    RX_char=SciaRegs.SCIRXBUF.bit.RXDT; //read received character
}

__interrupt void TIMER0INT(){

    //acknowledgement
    PieCtrlRegs.PIEACK.bit.ACK1 = 1;
}
__interrupt void TIMER1INT(){

    //no acknowledgement
}
__interrupt void TIMER2INT(){

    //no acknowledgement
}

