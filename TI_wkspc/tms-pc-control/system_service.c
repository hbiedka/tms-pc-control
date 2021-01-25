/*
 * system_service.c
 *
 *  Created on: 24 sty 2021
 *      Author: Bogdan
 */

#include "system_externs.h"
#include "master_header.h"

void PWM_setDuty(){
    EALLOW;
    EPwm1Regs.CMPA.half.CMPA = state.pwm_duty[0]*PWM_PRD[0];
    EPwm2Regs.CMPA.half.CMPA = state.pwm_duty[1]*PWM_PRD[1];
    EPwm3Regs.CMPA.half.CMPA = state.pwm_duty[2]*PWM_PRD[2];
    EPwm4Regs.CMPA.half.CMPA = state.pwm_duty[3]*PWM_PRD[3];
    EPwm5Regs.CMPA.half.CMPA = state.pwm_duty[4]*PWM_PRD[4];
    EPwm6Regs.CMPA.half.CMPA = state.pwm_duty[5]*PWM_PRD[5];
    EDIS;
}

__interrupt void SCI_RX(){

    RX_counter++;
    RX_char=SciaRegs.SCIRXBUF.bit.RXDT; //read received character

    PieCtrlRegs.PIEACK.all = (PIEACK_GROUP8 & PIEACK_GROUP9); //PIE ack.
}

__interrupt void ADCINT(){
    state.vr_adc[0] = ADC_INVCAPACITY*(long double)ADC_VR1VALUE;
    state.vr_adc[1] = ADC_INVCAPACITY*(long double)ADC_VR2VALUE;
    /* Reset and acknowledgments */
    ADC_RESETSEQ1;
    AdcRegs.ADCST.bit.INT_SEQ1_CLR = 1;
    PieCtrlRegs.PIEACK.all = PIEACK_GROUP1;
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
    EALLOW;
    EPwm1Regs.TZCLR.bit.OST = 1;
    EPwm2Regs.TZCLR.bit.OST = 1;
    EPwm3Regs.TZCLR.bit.OST = 1;
    EPwm4Regs.TZCLR.bit.OST = 1;
    EPwm5Regs.TZCLR.bit.OST = 1;
    EPwm6Regs.TZCLR.bit.OST = 1;
    EDIS;
    PieCtrlRegs.PIEACK.all = PIEACK_GROUP12;
}

__interrupt void TIMER0INT(){
    if (TIMER_multiplierTmp[0]==0){
        CpuTimer0Regs.PRD.all = TIMER_PRD[0]-TIMER_INTERRUPTDELAY;
        CpuTimer0Regs.TCR.bit.TRB = 1;
        TIMER_multiplierTmp[0] = TIMER_multiplier[0];
        /* CODE GOES HERE */
        ++TIMER_counter[0];
        ADC_STARTCONV;
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
