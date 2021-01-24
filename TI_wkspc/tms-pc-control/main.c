#include "system_externs.h"
#include "master_header.h"

#include "limits.h"
#include "float.h"

void main(void)
{
    initMCU();

    while(1){
        DELAY_US(100000);
        GpioDataRegs.GPATOGGLE.bit.GPIO9=1;
        SciaRegs.SCITXBUF=100;
        __asm(" NOP");
    }
}
