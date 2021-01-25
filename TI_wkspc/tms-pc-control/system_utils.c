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

void definePWM_DIVSandPRD(float PWMfreq,short PWMchannel){
    float prd = 1.0/PWMfreq;
    int iclk,ihsp;
    short stop = 0;
    for (iclk=0;iclk<8;++iclk){
        for (ihsp=0;ihsp<8;++ihsp){
            float testDiv = PWM_CLKDIVOPTION[iclk]*PWM_HSPCLKDIVOPTION[ihsp];
            unsigned long int testTBPRD = (unsigned long int)(PWM_HALFSYSCLK*prd/testDiv);
            if (testTBPRD<=PWM_TBPRDMAX){
                PWM_PRD[PWMchannel] = testTBPRD;
                PWM_DIV[PWMchannel] = testDiv;
                EALLOW;
                if (PWMchannel==0){
                    EPwm1Regs.TBCTL.bit.CLKDIV = iclk;
                    EPwm1Regs.TBCTL.bit.HSPCLKDIV = ihsp;
                    EPwm1Regs.TBPRD = PWM_PRD[PWMchannel];
                }else
                if (PWMchannel==1){
                    EPwm2Regs.TBCTL.bit.CLKDIV = iclk;
                    EPwm2Regs.TBCTL.bit.HSPCLKDIV = ihsp;
                    EPwm2Regs.TBPRD = PWM_PRD[PWMchannel];
                }else
                if (PWMchannel==2){
                    EPwm3Regs.TBCTL.bit.CLKDIV = iclk;
                    EPwm3Regs.TBCTL.bit.HSPCLKDIV = ihsp;
                    EPwm3Regs.TBPRD = PWM_PRD[PWMchannel];
                }else
                if (PWMchannel==3){
                    EPwm4Regs.TBCTL.bit.CLKDIV = iclk;
                    EPwm4Regs.TBCTL.bit.HSPCLKDIV = ihsp;
                    EPwm4Regs.TBPRD = PWM_PRD[PWMchannel];
                }else
                if (PWMchannel==4){
                    EPwm5Regs.TBCTL.bit.CLKDIV = iclk;
                    EPwm5Regs.TBCTL.bit.HSPCLKDIV = ihsp;
                    EPwm5Regs.TBPRD = PWM_PRD[PWMchannel];
                }else
                if (PWMchannel==5){
                    EPwm6Regs.TBCTL.bit.CLKDIV = iclk;
                    EPwm6Regs.TBCTL.bit.HSPCLKDIV = ihsp;
                    EPwm6Regs.TBPRD = PWM_PRD[PWMchannel];
                }
                EDIS;
                stop = 1;
                break;
            }
        }
        if (stop) break;
    }
}

void defineDeadBand(float deadtime,short PWMchannel){
    float tbfq = TMS_CLOCKFREQUENCY/PWM_DIV[PWMchannel];
    int dt = tbfq*deadtime;
    if (dt>=1024) dt = 1023;
    if (dt<0) dt = 0;
    EALLOW;
    if (PWMchannel==0){
        EPwm1Regs.DBFED = dt;
        EPwm1Regs.DBRED = dt;
    }else
    if (PWMchannel==1){
        EPwm2Regs.DBFED = dt;
        EPwm2Regs.DBRED = dt;
    }else
    if (PWMchannel==2){
        EPwm3Regs.DBFED = dt;
        EPwm3Regs.DBRED = dt;
    }else
    if (PWMchannel==3){
        EPwm4Regs.DBFED = dt;
        EPwm4Regs.DBRED = dt;
    }else
    if (PWMchannel==4){
        EPwm5Regs.DBFED = dt;
        EPwm5Regs.DBRED = dt;
    }else
    if (PWMchannel==5){
        EPwm6Regs.DBFED = dt;
        EPwm6Regs.DBRED = dt;
    }
    EDIS;
}
