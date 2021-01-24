/*
 * external_control.h
 *
 *  Created on: 24 sty 2021
 *      Author: Bogdan
 */

#ifndef EXTERNAL_CONTROL_H_
#define EXTERNAL_CONTROL_H_

void updateState(TMS_state state);
void setLED(short index,short state);
void setPWMduty(short index, float freq);
void setTimerFreq(short index, float freq);

#endif /* EXTERNAL_CONTROL_H_ */
