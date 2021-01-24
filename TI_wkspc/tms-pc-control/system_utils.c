/*
 * system_utils.c
 *
 *  Created on: 24 sty 2021
 *      Author: Bogdan
 */

#include "system_externs.h"
#include "master_header.h"

unsigned long definePRD(float T){
    unsigned long long TinTimer = (unsigned long long)(T*TMS_CLOCKFREQUENCY);
    unsigned long tmp = (unsigned long)(TinTimer % TIMER_THRESHOLD);
    if (tmp==0) tmp=TIMER_THRESHOLD;
    return tmp;
}

unsigned int defineQuotient(float T){
    if (T<1.0)
        return (unsigned int)(T*TMS_CLOCKFREQUENCY*TIMER_INVTHRESHOLD);
    else
        return (unsigned int)(T*TIMER_INVTHRESHOLD*TMS_CLOCKFREQUENCY);
}

void readEncoder(void){
    encoder_bin[0]=GpioDataRegs.GPADAT.bit.GPIO12;
    encoder_bin[1]=GpioDataRegs.GPADAT.bit.GPIO13;
    encoder_bin[2]=GpioDataRegs.GPADAT.bit.GPIO14;
    encoder_bin[3]=GpioDataRegs.GPADAT.bit.GPIO15;

    state.enc_gpio =  encoder_bin[0];
    state.enc_gpio += encoder_bin[1]*2;
    state.enc_gpio += encoder_bin[2]*4;
    state.enc_gpio += encoder_bin[3]*8;
}
