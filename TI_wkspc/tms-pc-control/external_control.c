/*
 * external_control.c
 *
 *  Created on: 20 sty 2021
 *      Author: Bogdan
 */

#include "system_externs.h"
#include "master_header.h"

//flush buffer
#define SCIWAIT while(!ScibRegs.SCICTL2.bit.TXRDY)

//sends current global data by UART to PC
void sendTMSstate(void) {

    //overture
    ScibRegs.SCITXBUF=100;
    SCIWAIT;

    //GPIO byte - bits 7..6 set to 0, 5 - PB2, 4 - PB1, 3..0 - hex encoder
    short io_data = state.enc_gpio & 0x0F;
    if (state.pb_gpio[0]) io_data |= 0x10;
    if (state.pb_gpio[1]) io_data |= 0x20;
    ScibRegs.SCITXBUF=io_data;
    SCIWAIT;

    //ADC
    short vr1 = state.vr_adc[0]*255;
    short vr2 = state.vr_adc[1]*255;
    ScibRegs.SCITXBUF=vr1;
    SCIWAIT;
    ScibRegs.SCITXBUF=vr2;
    SCIWAIT;

    //CRLF for frame closing
    ScibRegs.SCITXBUF=13;
    SCIWAIT;
    ScibRegs.SCITXBUF=10;
    SCIWAIT;
}

//parses UART receive frame
void parseUARTframe(void) {
    if (RX_frame[0] == 100) {

        //separate code and device nibbles
        short int code = RX_frame[1] & 0xF0;
        code = code >> 4;
        short int device = RX_frame[1] & 0x0F;

        switch(code) {
        case 0:
            switch(device) {
            case 0:
                //LED3
                if (RX_frame[2]) setLED(3,1);
                else setLED(3,0);
                break;
            case 1:
                //LED4
                if (RX_frame[2]) setLED(4,1);
                else setLED(4,0);
                break;
            }
            break;

        case 1:
            //PWM Frequency
            if (device >= 0 && device < 6) {
                unsigned int freq = RX_frame[2] << 8;
                freq |= RX_frame[3];
                setPWMfreq(device,(float)freq);
            }
            break;
        case 2:
            //PWM duty
            if (device >= 0 && device < 6) {
                short duty = RX_frame[2];
                if (duty > 100) duty = 100;
                setPWMduty(device,(float)duty/100);
            }
            break;

        case 3:
            //PWM deadband
            if (device >= 0 && device < 6) {
                unsigned int dead = RX_frame[2] << 8;
                dead |= RX_frame[3];
                setDeadTime(device,(float)dead/1000);
            }
            break;
        }
    }
}


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

void setPWMduty(short index, float duty){
    state.pwm_duty[index] = duty;
    PWM_setDuty();
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

