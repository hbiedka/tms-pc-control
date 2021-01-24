/*
 * system_globalvars.c
 *
 *  Created on: 24 sty 2021
 *      Author: Bogdan
 */

#include "system_externs.h"
#include "master_header.h"

    /* GLOBAL VARIABLES */
    TMS_state state;                            //peripherals state structure
    unsigned int Timer_Multiplier[3] = {0,0,0}; //timers software multipliers
    unsigned long int RX_counter = 0;           //UART
    unsigned char RX_char;
