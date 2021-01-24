#include "system_externs.h"
#include "master_header.h"

#include "limits.h"
#include "float.h"

void main(void)
{
    initMCU();

    while(1){
        DELAY_US(100000);
        SciaRegs.SCITXBUF=100;
        __asm(" NOP");
    }
}
