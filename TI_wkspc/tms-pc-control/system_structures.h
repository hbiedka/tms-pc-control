/*
 * system_structures.h
 *
 *  Created on: 24 sty 2021
 *      Author: Bogdan
 */

#ifndef SYSTEM_STRUCTURES_H_
#define SYSTEM_STRUCTURES_H_

struct TMS_state {
    short pb_gpio[2];
    short enc_gpio;

    short led_gpio[2];

    float vr_adc[2];

    float pwm_freq[6];
    float pwm_duty[6];

    float tim_freq[3];
};

typedef struct TMS_state TMS_state;

#endif /* SYSTEM_STRUCTURES_H_ */
