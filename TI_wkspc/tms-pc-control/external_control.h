/*
 * external_control.h
 *
 *  Created on: 24 sty 2021
 *      Author: Bogdan
 */

#ifndef EXTERNAL_CONTROL_H_
#define EXTERNAL_CONTROL_H_

void sendTMSstate(void);
void parseUARTframe(void);

void setLED(short index,short state);
void setPWMfreq(short index, float freq);
void setPWMduty(short index, float duty);
void setTimerFreq(short index, float freq);
void setDeadTime(short index, float deadtime);

#endif /* EXTERNAL_CONTROL_H_ */
