/*
 * system_service.h
 *
 *  Created on: 24 sty 2021
 *      Author: Bogdan
 */

#ifndef SYSTEM_SERVICE_H_
#define SYSTEM_SERVICE_H_

__interrupt void SCI_RX();
__interrupt void TIMER0INT();
__interrupt void TIMER1INT();
__interrupt void TIMER2INT();
__interrupt void BUTTON1INT();
__interrupt void BUTTON2INT();
__interrupt void ENCODERINT();
__interrupt void ADCINT();
void PWM_setDuty();

#endif /* SYSTEM_SERVICE_H_ */
