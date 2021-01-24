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
    TIMER_counter[0]++;

    PieCtrlRegs.PIEACK.bit.ACK1 = 1; //PIE acknowledgement
}
__interrupt void TIMER1INT(){
    TIMER_counter[1]++;
    //no PIE acknowledgement
}
__interrupt void TIMER2INT(){
    TIMER_counter[2]++;
    //no PIE acknowledgement
}

