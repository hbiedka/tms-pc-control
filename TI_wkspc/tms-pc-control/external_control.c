/*
 * external_control.c
 *
 *  Created on: 20 sty 2021
 *      Author: Bogdan
 */

#include "system_externs.h"
#include "master_header.h"

void updateState(struct TMS_state state){

}

void setLED(short index,short state){
    //TODO
}

void setPWMduty(short index, float freq){

}

void setTimerFreq(short index, float freq){
    float T = 1.0/freq;
    if (index == 0){
        TIMER_PRD[0] = definePRD(T);
        if (TIMER_PRD[0] < TIMER_MINPRD)
            TIMER_PRD[0] = TIMER_MINPRD;
        CpuTimer0Regs.PRD.all = TIMER_PRD[0];
        TIMER_multiplier[0] = defineQuotient(T);
        TIMER_multiplierTmp[0] = TIMER_multiplier[0];
        CpuTimer0Regs.TCR.bit.TRB = 1;
    }
    else if (index == 1){
        TIMER_PRD[1] = definePRD(T);
        if (TIMER_PRD[1] < TIMER_MINPRD)
            TIMER_PRD[1] = TIMER_MINPRD;
        CpuTimer1Regs.PRD.all = TIMER_PRD[1];
        TIMER_multiplier[1] = defineQuotient(T);
        TIMER_multiplierTmp[1] = TIMER_multiplier[1];
        CpuTimer1Regs.TCR.bit.TRB = 1;
    }
    else if (index==2){
        TIMER_PRD[2] = definePRD(T);
        if (TIMER_PRD[2] < TIMER_MINPRD)
            TIMER_PRD[2] = TIMER_MINPRD;
        CpuTimer2Regs.PRD.all = TIMER_PRD[2];
        TIMER_multiplier[2] = defineQuotient(T);
        TIMER_multiplierTmp[2] = TIMER_multiplier[2];
        CpuTimer2Regs.TCR.bit.TRB = 1;
    }
}

