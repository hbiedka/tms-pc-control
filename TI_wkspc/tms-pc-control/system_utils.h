/*
 * system_utils.h
 *
 *  Created on: 24 sty 2021
 *      Author: Bogdan
 */

#ifndef SYSTEM_UTILS_H_
#define SYSTEM_UTILS_H_

unsigned long definePRD(float T);
unsigned int defineQuotient(float T);
void readEncoder(void);
void definePWM_DIVSandPRD(float PWMfreq,short PWMchannel);
void defineDeadBand(float deadtime,short PWMchannel);

#endif /* SYSTEM_UTILS_H_ */
