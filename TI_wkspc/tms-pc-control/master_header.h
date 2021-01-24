/*
 * master_header.h
 *
 *  Created on: 20 sty 2021
 *      Author: Bogdan
 */

#ifndef MASTER_HEADER_H_
    #define MASTER_HEADER_H_

    #include "system_structures.h"
    #include "system_externs.h"
    #include "DSP28x_Project.h"
    #include "math.h"
    #include "stdlib.h"
    #include "string.h"
    #include "system_utils.h"
    #include "system_setup.h"
    #include "system_service.h"
    #include "external_control.h"

    #define LEN(arr) ((int) (sizeof (arr) / sizeof (arr)[0])) //array's length
    #define TMS_CLOCKFREQUENCY 150E+6f                         //TMS320F28335 clock frequency in Hz
    #define TMS_CLOCKPERIOD 0.0000000066666666666666666667f   //TMS320F28335 clock period in seconds
    #define TIMER_THRESHOLD 4294967295U                       //timer capacity
    #define TIMER_INVTHRESHOLD 2.3283064e-10L                 //inverse of timer capacity
    #define TIMER_MINPRD 150000                               //1 kHz max
    #define TIMER_INTERRUPTDELAY 26                                 //delay between start of interrupt and TIM update

#endif /* MASTER_HEADER_H_ */
