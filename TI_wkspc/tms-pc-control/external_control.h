/*
 * external_control.h
 *
 *  Created on: 24 sty 2021
 *      Author: Bogdan
 */

#ifndef EXTERNAL_CONTROL_H_
#define EXTERNAL_CONTROL_H_

struct TMS_state {
    short pb_gpio[2];
    short enc_gpio;

    short led_gpio[2];

    float vr_adc[2];

    float pwm_freq[6];
    float pwm_duty[6];

    float tim_freq[2];
};

void updateState(struct TMS_state state);
void setLED(short index,short state);
void setPWMduty(short index, float freq);
void setTimerFreq(short index, float freq);

#endif /* EXTERNAL_CONTROL_H_ */
