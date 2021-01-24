/*
 * system_globalvars.c
 *
 *  Created on: 24 sty 2021
 *      Author: Bogdan
 */

#include "system_externs.h"
#include "master_header.h"

    /* GLOBAL VARIABLES */
    TMS_state state;                               //peripherals state structure
    unsigned long int TIMER_counter[3] = {0,0,0};  //timers counter
    unsigned int Timer_Multiplier[3] = {0,0,0};    //timers software multipliers
    unsigned int Timer_MultiplierTmp[3] = {0,0,0}; //timers temporary counter multipliers
    unsigned long int RX_counter = 0;              //UART counter
    unsigned char RX_char;                         //UART RX

