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
    PieCtrlRegs.PIEACK.all = (PIEACK_GROUP8 & PIEACK_GROUP9);
    RX_char=SciaRegs.SCIRXBUF.bit.RXDT; //read received character
}

__interrupt void ENCODERINT(){
    readEncoder();
    PieCtrlRegs.PIEACK.all = PIEACK_GROUP1;
}

__interrupt void BUTTON1INT(){
    state.pb_gpio[0] = PB1_STATE;
    PieCtrlRegs.PIEACK.all = PIEACK_GROUP1;
}

__interrupt void BUTTON2INT(){
    state.pb_gpio[1] = PB2_STATE;
    PieCtrlRegs.PIEACK.all = PIEACK_GROUP12;
}

__interrupt void TIMER0INT(){
    if (TIMER_multiplierTmp[0]==0){
        CpuTimer0Regs.PRD.all = TIMER_PRD[0]-TIMER_INTERRUPTDELAY;
        CpuTimer0Regs.TCR.bit.TRB = 1;
        TIMER_multiplierTmp[0] = TIMER_multiplier[0];
        /* CODE GOES HERE */
        ++TIMER_counter[0];

        }
        else{
            CpuTimer0Regs.PRD.all = TIMER_THRESHOLD-TIMER_INTERRUPTDELAY;
            CpuTimer0Regs.TCR.bit.TRB = 1;
            --TIMER_multiplierTmp[0];
        }

    PieCtrlRegs.PIEACK.bit.ACK1 = 1; //PIE acknowledgement
}
__interrupt void TIMER1INT(){
    if (TIMER_multiplierTmp[1]==0){
            CpuTimer1Regs.PRD.all = TIMER_PRD[1]-TIMER_INTERRUPTDELAY;
            CpuTimer1Regs.TCR.bit.TRB = 1;
            TIMER_multiplierTmp[1] = TIMER_multiplier[1];
            /* CODE GOES HERE */
            ++TIMER_counter[1];

            }
            else{
                CpuTimer1Regs.PRD.all = TIMER_THRESHOLD-TIMER_INTERRUPTDELAY;
                CpuTimer1Regs.TCR.bit.TRB = 1;
                --TIMER_multiplierTmp[1];
            }
    //no PIE acknowledgement
}
__interrupt void TIMER2INT(){
    if (TIMER_multiplierTmp[2]==0){
            CpuTimer2Regs.PRD.all = TIMER_PRD[2]-TIMER_INTERRUPTDELAY;
            CpuTimer2Regs.TCR.bit.TRB = 1;
            TIMER_multiplierTmp[2] = TIMER_multiplier[2];
            /* CODE GOES HERE */
            ++TIMER_counter[2];

            }
            else{
                CpuTimer2Regs.PRD.all = TIMER_THRESHOLD-TIMER_INTERRUPTDELAY;
                CpuTimer2Regs.TCR.bit.TRB = 1;
                --TIMER_multiplierTmp[2];
            }
    //no PIE acknowledgement
}
