/*
 * system_globalvars.c
 *
 *  Created on: 24 sty 2021
 *      Author: Bogdan
 */

#include "system_externs.h"
#include "master_header.h"

/* GLOBAL VARIABLES */
    /* TMS STATE */
    TMS_state state;                               //peripherals state structure
    /* TIMERS */
    unsigned long int TIMER_counter[3] = {0,0,0};  //timers counter
    unsigned int TIMER_multiplier[3] = {0,0,0};    //timers software multipliers
    unsigned int TIMER_multiplierTmp[3] = {0,0,0}; //timers temporary counter multipliers
    unsigned long TIMER_PRD[3] = {150000000,150000000,150000000};          //timers counter non-full PRDs
    /* UART */
    unsigned long int RX_counter = 0;              //UART counter
    unsigned char RX_char;                         //UART RX
    /* GPIO */
    short encoder_bin[4] = {0,0,0,0};
    /* PWMs */
    unsigned int PWM_CLKDIVOPTION[8] = {1,2,4,8,16,32,64,128};
    unsigned int PWM_HSPCLKDIVOPTION[8] = {1,2,4,6,8,10,12,14};
    unsigned short PWM_PRD[6] = {65535,65535,65535,65535,65535,65535};
    unsigned int PWM_DIV[6] = {2,2,2,2,2,2};

