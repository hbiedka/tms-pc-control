#include "system_externs.h"
#include "master_header.h"

#include "limits.h"
#include "float.h"

#define DEBUG  1

void main(void)
{
     initMCU();

    while(1){
        __asm(" NOP");
        #if DEBUG==1
            DELAY_US(1000000);
            state.pwm_duty[4] = state.vr_adc[0];
            state.pwm_duty[5] = state.vr_adc[1];
            PWM_setDuty();
        #else
            __asm(" NOP");
        #endif

    }
}
