#include "DSP28x_Project.h"
#include "math.h"
#include "stdlib.h"
#include "string.h"
#include "master_header.h"

#include "limits.h"

#define LEN(arr) ((int) (sizeof (arr) / sizeof (arr)[0]))
#define uC_clockPeriod 1/150.0e6f                 //TMS320F28335 clock period in seconds

void initMCU(void){
    InitSysCtrl();

}

void main(void)
{
    initMCU();

}
