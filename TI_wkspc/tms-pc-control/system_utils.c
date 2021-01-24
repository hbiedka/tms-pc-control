/*
 * system_utils.c
 *
 *  Created on: 24 sty 2021
 *      Author: Bogdan
 */

#include "system_externs.h"
#include "master_header.h"

unsigned long definePRD(float T){
    unsigned long TinTimer = (unsigned long)(T*TMS_CLOCKFREQUENCY);
    unsigned long tmp = TinTimer % TIMER_THRESHOLD;
    if (tmp==0) tmp=TIMER_THRESHOLD;
    return tmp;
}

unsigned int defineQuotient(float T){
    unsigned long TinTimer = (unsigned long)(T*TMS_CLOCKFREQUENCY);
    return (unsigned int)(TinTimer*TIMER_INVTHRESHOLD);
}

