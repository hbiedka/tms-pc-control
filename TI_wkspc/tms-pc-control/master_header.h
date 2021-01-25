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

    /* CONSTANTS */
    #define LEN(arr) ((int) (sizeof (arr) / sizeof (arr)[0])) //array's length
    #define TMS_CLOCKFREQUENCY 150E+6f                        //TMS320F28335 clock frequency in Hz
    #define TMS_CLOCKPERIOD 0.0000000066666666666666666667f   //TMS320F28335 clock period in seconds
    #define TIMER_THRESHOLD 4294967295U                       //timer capacity
    #define TIMER_INVTHRESHOLD 2.3283064e-10L                 //inverse of timer capacity
    #define TIMER_MINPRD 15000                                //10 kHz max
    #define TIMER_INTERRUPTDELAY 26                           //delay between start of interrupt and TIM update
    #define ADC_CAPACITY 4095                                 //ADC 12 bit
    #define ADC_INVCAPACITY 0.0002442002442L                  //inversion of the above
    #define PWM_TBPRDMAX 65535                                //PWM max counter value
    #define PWM_HALFSYSCLK 75E+6                              //half of SYSCLK for PWM divisor defining
    /* REGISTER MACROS */
    #define ADC_STARTCONV AdcRegs.ADCTRL2.bit.SOC_SEQ1 = 1   //begin conversion cycle on SEQ1
    #define ADC_RESETSEQ1 AdcRegs.ADCTRL2.bit.RST_SEQ1 = 1   //reset sequencer 1
    #define ADC_VR1VALUE  AdcMirror.ADCRESULT0               //value read from VR1 (potentiometer)
    #define ADC_VR2VALUE  AdcMirror.ADCRESULT1               //value read from VR2 (potentiometer)

    #define PB1_STATE !GpioDataRegs.GPADAT.bit.GPIO17         //read state of PB1
    #define PB2_STATE !GpioDataRegs.GPBDAT.bit.GPIO48         //read state of PB2

    #define LED1_ON  GpioDataRegs.GPASET.bit.GPIO9 = 1        //LED switching macros
    #define LED1_OFF GpioDataRegs.GPACLEAR.bit.GPIO9 = 1      // |
    #define LED2_ON  GpioDataRegs.GPASET.bit.GPIO11 = 1       // |
    #define LED2_OFF GpioDataRegs.GPACLEAR.bit.GPIO11 = 1     // |
    #define LED3_ON  GpioDataRegs.GPBSET.bit.GPIO34 = 1       // |
    #define LED3_OFF GpioDataRegs.GPBCLEAR.bit.GPIO34 = 1     // |
    #define LED4_ON  GpioDataRegs.GPBSET.bit.GPIO49 = 1       // |
    #define LED4_OFF GpioDataRegs.GPBCLEAR.bit.GPIO49 = 1     //^_^
#endif /* MASTER_HEADER_H_ */
