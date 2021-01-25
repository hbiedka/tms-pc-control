#include "system_externs.h"
#include "master_header.h"

#include "limits.h"
#include "float.h"

void main(void)
{
    initMCU();

    while(1){
        DELAY_US(500000);
        SciaRegs.SCITXBUF=100;
        __asm(" NOP");
        state.pwm_duty[4] = state.vr_adc[0];
        state.pwm_duty[5] = state.vr_adc[1];
        PWM_setDuty();
    }
}
