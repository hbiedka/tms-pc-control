/*
 * external_control.c
 *
 *  Created on: 20 sty 2021
 *      Author: Bogdan
 */

#include "system_externs.h"
#include "master_header.h"

void setLED(short index,short value){
    if (index==3){
        if (value==0) LED3_OFF;
        else          LED3_ON;
        state.led_gpio[0] = value;
    }
    if (index==4){
        if (value==0) LED4_OFF;
        else          LED4_ON;
        state.led_gpio[1] = value;
    }
}

void setPWMfreq(short index, float freq){
    definePWM_DIVSandPRD(freq,index);
    defineDeadBand(state.pwm_deadtime[index], index);
    state.pwm_freq[index] = (long double)PWM_PRD[index]/(PWM_HALFSYSCLK*PWM_DIV[index]);
}

void setDeadTime(short index, float deadtime){
    defineDeadBand(deadtime, index);
    state.pwm_deadtime[index] = deadtime;
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
        state.tim_freq[0] = 1.0/((TIMER_PRD[0]+TIMER_multiplier[0]*TIMER_THRESHOLD)*TMS_CLOCKPERIOD);
    }
    else if (index == 1){
        TIMER_PRD[1] = definePRD(T);
        if (TIMER_PRD[1] < TIMER_MINPRD)
            TIMER_PRD[1] = TIMER_MINPRD;
        CpuTimer1Regs.PRD.all = TIMER_PRD[1];
        TIMER_multiplier[1] = defineQuotient(T);
        TIMER_multiplierTmp[1] = TIMER_multiplier[1];
        CpuTimer1Regs.TCR.bit.TRB = 1;
        state.tim_freq[1] = 1.0/((TIMER_PRD[1]+TIMER_multiplier[1]*TIMER_THRESHOLD)*TMS_CLOCKPERIOD);
    }
    else if (index==2){
        TIMER_PRD[2] = definePRD(T);
        if (TIMER_PRD[2] < TIMER_MINPRD)
            TIMER_PRD[2] = TIMER_MINPRD;
        CpuTimer2Regs.PRD.all = TIMER_PRD[2];
        TIMER_multiplier[2] = defineQuotient(T);
        TIMER_multiplierTmp[2] = TIMER_multiplier[2];
        CpuTimer2Regs.TCR.bit.TRB = 1;
        state.tim_freq[2] = 1.0/((TIMER_PRD[2]+TIMER_multiplier[2]*TIMER_THRESHOLD)*TMS_CLOCKPERIOD);
    }
}

