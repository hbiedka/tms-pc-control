/*
 * PIDreg.c
 *
 *  Created on: 19 lis 2019
 *      Author: Bogdan Bednarski
 */

static float Ts = 1.0/(150e6)*2.0*1500.0*1.0*1.0; //2*750 stands for PWM period; *1.0 stands for ADC buffer size; *1.0 stands for PWM CLK prescaler

typedef struct {
    float kp;
    float ki;
    float ks;
    float integral;
    float integ_const;
    float u_prev;
    float limSup;
    float limInf;
    float y_internal;
    float antiWndp;
    float y;
} regPI;

void initPI(regPI *par, float kpp, float kii, float kss, float limInff, float limSupp){
    par->kp=kpp;
    par->ki=kii;
    par->ks=kss;
    par->integ_const = par->ki*Ts;
    par->limSup=limSupp;
    par->limInf=limInff;
    par->integral=0.0;
    par->u_prev=0.0;
    par->y_internal=0.0;
    par->antiWndp=0.0;
    par->y=0.0;
}

void changeP(regPI *par, float kpp){
    par->kp=kpp;
}

void changePI(regPI *par, float kpp, float kii, float kss){
    par->kp=kpp;
    par->ki=kii;
    par->integ_const = par->ki*Ts;
    par->ks=kss;
    par->integral=0.0;
    par->antiWndp=0.0;

}

//dyskretyzacja metodą Tustina(biliniowa)
void calculatePI(regPI *par, double u){
    par->integral+=((par->u_prev+u)*0.5-par->antiWndp)*par->integ_const;

    par->y_internal=par->integral+u*par->kp;
    if (par->y_internal < par->limInf) {par->y=par->limInf;}
    else if (par->y_internal > par->limSup) {par->y=par->limSup;}
    else par->y = par->y_internal;

    par->u_prev = u;
    par->antiWndp = (par->y_internal - par->y)*par->ks;
}

/*void calculatePI(regPI *par, float u){
    par->integral+=((par->u_prev-par->antiWndp))*par->integ_const;

    par->y_internal=par->integral+u*par->kp;
    if (par->y_internal < par->limInf) {par->y=par->limInf;}
    else if (par->y_internal > par->limSup) {par->y=par->limSup;}
    else par->y = par->y_internal;

    par->u_prev = u;
    par->antiWndp = (par->y_internal - par->y)*par->ks;
//    par->y_internal=u*par->kp;
//    if (par->y_internal < par->limInf) {par->y=par->limInf;}
//        else if (par->y_internal > par->limSup) {par->y=par->limSup;}
//        else par->y = par->y_internal;
}*/
