/*
 * system_externs.h
 *
 *  Created on: 24 sty 2021
 *      Author: Bogdan
 */

#include "system_structures.h"

/* TMS STATE */
extern TMS_state state;
/* TIMERS */
extern unsigned long int TIMER_counter[3];
extern unsigned int TIMER_multiplierTmp[3];
extern unsigned int TIMER_multiplier[3];
extern unsigned long TIMER_PRD[3];
/* UART */
extern unsigned long int RX_counter;
extern unsigned char RX_frame[20];
/* GPIO */
extern short encoder_bin[4];
/* PWMs */
extern unsigned int PWM_CLKDIVOPTION[8];
extern unsigned int PWM_HSPCLKDIVOPTION[8];
extern unsigned short PWM_PRD[6];
extern unsigned int PWM_DIV[6];
