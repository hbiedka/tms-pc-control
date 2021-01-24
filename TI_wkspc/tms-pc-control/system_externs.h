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
extern unsigned int Timer_MultiplierTmp[3];
extern unsigned int Timer_Multiplier[3];
/* UART */
extern unsigned long int RX_counter;
extern unsigned char RX_char;
