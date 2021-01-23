/*
 * external_control.c
 *
 *  Created on: 20 sty 2021
 *      Author: Bogdan
 */

struct TMS_state {
    short pb_gpio[2];
    short enc_gpio;

    short led_gpio[2];

    float vr_adc[2];

    float pwm_freq[6];
    float pwm_duty[6];

    float tim_freq[2];
};

void updateState(struct TMS_state state){

}

void setLED(short index,short state){
    //TODO
}

//void setPWMduty(short index, float dc){
//
//}

void setPWMduty(short index, float freq){

}

void setTimerFreq(short index, float freq){

}

