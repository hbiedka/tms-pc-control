#ifndef PIandTableDec
#define PIandTableDec

#define R 1.08        //[Ohm]
#define L 3.6e-3    //[H]
#define Us 30       //[V]
#define tau 4.0e-6 //[s] of H-bridge and current probe

typedef Uint16 elem_type;
elem_type kth_smallest(elem_type a[], Uint16 n, Uint16 k);
elem_type quick_select_median(elem_type arr[], Uint16 n);

extern float Ts;

struct regPI{
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
};

void initPI(struct regPI *par, float kpp, float kii, float kss, float limInff, float limSupp);
void calculatePI(struct regPI *par, float u);
void changeP(struct regPI *par, float kpp);
void changePI(struct regPI *par, float kpp, float kii, float kss);

#endif
