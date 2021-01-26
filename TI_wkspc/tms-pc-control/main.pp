




 






 


struct TMS_state {
    short pb_gpio[2];
    short enc_gpio;

    short led_gpio[2];

    float vr_adc[2];

    float pwm_freq[6];
    float pwm_duty[6];
    float pwm_deadtime[6];

    float tim_freq[3];
};

typedef struct TMS_state TMS_state;


 
extern TMS_state state;
 
extern unsigned long int TIMER_counter[3];
extern unsigned int TIMER_multiplierTmp[3];
extern unsigned int TIMER_multiplier[3];
extern unsigned long TIMER_PRD[3];
 
extern unsigned long int RX_callback_counter;
extern unsigned long int RX_counter;
extern unsigned char RX_frame[20];
 
extern short encoder_bin[4];
 
extern unsigned int PWM_CLKDIVOPTION[8];
extern unsigned int PWM_HSPCLKDIVOPTION[8];
extern unsigned short PWM_PRD[6];
extern unsigned int PWM_DIV[6];





 







 


 
extern TMS_state state;
 
extern unsigned long int TIMER_counter[3];
extern unsigned int TIMER_multiplierTmp[3];
extern unsigned int TIMER_multiplier[3];
extern unsigned long TIMER_PRD[3];
 
extern unsigned long int RX_callback_counter;
extern unsigned long int RX_counter;
extern unsigned char RX_frame[20];
 
extern short encoder_bin[4];
 
extern unsigned int PWM_CLKDIVOPTION[8];
extern unsigned int PWM_HSPCLKDIVOPTION[8];
extern unsigned short PWM_PRD[6];
extern unsigned int PWM_DIV[6];








































































































extern cregister volatile unsigned int IFR;
extern cregister volatile unsigned int IER;








typedef int                int16;
typedef long               int32;
typedef long long          int64;
typedef unsigned int       Uint16;
typedef unsigned long      Uint32;
typedef unsigned long long Uint64;
typedef float              float32;
typedef long double        float64;





















































struct ADCTRL1_BITS {     
    Uint16  rsvd1:4;      
    Uint16  SEQ_CASC:1;   
    Uint16  SEQ_OVRD:1;   
    Uint16  CONT_RUN:1;   
    Uint16  CPS:1;        
    Uint16  ACQ_PS:4;     
    Uint16  SUSMOD:2;     
    Uint16  RESET:1;      
    Uint16  rsvd2:1;      
};

union ADCTRL1_REG {
   Uint16                all;
   struct ADCTRL1_BITS   bit;
};

struct ADCTRL2_BITS {         
    Uint16  EPWM_SOCB_SEQ2:1; 
    Uint16  rsvd1:1;          
    Uint16  INT_MOD_SEQ2:1;   
    Uint16  INT_ENA_SEQ2:1;   
    Uint16  rsvd2:1;          
    Uint16  SOC_SEQ2:1;       
    Uint16  RST_SEQ2:1;       
    Uint16  EXT_SOC_SEQ1:1;   
    Uint16  EPWM_SOCA_SEQ1:1; 
    Uint16  rsvd3:1;          
    Uint16  INT_MOD_SEQ1:1;   
    Uint16  INT_ENA_SEQ1:1;   
    Uint16  rsvd4:1;          
    Uint16  SOC_SEQ1:1;       
    Uint16  RST_SEQ1:1;       
    Uint16  EPWM_SOCB_SEQ:1;  
};

union ADCTRL2_REG {
   Uint16                all;
   struct ADCTRL2_BITS   bit;
};

struct ADCASEQSR_BITS {       
    Uint16  SEQ1_STATE:4;     
    Uint16  SEQ2_STATE:3;     
    Uint16  rsvd1:1;          
    Uint16  SEQ_CNTR:4;       
    Uint16  rsvd2:4;          
};

union ADCASEQSR_REG {
    Uint16                 all;
    struct ADCASEQSR_BITS  bit;
};

struct ADCMAXCONV_BITS {      
    Uint16  MAX_CONV1:4;      
    Uint16  MAX_CONV2:3;      
    Uint16  rsvd1:9;          
};

union ADCMAXCONV_REG {
    Uint16                  all;
    struct ADCMAXCONV_BITS  bit;
};

struct ADCCHSELSEQ1_BITS {    
    Uint16  CONV00:4;         
    Uint16  CONV01:4;         
    Uint16  CONV02:4;         
    Uint16  CONV03:4;         
};

union  ADCCHSELSEQ1_REG{
    Uint16                    all;
    struct ADCCHSELSEQ1_BITS  bit;
};

struct ADCCHSELSEQ2_BITS {    
    Uint16  CONV04:4;         
    Uint16  CONV05:4;         
    Uint16  CONV06:4;         
    Uint16  CONV07:4;         
};

union  ADCCHSELSEQ2_REG{
    Uint16                    all;
    struct ADCCHSELSEQ2_BITS  bit;
};

struct ADCCHSELSEQ3_BITS {    
    Uint16  CONV08:4;         
    Uint16  CONV09:4;         
    Uint16  CONV10:4;         
    Uint16  CONV11:4;         
};

union  ADCCHSELSEQ3_REG{
    Uint16                    all;
    struct ADCCHSELSEQ3_BITS  bit;
};

struct ADCCHSELSEQ4_BITS {    
    Uint16  CONV12:4;         
    Uint16  CONV13:4;         
    Uint16  CONV14:4;         
    Uint16  CONV15:4;         
};

union  ADCCHSELSEQ4_REG {
    Uint16                    all;
    struct ADCCHSELSEQ4_BITS  bit;
};

struct ADCTRL3_BITS {         
    Uint16   SMODE_SEL:1;     
    Uint16   ADCCLKPS:4;      
    Uint16   ADCPWDN:1;       
    Uint16   ADCBGRFDN:2;     
    Uint16   rsvd1:8;         
}; 

union  ADCTRL3_REG {
    Uint16                all;
    struct ADCTRL3_BITS   bit;
};

struct ADCST_BITS {           
    Uint16   INT_SEQ1:1;      
    Uint16   INT_SEQ2:1;      
    Uint16   SEQ1_BSY:1;      
    Uint16   SEQ2_BSY:1;      
    Uint16   INT_SEQ1_CLR:1;  
    Uint16   INT_SEQ2_CLR:1;  
    Uint16   EOS_BUF1:1;      
    Uint16   EOS_BUF2:1;      
    Uint16   rsvd1:8;         
};
                           
union  ADCST_REG {            
    Uint16             all;    
    struct ADCST_BITS  bit;    
};                           

struct ADCREFSEL_BITS {       
	Uint16   rsvd1:14;        
	Uint16   REF_SEL:2;       
};
union ADCREFSEL_REG {
	Uint16		all;
	struct ADCREFSEL_BITS bit;
};

struct ADCOFFTRIM_BITS{       
	int16	OFFSET_TRIM:9;    
	Uint16	rsvd1:7;          
};

union ADCOFFTRIM_REG{
	Uint16		all;
	struct ADCOFFTRIM_BITS bit;
};

struct ADC_REGS {
    union ADCTRL1_REG      ADCTRL1;       
    union ADCTRL2_REG      ADCTRL2;       
    union ADCMAXCONV_REG   ADCMAXCONV;    
    union ADCCHSELSEQ1_REG ADCCHSELSEQ1;  
    union ADCCHSELSEQ2_REG ADCCHSELSEQ2;  
    union ADCCHSELSEQ3_REG ADCCHSELSEQ3;  
    union ADCCHSELSEQ4_REG ADCCHSELSEQ4;  
    union ADCASEQSR_REG    ADCASEQSR;     
    Uint16                 ADCRESULT0;    
    Uint16                 ADCRESULT1;    
    Uint16                 ADCRESULT2;    
    Uint16                 ADCRESULT3;    
    Uint16                 ADCRESULT4;    
    Uint16                 ADCRESULT5;    
    Uint16                 ADCRESULT6;    
    Uint16                 ADCRESULT7;    
    Uint16                 ADCRESULT8;    
    Uint16                 ADCRESULT9;    
    Uint16                 ADCRESULT10;   
    Uint16                 ADCRESULT11;   
    Uint16                 ADCRESULT12;   
    Uint16                 ADCRESULT13;   
    Uint16                 ADCRESULT14;   
    Uint16                 ADCRESULT15;   
    union ADCTRL3_REG      ADCTRL3;       
    union ADCST_REG        ADCST;         
    Uint16				   rsvd1;
    Uint16                 rsvd2;
    union ADCREFSEL_REG    ADCREFSEL;     
    union ADCOFFTRIM_REG   ADCOFFTRIM;    
};

struct ADC_RESULT_MIRROR_REGS
{
    Uint16                 ADCRESULT0;    
    Uint16                 ADCRESULT1;    
    Uint16                 ADCRESULT2;    
    Uint16                 ADCRESULT3;    
    Uint16                 ADCRESULT4;    
    Uint16                 ADCRESULT5;    
    Uint16                 ADCRESULT6;    
    Uint16                 ADCRESULT7;    
    Uint16                 ADCRESULT8;    
    Uint16                 ADCRESULT9;    
    Uint16                 ADCRESULT10;   
    Uint16                 ADCRESULT11;   
    Uint16                 ADCRESULT12;   
    Uint16                 ADCRESULT13;   
    Uint16                 ADCRESULT14;   
    Uint16                 ADCRESULT15;   
};




extern volatile struct ADC_REGS AdcRegs;
extern volatile struct ADC_RESULT_MIRROR_REGS AdcMirror;




























































struct DEVICECNF_BITS  {      
    Uint16 rsvd1:3;           
    Uint16 VMAPS:1;           
    Uint16 rsvd2:1;           
    Uint16 XRSn:1;            
    Uint16 rsvd3:10;          
    Uint16 rsvd4:3;           
    Uint16 ENPROT:1;          
    Uint16 rsvd5:7;           
    Uint16 TRSTN:1;           
    Uint16 rsvd6:4;           
};

union DEVICECNF_REG {
    Uint32                 all;
    struct DEVICECNF_BITS  bit;
};




struct CLASSID_BITS   {   
    Uint16 CLASSNO:8;     
    Uint16 PARTTYPE:8;    
};

union CLASSID_REG {
    Uint16               all;
    struct CLASSID_BITS  bit;
};

struct DEV_EMU_REGS {
    union DEVICECNF_REG DEVICECNF;  
    union CLASSID_REG   CLASSID;    
    Uint16              REVID;      
    Uint16              PROTSTART;  
    Uint16              PROTRANGE;  
    Uint16              rsvd2[202];
};




struct PARTID_BITS   {  
    Uint16 PARTNO:8;     
    Uint16 PARTTYPE:8;   
};

union PARTID_REG {
    Uint16               all;
    struct PARTID_BITS   bit;
};

struct PARTID_REGS {
    union PARTID_REG PARTID; 
};




extern volatile struct DEV_EMU_REGS DevEmuRegs;
extern volatile struct PARTID_REGS PartIdRegs;





































































struct  TCR_BITS {           
    Uint16    rsvd1:4;       
    Uint16    TSS:1;         
    Uint16    TRB:1;         
    Uint16    rsvd2:4;       
    Uint16    SOFT:1;        
    Uint16    FREE:1;        
    Uint16    rsvd3:2;       
    Uint16    TIE:1;         
    Uint16    TIF:1;         
};

union TCR_REG {
    Uint16           all;
    struct TCR_BITS  bit;
};




struct  TPR_BITS {         
    Uint16     TDDR:8;     
    Uint16     PSC:8;      
};

union TPR_REG {
   Uint16           all;
   struct TPR_BITS  bit;
};




struct  TPRH_BITS {          
    Uint16     TDDRH:8;      
    Uint16     PSCH:8;       
};

union TPRH_REG {
    Uint16           all;
    struct TPRH_BITS bit;
};




struct TIM_REG {
    Uint16  LSW;
    Uint16  MSW;
};

union TIM_GROUP {
    Uint32          all;
    struct TIM_REG  half;
};




struct PRD_REG {
    Uint16  LSW;
    Uint16  MSW;
};

union PRD_GROUP {
    Uint32          all;
    struct PRD_REG  half;
};




struct CPUTIMER_REGS {
    union TIM_GROUP TIM;   
    union PRD_GROUP PRD;   
    union TCR_REG   TCR;   
    Uint16          rsvd1; 
    union TPR_REG   TPR;   
    union TPRH_REG  TPRH;  
};




struct CPUTIMER_VARS {
    volatile struct  CPUTIMER_REGS  *RegsAddr;
    Uint32    InterruptCount;
    float   CPUFreqInMHz;
    float   PeriodInUSec;
};




void InitCpuTimers(void);
void ConfigCpuTimer(struct CPUTIMER_VARS *Timer, float Freq, float Period);

extern volatile struct CPUTIMER_REGS CpuTimer0Regs;
extern struct CPUTIMER_VARS CpuTimer0;





extern volatile struct CPUTIMER_REGS CpuTimer1Regs;
extern volatile struct CPUTIMER_REGS CpuTimer2Regs;

extern struct CPUTIMER_VARS CpuTimer1;
extern struct CPUTIMER_VARS CpuTimer2;


















































































































struct  CANME_BITS {       
    Uint16      ME0:1;     
    Uint16      ME1:1;     
    Uint16      ME2:1;     
    Uint16      ME3:1;     
    Uint16      ME4:1;     
    Uint16      ME5:1;     
    Uint16      ME6:1;     
    Uint16      ME7:1;     
    Uint16      ME8:1;     
    Uint16      ME9:1;     
    Uint16      ME10:1;    
    Uint16      ME11:1;    
    Uint16      ME12:1;    
    Uint16      ME13:1;    
    Uint16      ME14:1;    
    Uint16      ME15:1;    
    Uint16      ME16:1;    
    Uint16      ME17:1;    
    Uint16      ME18:1;    
    Uint16      ME19:1;    
    Uint16      ME20:1;    
    Uint16      ME21:1;    
    Uint16      ME22:1;    
    Uint16      ME23:1;    
    Uint16      ME24:1;    
    Uint16      ME25:1;    
    Uint16      ME26:1;    
    Uint16      ME27:1;    
    Uint16      ME28:1;    
    Uint16      ME29:1;    
    Uint16      ME30:1;    
    Uint16      ME31:1;    
};




union CANME_REG {
    Uint32             all;
    struct CANME_BITS  bit;
};




struct  CANMD_BITS {       
    Uint16      MD0:1;     
    Uint16      MD1:1;     
    Uint16      MD2:1;     
    Uint16      MD3:1;     
    Uint16      MD4:1;     
    Uint16      MD5:1;     
    Uint16      MD6:1;     
    Uint16      MD7:1;     
    Uint16      MD8:1;     
    Uint16      MD9:1;     
    Uint16      MD10:1;    
    Uint16      MD11:1;    
    Uint16      MD12:1;    
    Uint16      MD13:1;    
    Uint16      MD14:1;    
    Uint16      MD15:1;    
    Uint16      MD16:1;    
    Uint16      MD17:1;    
    Uint16      MD18:1;    
    Uint16      MD19:1;    
    Uint16      MD20:1;    
    Uint16      MD21:1;    
    Uint16      MD22:1;    
    Uint16      MD23:1;    
    Uint16      MD24:1;    
    Uint16      MD25:1;    
    Uint16      MD26:1;    
    Uint16      MD27:1;    
    Uint16      MD28:1;    
    Uint16      MD29:1;    
    Uint16      MD30:1;    
    Uint16      MD31:1;    
};




union CANMD_REG {
    Uint32             all;
    struct CANMD_BITS  bit;
};




struct  CANTRS_BITS {       
    Uint16      TRS0:1;     
    Uint16      TRS1:1;     
    Uint16      TRS2:1;     
    Uint16      TRS3:1;     
    Uint16      TRS4:1;     
    Uint16      TRS5:1;     
    Uint16      TRS6:1;     
    Uint16      TRS7:1;     
    Uint16      TRS8:1;     
    Uint16      TRS9:1;     
    Uint16      TRS10:1;    
    Uint16      TRS11:1;    
    Uint16      TRS12:1;    
    Uint16      TRS13:1;    
    Uint16      TRS14:1;    
    Uint16      TRS15:1;    
    Uint16      TRS16:1;    
    Uint16      TRS17:1;    
    Uint16      TRS18:1;    
    Uint16      TRS19:1;    
    Uint16      TRS20:1;    
    Uint16      TRS21:1;    
    Uint16      TRS22:1;    
    Uint16      TRS23:1;    
    Uint16      TRS24:1;    
    Uint16      TRS25:1;    
    Uint16      TRS26:1;    
    Uint16      TRS27:1;    
    Uint16      TRS28:1;    
    Uint16      TRS29:1;    
    Uint16      TRS30:1;    
    Uint16      TRS31:1;    
};




union CANTRS_REG {
    Uint32              all;
    struct CANTRS_BITS  bit;
};




struct  CANTRR_BITS {       
    Uint16      TRR0:1;     
    Uint16      TRR1:1;     
    Uint16      TRR2:1;     
    Uint16      TRR3:1;     
    Uint16      TRR4:1;     
    Uint16      TRR5:1;     
    Uint16      TRR6:1;     
    Uint16      TRR7:1;     
    Uint16      TRR8:1;     
    Uint16      TRR9:1;     
    Uint16      TRR10:1;    
    Uint16      TRR11:1;    
    Uint16      TRR12:1;    
    Uint16      TRR13:1;    
    Uint16      TRR14:1;    
    Uint16      TRR15:1;    
    Uint16      TRR16:1;    
    Uint16      TRR17:1;    
    Uint16      TRR18:1;    
    Uint16      TRR19:1;    
    Uint16      TRR20:1;    
    Uint16      TRR21:1;    
    Uint16      TRR22:1;    
    Uint16      TRR23:1;    
    Uint16      TRR24:1;    
    Uint16      TRR25:1;    
    Uint16      TRR26:1;    
    Uint16      TRR27:1;    
    Uint16      TRR28:1;    
    Uint16      TRR29:1;    
    Uint16      TRR30:1;    
    Uint16      TRR31:1;    
};




union CANTRR_REG {
    Uint32              all;
    struct CANTRR_BITS  bit;
};




struct  CANTA_BITS {      
    Uint16      TA0:1;     
    Uint16      TA1:1;     
    Uint16      TA2:1;     
    Uint16      TA3:1;     
    Uint16      TA4:1;     
    Uint16      TA5:1;     
    Uint16      TA6:1;     
    Uint16      TA7:1;     
    Uint16      TA8:1;     
    Uint16      TA9:1;     
    Uint16      TA10:1;    
    Uint16      TA11:1;    
    Uint16      TA12:1;    
    Uint16      TA13:1;    
    Uint16      TA14:1;    
    Uint16      TA15:1;    
    Uint16      TA16:1;    
    Uint16      TA17:1;    
    Uint16      TA18:1;    
    Uint16      TA19:1;    
    Uint16      TA20:1;    
    Uint16      TA21:1;    
    Uint16      TA22:1;    
    Uint16      TA23:1;    
    Uint16      TA24:1;    
    Uint16      TA25:1;    
    Uint16      TA26:1;    
    Uint16      TA27:1;    
    Uint16      TA28:1;    
    Uint16      TA29:1;    
    Uint16      TA30:1;    
    Uint16      TA31:1;    
};




union CANTA_REG {
    Uint32             all;
    struct CANTA_BITS  bit;
};




struct  CANAA_BITS {       
    Uint16      AA0:1;     
    Uint16      AA1:1;     
    Uint16      AA2:1;     
    Uint16      AA3:1;     
    Uint16      AA4:1;     
    Uint16      AA5:1;     
    Uint16      AA6:1;     
    Uint16      AA7:1;     
    Uint16      AA8:1;     
    Uint16      AA9:1;     
    Uint16      AA10:1;    
    Uint16      AA11:1;    
    Uint16      AA12:1;    
    Uint16      AA13:1;    
    Uint16      AA14:1;    
    Uint16      AA15:1;    
    Uint16      AA16:1;    
    Uint16      AA17:1;    
    Uint16      AA18:1;    
    Uint16      AA19:1;    
    Uint16      AA20:1;    
    Uint16      AA21:1;    
    Uint16      AA22:1;    
    Uint16      AA23:1;    
    Uint16      AA24:1;    
    Uint16      AA25:1;    
    Uint16      AA26:1;    
    Uint16      AA27:1;    
    Uint16      AA28:1;    
    Uint16      AA29:1;    
    Uint16      AA30:1;    
    Uint16      AA31:1;    
};




union CANAA_REG {
    Uint32             all;
    struct CANAA_BITS  bit;
};




struct  CANRMP_BITS {       
    Uint16      RMP0:1;     
    Uint16      RMP1:1;     
    Uint16      RMP2:1;     
    Uint16      RMP3:1;     
    Uint16      RMP4:1;     
    Uint16      RMP5:1;     
    Uint16      RMP6:1;     
    Uint16      RMP7:1;     
    Uint16      RMP8:1;     
    Uint16      RMP9:1;     
    Uint16      RMP10:1;    
    Uint16      RMP11:1;    
    Uint16      RMP12:1;    
    Uint16      RMP13:1;    
    Uint16      RMP14:1;    
    Uint16      RMP15:1;    
    Uint16      RMP16:1;    
    Uint16      RMP17:1;    
    Uint16      RMP18:1;    
    Uint16      RMP19:1;    
    Uint16      RMP20:1;    
    Uint16      RMP21:1;    
    Uint16      RMP22:1;    
    Uint16      RMP23:1;    
    Uint16      RMP24:1;    
    Uint16      RMP25:1;    
    Uint16      RMP26:1;    
    Uint16      RMP27:1;    
    Uint16      RMP28:1;    
    Uint16      RMP29:1;    
    Uint16      RMP30:1;    
    Uint16      RMP31:1;    
};




union CANRMP_REG {
    Uint32              all;
    struct CANRMP_BITS  bit;
};




struct  CANRML_BITS {       
    Uint16      RML0:1;     
    Uint16      RML1:1;     
    Uint16      RML2:1;     
    Uint16      RML3:1;     
    Uint16      RML4:1;     
    Uint16      RML5:1;     
    Uint16      RML6:1;     
    Uint16      RML7:1;     
    Uint16      RML8:1;     
    Uint16      RML9:1;     
    Uint16      RML10:1;    
    Uint16      RML11:1;    
    Uint16      RML12:1;    
    Uint16      RML13:1;    
    Uint16      RML14:1;    
    Uint16      RML15:1;    
    Uint16      RML16:1;    
    Uint16      RML17:1;    
    Uint16      RML18:1;    
    Uint16      RML19:1;    
    Uint16      RML20:1;    
    Uint16      RML21:1;    
    Uint16      RML22:1;    
    Uint16      RML23:1;    
    Uint16      RML24:1;    
    Uint16      RML25:1;    
    Uint16      RML26:1;    
    Uint16      RML27:1;    
    Uint16      RML28:1;    
    Uint16      RML29:1;    
    Uint16      RML30:1;    
    Uint16      RML31:1;    
};




union CANRML_REG {
    Uint32              all;
    struct CANRML_BITS  bit;
};




struct  CANRFP_BITS {       
    Uint16      RFP0:1;     
    Uint16      RFP1:1;     
    Uint16      RFP2:1;     
    Uint16      RFP3:1;     
    Uint16      RFP4:1;     
    Uint16      RFP5:1;     
    Uint16      RFP6:1;     
    Uint16      RFP7:1;     
    Uint16      RFP8:1;     
    Uint16      RFP9:1;     
    Uint16      RFP10:1;    
    Uint16      RFP11:1;    
    Uint16      RFP12:1;    
    Uint16      RFP13:1;    
    Uint16      RFP14:1;    
    Uint16      RFP15:1;    
    Uint16      RFP16:1;    
    Uint16      RFP17:1;    
    Uint16      RFP18:1;    
    Uint16      RFP19:1;    
    Uint16      RFP20:1;    
    Uint16      RFP21:1;    
    Uint16      RFP22:1;    
    Uint16      RFP23:1;    
    Uint16      RFP24:1;    
    Uint16      RFP25:1;    
    Uint16      RFP26:1;    
    Uint16      RFP27:1;    
    Uint16      RFP28:1;    
    Uint16      RFP29:1;    
    Uint16      RFP30:1;    
    Uint16      RFP31:1;    
};




union CANRFP_REG {
    Uint32              all;
    struct CANRFP_BITS  bit;
};




struct  CANGAM_BITS {    
    Uint16 GAM150:16;    
    Uint16 GAM2816:13;   
    Uint16 rsvd:2;       
    Uint16 AMI:1;        
};




union CANGAM_REG {
    Uint32              all;
    struct CANGAM_BITS  bit;
};




struct  CANMC_BITS {        
    Uint16      MBNR:5;     
    Uint16      SRES:1;     
    Uint16      STM:1;      
    Uint16      ABO:1;      
    Uint16      CDR:1;      
    Uint16      WUBA:1;     
    Uint16      DBO:1;      
    Uint16      PDR:1;      
    Uint16      CCR:1;      
    Uint16      SCB:1;      
    Uint16      TCC:1;      
    Uint16      MBCC:1;     
    Uint16      SUSP:1;     
    Uint16      rsvd:15;    
};




union CANMC_REG {
    Uint32             all;
    struct CANMC_BITS  bit;
};




struct  CANBTC_BITS {       
    Uint16  TSEG2REG:3;     
    Uint16  TSEG1REG:4;     
    Uint16  SAM:1;          
    Uint16  SJWREG:2;       
    Uint16  rsvd1:6;        
    Uint16  BRPREG:8;       
    Uint16  rsvd2:8;        
};




union CANBTC_REG {
    Uint32              all;
    struct CANBTC_BITS  bit;
};




struct  CANES_BITS {     
    Uint16   TM:1;       
    Uint16   RM:1;       
    Uint16   rsvd1:1;    
    Uint16   PDA:1;      
    Uint16   CCE:1;      
    Uint16   SMA:1;      
    Uint16   rsvd2:10;   
    Uint16   EW:1;       
    Uint16   EP:1;       
    Uint16   BO:1;       
    Uint16   ACKE:1;     
    Uint16   SE:1;       
    Uint16   CRCE:1;     
    Uint16   SA1:1;      
    Uint16   BE:1;       
    Uint16   FE:1;       
    Uint16   rsvd3:7;    
};




union CANES_REG {
    Uint32             all;
    struct CANES_BITS  bit;
};




struct  CANTEC_BITS {   
    Uint16 TEC:8;       
    Uint16 rsvd1:8;     
    Uint16 rsvd2:16;    
};




union CANTEC_REG {
    Uint32              all;
    struct CANTEC_BITS  bit;
};




struct  CANREC_BITS {   
    Uint16 REC:8;       
    Uint16 rsvd1:8;     
    Uint16 rsvd2:16;    
};




union CANREC_REG {
   Uint32              all;
   struct CANREC_BITS  bit;
};




struct  CANGIF0_BITS {   
    Uint16   MIV0:5;     
    Uint16   rsvd1:3;    
    Uint16   WLIF0:1;    
    Uint16   EPIF0:1;    
    Uint16   BOIF0:1;    
    Uint16   RMLIF0:1;   
    Uint16   WUIF0:1;    
    Uint16   WDIF0:1;    
    Uint16   AAIF0:1;    
    Uint16   GMIF0:1;    
    Uint16   TCOF0:1;    
    Uint16   MTOF0:1;    
    Uint16   rsvd2:14;   
};




union CANGIF0_REG {
    Uint32               all;
    struct CANGIF0_BITS  bit;
};




struct  CANGIM_BITS {  
    Uint16  I0EN:1;    
    Uint16  I1EN:1;    
    Uint16  GIL:1;     
    Uint16  rsvd1:5;   
    Uint16  WLIM:1;    
    Uint16  EPIM:1;    
    Uint16  BOIM:1;    
    Uint16  RMLIM:1;   
    Uint16  WUIM:1;    
    Uint16  WDIM:1;    
    Uint16  AAIM:1;    
    Uint16  rsvd2:1;   
    Uint16  TCOM:1;    
    Uint16  MTOM:1;    
    Uint16  rsvd3:14;  
};




union CANGIM_REG {
    Uint32              all;
    struct CANGIM_BITS  bit;
};




struct  CANGIF1_BITS {      
    Uint16      MIV1:5;     
    Uint16      rsvd1:3;    
    Uint16      WLIF1:1;    
    Uint16      EPIF1:1;    
    Uint16      BOIF1:1;    
    Uint16      RMLIF1:1;   
    Uint16      WUIF1:1;    
    Uint16      WDIF1:1;    
    Uint16      AAIF1:1;    
    Uint16      GMIF1:1;    
    Uint16      TCOF1:1;    
    Uint16      MTOF1:1;    
    Uint16      rsvd2:14;   
};




union CANGIF1_REG {
    Uint32               all;
    struct CANGIF1_BITS  bit;
};




struct  CANMIM_BITS {       
    Uint16      MIM0:1;     
    Uint16      MIM1:1;     
    Uint16      MIM2:1;     
    Uint16      MIM3:1;     
    Uint16      MIM4:1;     
    Uint16      MIM5:1;     
    Uint16      MIM6:1;     
    Uint16      MIM7:1;     
    Uint16      MIM8:1;     
    Uint16      MIM9:1;     
    Uint16      MIM10:1;    
    Uint16      MIM11:1;    
    Uint16      MIM12:1;    
    Uint16      MIM13:1;    
    Uint16      MIM14:1;    
    Uint16      MIM15:1;    
    Uint16      MIM16:1;    
    Uint16      MIM17:1;    
    Uint16      MIM18:1;    
    Uint16      MIM19:1;    
    Uint16      MIM20:1;    
    Uint16      MIM21:1;    
    Uint16      MIM22:1;    
    Uint16      MIM23:1;    
    Uint16      MIM24:1;    
    Uint16      MIM25:1;    
    Uint16      MIM26:1;    
    Uint16      MIM27:1;    
    Uint16      MIM28:1;    
    Uint16      MIM29:1;    
    Uint16      MIM30:1;    
    Uint16      MIM31:1;    
};




union CANMIM_REG {
    Uint32              all;
    struct CANMIM_BITS  bit;
};




struct  CANMIL_BITS {       
    Uint16      MIL0:1;     
    Uint16      MIL1:1;     
    Uint16      MIL2:1;     
    Uint16      MIL3:1;     
    Uint16      MIL4:1;     
    Uint16      MIL5:1;     
    Uint16      MIL6:1;     
    Uint16      MIL7:1;     
    Uint16      MIL8:1;     
    Uint16      MIL9:1;     
    Uint16      MIL10:1;    
    Uint16      MIL11:1;    
    Uint16      MIL12:1;    
    Uint16      MIL13:1;    
    Uint16      MIL14:1;    
    Uint16      MIL15:1;    
    Uint16      MIL16:1;    
    Uint16      MIL17:1;    
    Uint16      MIL18:1;    
    Uint16      MIL19:1;    
    Uint16      MIL20:1;    
    Uint16      MIL21:1;    
    Uint16      MIL22:1;    
    Uint16      MIL23:1;    
    Uint16      MIL24:1;    
    Uint16      MIL25:1;    
    Uint16      MIL26:1;    
    Uint16      MIL27:1;    
    Uint16      MIL28:1;    
    Uint16      MIL29:1;    
    Uint16      MIL30:1;    
    Uint16      MIL31:1;    
};




union CANMIL_REG {
    Uint32              all;
    struct CANMIL_BITS  bit;
};




struct  CANOPC_BITS {       
    Uint16      OPC0:1;     
    Uint16      OPC1:1;     
    Uint16      OPC2:1;     
    Uint16      OPC3:1;     
    Uint16      OPC4:1;     
    Uint16      OPC5:1;     
    Uint16      OPC6:1;     
    Uint16      OPC7:1;     
    Uint16      OPC8:1;     
    Uint16      OPC9:1;     
    Uint16      OPC10:1;    
    Uint16      OPC11:1;    
    Uint16      OPC12:1;    
    Uint16      OPC13:1;    
    Uint16      OPC14:1;    
    Uint16      OPC15:1;    
    Uint16      OPC16:1;    
    Uint16      OPC17:1;    
    Uint16      OPC18:1;    
    Uint16      OPC19:1;    
    Uint16      OPC20:1;    
    Uint16      OPC21:1;    
    Uint16      OPC22:1;    
    Uint16      OPC23:1;    
    Uint16      OPC24:1;    
    Uint16      OPC25:1;    
    Uint16      OPC26:1;    
    Uint16      OPC27:1;    
    Uint16      OPC28:1;    
    Uint16      OPC29:1;    
    Uint16      OPC30:1;    
    Uint16      OPC31:1;    
};




union CANOPC_REG {
    Uint32              all;
    struct CANOPC_BITS  bit;
};




struct  CANTIOC_BITS {  
    Uint16  rsvd1:3;    
    Uint16  TXFUNC:1;   
    Uint16  rsvd2:12;   
    Uint16  rsvd3:16;   
};




union CANTIOC_REG {
    Uint32               all;
    struct CANTIOC_BITS  bit;
};




struct  CANRIOC_BITS {  
    Uint16  rsvd1:3;    
    Uint16  RXFUNC:1;   
    Uint16  rsvd2:12;   
    Uint16  rsvd3:16;   
};




union CANRIOC_REG {
    Uint32               all;
    struct CANRIOC_BITS  bit;
};




struct  CANTOC_BITS {       
    Uint16      TOC0:1;     
    Uint16      TOC1:1;     
    Uint16      TOC2:1;     
    Uint16      TOC3:1;     
    Uint16      TOC4:1;     
    Uint16      TOC5:1;     
    Uint16      TOC6:1;     
    Uint16      TOC7:1;     
    Uint16      TOC8:1;     
    Uint16      TOC9:1;     
    Uint16      TOC10:1;    
    Uint16      TOC11:1;    
    Uint16      TOC12:1;    
    Uint16      TOC13:1;    
    Uint16      TOC14:1;    
    Uint16      TOC15:1;    
    Uint16      TOC16:1;    
    Uint16      TOC17:1;    
    Uint16      TOC18:1;    
    Uint16      TOC19:1;    
    Uint16      TOC20:1;    
    Uint16      TOC21:1;    
    Uint16      TOC22:1;    
    Uint16      TOC23:1;    
    Uint16      TOC24:1;    
    Uint16      TOC25:1;    
    Uint16      TOC26:1;    
    Uint16      TOC27:1;    
    Uint16      TOC28:1;    
    Uint16      TOC29:1;    
    Uint16      TOC30:1;    
    Uint16      TOC31:1;    
};




union CANTOC_REG {
    Uint32              all;
    struct CANTOC_BITS  bit;
};




struct  CANTOS_BITS {       
    Uint16      TOS0:1;     
    Uint16      TOS1:1;     
    Uint16      TOS2:1;     
    Uint16      TOS3:1;     
    Uint16      TOS4:1;     
    Uint16      TOS5:1;     
    Uint16      TOS6:1;     
    Uint16      TOS7:1;     
    Uint16      TOS8:1;     
    Uint16      TOS9:1;     
    Uint16      TOS10:1;    
    Uint16      TOS11:1;    
    Uint16      TOS12:1;    
    Uint16      TOS13:1;    
    Uint16      TOS14:1;    
    Uint16      TOS15:1;    
    Uint16      TOS16:1;    
    Uint16      TOS17:1;    
    Uint16      TOS18:1;    
    Uint16      TOS19:1;    
    Uint16      TOS20:1;    
    Uint16      TOS21:1;    
    Uint16      TOS22:1;    
    Uint16      TOS23:1;    
    Uint16      TOS24:1;    
    Uint16      TOS25:1;    
    Uint16      TOS26:1;    
    Uint16      TOS27:1;    
    Uint16      TOS28:1;    
    Uint16      TOS29:1;    
    Uint16      TOS30:1;    
    Uint16      TOS31:1;    
};




union CANTOS_REG {
    Uint32              all;
    struct CANTOS_BITS  bit;
};




struct ECAN_REGS {
    union CANME_REG   CANME;          
    union CANMD_REG   CANMD;          
    union CANTRS_REG  CANTRS;         
    union CANTRR_REG  CANTRR;         
    union CANTA_REG   CANTA;          
    union CANAA_REG   CANAA;          
    union CANRMP_REG  CANRMP;         
    union CANRML_REG  CANRML;         
    union CANRFP_REG  CANRFP;         
    union CANGAM_REG  CANGAM;         
    union CANMC_REG   CANMC;          
    union CANBTC_REG  CANBTC;         
    union CANES_REG   CANES;          
    union CANTEC_REG  CANTEC;         
    union CANREC_REG  CANREC;         
    union CANGIF0_REG CANGIF0;        
    union CANGIM_REG  CANGIM;         
    union CANGIF1_REG CANGIF1;        
    union CANMIM_REG  CANMIM;         
    union CANMIL_REG  CANMIL;         
    union CANOPC_REG  CANOPC;         
    union CANTIOC_REG CANTIOC;        
    union CANRIOC_REG CANRIOC;        
    Uint32            CANTSC;         
    union CANTOC_REG  CANTOC;         
    union CANTOS_REG  CANTOS;         
};








struct  CANMSGID_BITS {         
    Uint16      EXTMSGID_L:16;  
    Uint16      EXTMSGID_H:2;   
    Uint16      STDMSGID:11;    
    Uint16      AAM:1;          
    Uint16      AME:1;          
    Uint16      IDE:1;          
};




union CANMSGID_REG {
    Uint32                all;
    struct CANMSGID_BITS  bit;
};




struct  CANMSGCTRL_BITS {     
    Uint16 DLC:4;             
    Uint16 RTR:1;             
    Uint16 rsvd1:3;           
    Uint16 TPL:5;             
    Uint16 rsvd2:3;           
    Uint16 rsvd3:16;          
};




union CANMSGCTRL_REG {
    Uint32                  all;
    struct CANMSGCTRL_BITS  bit;
};




struct  CANMDL_WORDS {       
    Uint16      LOW_WORD:16; 
    Uint16      HI_WORD:16;  
};




struct  CANMDL_BYTES {       
    Uint16      BYTE3:8;     
    Uint16      BYTE2:8;     
    Uint16      BYTE1:8;     
    Uint16      BYTE0:8;     
};




union CANMDL_REG {
    Uint32                all;
    struct CANMDL_WORDS   word;
    struct CANMDL_BYTES   byte;
};




struct  CANMDH_WORDS {          
    Uint16      LOW_WORD:16;    
    Uint16      HI_WORD:16;     
};




struct  CANMDH_BYTES {       
    Uint16      BYTE7:8;     
    Uint16      BYTE6:8;     
    Uint16      BYTE5:8;     
    Uint16      BYTE4:8;     
};




union CANMDH_REG {
    Uint32                  all;
    struct CANMDH_WORDS     word;
    struct CANMDH_BYTES     byte;
};

struct MBOX {
    union CANMSGID_REG     MSGID;
    union CANMSGCTRL_REG   MSGCTRL;
    union CANMDL_REG       MDL;
    union CANMDH_REG       MDH;
};




struct ECAN_MBOXES {
    struct MBOX MBOX0;
    struct MBOX MBOX1;
    struct MBOX MBOX2;
    struct MBOX MBOX3;
    struct MBOX MBOX4;
    struct MBOX MBOX5;
    struct MBOX MBOX6;
    struct MBOX MBOX7;
    struct MBOX MBOX8;
    struct MBOX MBOX9;
    struct MBOX MBOX10;
    struct MBOX MBOX11;
    struct MBOX MBOX12;
    struct MBOX MBOX13;
    struct MBOX MBOX14;
    struct MBOX MBOX15;
    struct MBOX MBOX16;
    struct MBOX MBOX17;
    struct MBOX MBOX18;
    struct MBOX MBOX19;
    struct MBOX MBOX20;
    struct MBOX MBOX21;
    struct MBOX MBOX22;
    struct MBOX MBOX23;
    struct MBOX MBOX24;
    struct MBOX MBOX25;
    struct MBOX MBOX26;
    struct MBOX MBOX27;
    struct MBOX MBOX28;
    struct MBOX MBOX29;
    struct MBOX MBOX30;
    struct MBOX MBOX31;
};




struct  CANLAM_BITS {         
    Uint16      LAM_L:16;     
    Uint16      LAM_H:13;     
    Uint16 rsvd1:2;           
    Uint16      LAMI:1;       
};




union CANLAM_REG {
    Uint32        all;
    struct CANLAM_BITS  bit;
};








struct LAM_REGS {
    union CANLAM_REG LAM0;
    union CANLAM_REG LAM1;
    union CANLAM_REG LAM2;
    union CANLAM_REG LAM3;
    union CANLAM_REG LAM4;
    union CANLAM_REG LAM5;
    union CANLAM_REG LAM6;
    union CANLAM_REG LAM7;
    union CANLAM_REG LAM8;
    union CANLAM_REG LAM9;
    union CANLAM_REG LAM10;
    union CANLAM_REG LAM11;
    union CANLAM_REG LAM12;
    union CANLAM_REG LAM13;
    union CANLAM_REG LAM14;
    union CANLAM_REG LAM15;
    union CANLAM_REG LAM16;
    union CANLAM_REG LAM17;
    union CANLAM_REG LAM18;
    union CANLAM_REG LAM19;
    union CANLAM_REG LAM20;
    union CANLAM_REG LAM21;
    union CANLAM_REG LAM22;
    union CANLAM_REG LAM23;
    union CANLAM_REG LAM24;
    union CANLAM_REG LAM25;
    union CANLAM_REG LAM26;
    union CANLAM_REG LAM27;
    union CANLAM_REG LAM28;
    union CANLAM_REG LAM29;
    union CANLAM_REG LAM30;
    union CANLAM_REG LAM31;
};




struct MOTS_REGS {
    Uint32 MOTS0;
    Uint32 MOTS1;
    Uint32 MOTS2;
    Uint32 MOTS3;
    Uint32 MOTS4;
    Uint32 MOTS5;
    Uint32 MOTS6;
    Uint32 MOTS7;
    Uint32 MOTS8;
    Uint32 MOTS9;
    Uint32 MOTS10;
    Uint32 MOTS11;
    Uint32 MOTS12;
    Uint32 MOTS13;
    Uint32 MOTS14;
    Uint32 MOTS15;
    Uint32 MOTS16;
    Uint32 MOTS17;
    Uint32 MOTS18;
    Uint32 MOTS19;
    Uint32 MOTS20;
    Uint32 MOTS21;
    Uint32 MOTS22;
    Uint32 MOTS23;
    Uint32 MOTS24;
    Uint32 MOTS25;
    Uint32 MOTS26;
    Uint32 MOTS27;
    Uint32 MOTS28;
    Uint32 MOTS29;
    Uint32 MOTS30;
    Uint32 MOTS31;
};




struct MOTO_REGS {
    Uint32 MOTO0;
    Uint32 MOTO1;
    Uint32 MOTO2;
    Uint32 MOTO3;
    Uint32 MOTO4;
    Uint32 MOTO5;
    Uint32 MOTO6;
    Uint32 MOTO7;
    Uint32 MOTO8;
    Uint32 MOTO9;
    Uint32 MOTO10;
    Uint32 MOTO11;
    Uint32 MOTO12;
    Uint32 MOTO13;
    Uint32 MOTO14;
    Uint32 MOTO15;
    Uint32 MOTO16;
    Uint32 MOTO17;
    Uint32 MOTO18;
    Uint32 MOTO19;
    Uint32 MOTO20;
    Uint32 MOTO21;
    Uint32 MOTO22;
    Uint32 MOTO23;
    Uint32 MOTO24;
    Uint32 MOTO25;
    Uint32 MOTO26;
    Uint32 MOTO27;
    Uint32 MOTO28;
    Uint32 MOTO29;
    Uint32 MOTO30;
    Uint32 MOTO31;
};




extern volatile struct ECAN_REGS ECanaRegs;
extern volatile struct ECAN_MBOXES ECanaMboxes;
extern volatile struct LAM_REGS ECanaLAMRegs;
extern volatile struct MOTO_REGS ECanaMOTORegs;
extern volatile struct MOTS_REGS ECanaMOTSRegs;

extern volatile struct ECAN_REGS ECanbRegs;
extern volatile struct ECAN_MBOXES ECanbMboxes;
extern volatile struct LAM_REGS ECanbLAMRegs;
extern volatile struct MOTO_REGS ECanbMOTORegs;
extern volatile struct MOTS_REGS ECanbMOTSRegs;

























































struct ECCTL1_BITS {           
    Uint16 CAP1POL:1;          
    Uint16 CTRRST1:1;          
    Uint16 CAP2POL:1;          
    Uint16 CTRRST2:1;          
    Uint16 CAP3POL:1;          
    Uint16 CTRRST3:1;          
    Uint16 CAP4POL:1;          
    Uint16 CTRRST4:1;          
    Uint16 CAPLDEN:1;          
                               
    Uint16 PRESCALE:5;         
    Uint16 FREE_SOFT:2;        
};

union ECCTL1_REG {
    Uint16              all;
    struct ECCTL1_BITS  bit;
};










struct ECCTL2_BITS {          
    Uint16 CONT_ONESHT:1;      
    Uint16 STOP_WRAP:2;        
    Uint16 REARM:1;            
    Uint16 TSCTRSTOP:1;        
    Uint16 SYNCI_EN:1;         
    Uint16 SYNCO_SEL:2;        
    Uint16 SWSYNC:1;           
    Uint16 CAP_APWM:1;         
    Uint16 APWMPOL:1;          
    Uint16 rsvd1:5;            
};

union ECCTL2_REG {
    Uint16              all;
    struct ECCTL2_BITS  bit;
};




struct ECEINT_BITS {           
    Uint16 rsvd1:1;            
    Uint16 CEVT1:1;            
    Uint16 CEVT2:1;            
    Uint16 CEVT3:1;            
    Uint16 CEVT4:1;            
    Uint16 CTROVF:1;           
    Uint16 CTR_EQ_PRD:1;       
    Uint16 CTR_EQ_CMP:1;       
    Uint16 rsvd2:8;            
};

union ECEINT_REG {
   Uint16              all;
   struct ECEINT_BITS  bit;
};




struct ECFLG_BITS {           
    Uint16 INT:1;              
    Uint16 CEVT1:1;            
    Uint16 CEVT2:1;            
    Uint16 CEVT3:1;            
    Uint16 CEVT4:1;            
    Uint16 CTROVF:1;           
    Uint16 CTR_EQ_PRD:1;       
    Uint16 CTR_EQ_CMP:1;       
    Uint16 rsvd2:8;            
};

union ECFLG_REG {
    Uint16              all;
    struct ECFLG_BITS   bit;
};

struct ECAP_REGS {
    Uint32              TSCTR;    
    Uint32              CTRPHS;   
    Uint32              CAP1;     
    Uint32              CAP2;     
    Uint32              CAP3;     
    Uint32              CAP4;     
    Uint16              rsvd1[8]; 
    union   ECCTL1_REG  ECCTL1;   
    union   ECCTL2_REG  ECCTL2;   
    union   ECEINT_REG  ECEINT;   
    union   ECFLG_REG   ECFLG;    
    union   ECFLG_REG   ECCLR;    
    union   ECEINT_REG  ECFRC;    
    Uint16              rsvd2[6]; 
};




extern volatile struct ECAP_REGS ECap1Regs;
extern volatile struct ECAP_REGS ECap2Regs;
extern volatile struct ECAP_REGS ECap3Regs;
extern volatile struct ECAP_REGS ECap4Regs;
extern volatile struct ECAP_REGS ECap5Regs;
extern volatile struct ECAP_REGS ECap6Regs;

























































struct MODE_BITS {      
    Uint16 PERINTSEL:5; 
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
    Uint16 rsvd1:2;     
    Uint16 OVRINTE:1;   
                        
                        
    Uint16 PERINTE:1;   
                        
                        
    Uint16 CHINTMODE:1; 
                        
                        
                        
    Uint16 ONESHOT:1;   
                        
                        
                        
                        
    Uint16 CONTINUOUS:1;
                        
                        
                        
    Uint16 SYNCE:1;     
                        
                        
    Uint16 SYNCSEL:1;   
                        
                        
                        
                        
    Uint16 DATASIZE:1;  
                        
                        
    Uint16 CHINTE:1;    
                        
                        
};

union MODE_REG {
    Uint16                all;
    struct MODE_BITS      bit;
};




struct CONTROL_BITS {       
    Uint16 RUN:1;           
    Uint16 HALT:1;          
    Uint16 SOFTRESET:1;     
    Uint16 PERINTFRC:1;     
    Uint16 PERINTCLR:1;     
    Uint16 SYNCFRC:1;       
    Uint16 SYNCCLR:1;       
    Uint16 ERRCLR:1;        
    Uint16 PERINTFLG:1;     
                            
                            
    Uint16 SYNCFLG:1;       
                            
                            
    Uint16 SYNCERR:1;       
                            
                            
    Uint16 TRANSFERSTS:1;   
                            
                            
    Uint16 BURSTSTS:1;      
                            
                            
    Uint16 RUNSTS:1;        
                            
                            
    Uint16 OVRFLG:1;        
                            
                            
    Uint16 rsvd1:1;         
};

union CONTROL_REG {
    Uint16                 all;
    struct CONTROL_BITS    bit;
};




struct DMACTRL_BITS {         
    Uint16 HARDRESET:1;       
    Uint16 PRIORITYRESET:1;   
    Uint16 rsvd1:14;          
};

union DMACTRL_REG {
    Uint16                 all;
    struct DMACTRL_BITS    bit;
};




struct DEBUGCTRL_BITS {     
    Uint16 rsvd1:15;        
    Uint16 FREE:1;          
                            
                            
};

union DEBUGCTRL_REG {
    Uint16                 all;
    struct DEBUGCTRL_BITS  bit;
};




struct PRIORITYCTRL1_BITS { 
   Uint16 CH1PRIORITY:1;    
                            
                            
   Uint16 rsvd1:15;         
};

union PRIORITYCTRL1_REG {
    Uint16                     all;
    struct PRIORITYCTRL1_BITS  bit;
};




struct PRIORITYSTAT_BITS {     
    Uint16 ACTIVESTS:3;        
                               
                               
                               
                               
                               
                               
                               
    Uint16 rsvd1:1;            
    Uint16 ACTIVESTS_SHADOW:3; 
                               
                               
                               
                               
                               
                               
                               
    Uint16 rsvd2:9;            
};

union PRIORITYSTAT_REG {
    Uint16                     all;
    struct PRIORITYSTAT_BITS   bit;
};




struct BURST_SIZE_BITS {   
    Uint16 BURSTSIZE:5;    
    Uint16 rsvd1:11;       
};

union BURST_SIZE_REG {
    Uint16                  all;
    struct BURST_SIZE_BITS  bit;
};




struct BURST_COUNT_BITS { 
    Uint16 BURSTCOUNT:5;   
    Uint16 rsvd1:11;       
};

union BURST_COUNT_REG {
    Uint16                   all;
    struct BURST_COUNT_BITS  bit;
};




struct CH_REGS {
    union  MODE_REG            MODE;                 
    union  CONTROL_REG         CONTROL;              

    union  BURST_SIZE_REG      BURST_SIZE;           
    union  BURST_COUNT_REG     BURST_COUNT;          
    
    
    
    
    int16                      SRC_BURST_STEP;       
    
    
    
    
    int16                      DST_BURST_STEP;

    Uint16                     TRANSFER_SIZE;        
    Uint16                     TRANSFER_COUNT;       
    
    
    
    
    int16                      SRC_TRANSFER_STEP;
    
    
    
    
    int16                      DST_TRANSFER_STEP;

    Uint16                     SRC_WRAP_SIZE;      
    Uint16                     SRC_WRAP_COUNT;     
    int16                      SRC_WRAP_STEP;      

    
    
    
    Uint16                     DST_WRAP_SIZE;        
    
    
    
    
    Uint16                     DST_WRAP_COUNT;
    
    
    
    
    int16                      DST_WRAP_STEP;

    
    
    
    Uint32                     SRC_BEG_ADDR_SHADOW;
    
    
    
    
    Uint32                     SRC_ADDR_SHADOW;
    
    
    
    
    Uint32                     SRC_BEG_ADDR_ACTIVE;
    
    
    
    
    Uint32                     SRC_ADDR_ACTIVE;

    
    
    
    Uint32                     DST_BEG_ADDR_SHADOW;
    
    
    
    
    Uint32                     DST_ADDR_SHADOW;
    
    
    
    
    Uint32                     DST_BEG_ADDR_ACTIVE;
    
    
    
    
    Uint32                     DST_ADDR_ACTIVE;
};




struct DMA_REGS {
    union  DMACTRL_REG         DMACTRL;          
    union  DEBUGCTRL_REG       DEBUGCTRL;        
    Uint16                     rsvd0;            
    Uint16                     rsvd1;            
    union  PRIORITYCTRL1_REG   PRIORITYCTRL1;    
    Uint16                     rsvd2;            
    union  PRIORITYSTAT_REG    PRIORITYSTAT;     
    Uint16                     rsvd3[25];        
    struct CH_REGS             CH1;              
    struct CH_REGS             CH2;              
    struct CH_REGS             CH3;              
    struct CH_REGS             CH4;              
    struct CH_REGS             CH5;              
    struct CH_REGS             CH6;              
};




extern volatile struct DMA_REGS DmaRegs;

























































struct TBCTL_BITS {           
    Uint16 CTRMODE:2;         
    Uint16 PHSEN:1;           
    Uint16 PRDLD:1;           
    Uint16 SYNCOSEL:2;        
    Uint16 SWFSYNC:1;         
    Uint16 HSPCLKDIV:3;       
    Uint16 CLKDIV:3;          
    Uint16 PHSDIR:1;          
    Uint16 FREE_SOFT:2;       
};

union TBCTL_REG {
    Uint16              all;
    struct TBCTL_BITS   bit;
};




struct TBSTS_BITS {          
    Uint16 CTRDIR:1;          
    Uint16 SYNCI:1;           
    Uint16 CTRMAX:1;          
    Uint16 rsvd1:13;          
};

union TBSTS_REG {
    Uint16              all;
    struct TBSTS_BITS   bit;
};




struct CMPCTL_BITS {           
    Uint16 LOADAMODE:2;        
    Uint16 LOADBMODE:2;        
    Uint16 SHDWAMODE:1;        
    Uint16 rsvd1:1;            
    Uint16 SHDWBMODE:1;        
    Uint16 rsvd2:1;            
    Uint16 SHDWAFULL:1;        
    Uint16 SHDWBFULL:1;        
    Uint16 rsvd3:6;            
};

union CMPCTL_REG {
    Uint16                all;
    struct CMPCTL_BITS    bit;
};




struct AQCTL_BITS {            
    Uint16 ZRO:2;              
    Uint16 PRD:2;              
    Uint16 CAU:2;              
    Uint16 CAD:2;              
    Uint16 CBU:2;              
    Uint16 CBD:2;              
    Uint16 rsvd:4;             
};

union AQCTL_REG {
    Uint16                all;
    struct AQCTL_BITS     bit;
};




struct AQSFRC_BITS {            
    Uint16 ACTSFA:2;            
    Uint16 OTSFA:1;             
    Uint16 ACTSFB:2;            
    Uint16 OTSFB:1;             
    Uint16 RLDCSF:2;            
    Uint16 rsvd1:8;             
};

union AQSFRC_REG {
    Uint16                 all;
    struct AQSFRC_BITS     bit;
};




struct AQCSFRC_BITS {           
    Uint16 CSFA:2;              
    Uint16 CSFB:2;              
    Uint16 rsvd1:12;            
};

union AQCSFRC_REG {
    Uint16                  all;
    struct AQCSFRC_BITS     bit;
};












struct DBCTL_BITS {              
    Uint16 OUT_MODE:2;      	 
    Uint16 POLSEL:2;             
    Uint16 IN_MODE:2;            
    Uint16 rsvd1:10;             
};

union DBCTL_REG {
    Uint16                  all;
    struct DBCTL_BITS       bit;
};




struct TZSEL_BITS {            
    Uint16  CBC1:1;            
    Uint16  CBC2:1;            
    Uint16  CBC3:1;            
    Uint16  CBC4:1;            
    Uint16  CBC5:1;            
    Uint16  CBC6:1;            
    Uint16  rsvd1:2;           
    Uint16  OSHT1:1;           
    Uint16  OSHT2:1;           
    Uint16  OSHT3:1;           
    Uint16  OSHT4:1;           
    Uint16  OSHT5:1;           
    Uint16  OSHT6:1;           
    Uint16  rsvd2:2;           
};

union TZSEL_REG {
    Uint16                  all;
    struct TZSEL_BITS       bit;
};




struct TZCTL_BITS {          
    Uint16 TZA:2;            
    Uint16 TZB:2;            
    Uint16 rsvd:12;          
};

union TZCTL_REG {
    Uint16                  all;
    struct TZCTL_BITS       bit;
};




struct TZEINT_BITS {          
    Uint16  rsvd1:1;          
    Uint16  CBC:1;            
    Uint16  OST:1;            
    Uint16  rsvd2:13;         
};   

union TZEINT_REG {
    Uint16                  all;
    struct TZEINT_BITS      bit;
};




struct TZFLG_BITS {          
    Uint16  INT:1;           
    Uint16  CBC:1;           
    Uint16  OST:1;           
    Uint16  rsvd2:13;        
};

union TZFLG_REG {
    Uint16                  all;
    struct TZFLG_BITS       bit;
};




struct TZCLR_BITS {          
    Uint16  INT:1;           
    Uint16  CBC:1;           
    Uint16  OST:1;           
    Uint16  rsvd2:13;        
};

union TZCLR_REG {
    Uint16                  all;
    struct TZCLR_BITS       bit;
};




struct TZFRC_BITS {          
    Uint16  rsvd1:1;         
    Uint16  CBC:1;           
    Uint16  OST:1;           
    Uint16  rsvd2:13;        
};

union TZFRC_REG {
    Uint16                  all;
    struct TZFRC_BITS       bit;
};




struct ETSEL_BITS {          
    Uint16  INTSEL:3;        
    Uint16  INTEN:1;         
    Uint16  rsvd1:4;         
    Uint16  SOCASEL:3;       
    Uint16  SOCAEN:1;        
    Uint16  SOCBSEL:3;       
    Uint16  SOCBEN:1;        
};

union ETSEL_REG {
    Uint16                  all;
    struct ETSEL_BITS       bit;
};




struct ETPS_BITS {          
    Uint16  INTPRD:2;       
    Uint16  INTCNT:2;       
    Uint16  rsvd1:4;        
    Uint16  SOCAPRD:2;      
    Uint16  SOCACNT:2;      
    Uint16  SOCBPRD:2;      
    Uint16  SOCBCNT:2;      
};

union ETPS_REG {
    Uint16                  all;
    struct ETPS_BITS        bit;
};




struct ETFLG_BITS {          
    Uint16  INT:1;           
    Uint16  rsvd1:1;         
    Uint16  SOCA:1;          
    Uint16  SOCB:1;          
    Uint16  rsvd2:12;        
};

union ETFLG_REG {
    Uint16                   all;
    struct ETFLG_BITS        bit;
};




struct ETCLR_BITS {          
    Uint16  INT:1;           
    Uint16  rsvd1:1;         
    Uint16  SOCA:1;          
    Uint16  SOCB:1;          
    Uint16  rsvd2:12;        
};

union ETCLR_REG {
    Uint16                   all;
    struct ETCLR_BITS        bit;
};




struct ETFRC_BITS {          
    Uint16  INT:1;           
    Uint16  rsvd1:1;         
    Uint16  SOCA:1;          
    Uint16  SOCB:1;          
    Uint16  rsvd2:12;        
};

union ETFRC_REG {
    Uint16                  all;
    struct ETFRC_BITS        bit;
};




struct PCCTL_BITS {          
    Uint16  CHPEN:1;         
    Uint16  OSHTWTH:4;       
    Uint16  CHPFREQ:3;       
    Uint16  CHPDUTY:3;       
    Uint16  rsvd1:5;         
};

union PCCTL_REG {
    Uint16                  all;
    struct PCCTL_BITS       bit;
};

struct HRCNFG_BITS {       	
    Uint16  EDGMODE:2;     	
    Uint16  CTLMODE:1;     	
    Uint16  HRLOAD:1;      	
    Uint16  rsvd1:12;      	
};

union HRCNFG_REG {
    Uint16                  	all;
    struct HRCNFG_BITS       bit;
};

struct TBPHS_HRPWM_REG {   	 
    Uint16  TBPHSHR;     	 
    Uint16  TBPHS;           
};

union TBPHS_HRPWM_GROUP {
    Uint32                  all;
    struct TBPHS_HRPWM_REG  half;
};

struct CMPA_HRPWM_REG { 
    Uint16  CMPAHR;     
    Uint16  CMPA;       
};

union CMPA_HRPWM_GROUP {
    Uint32                 all;
    struct CMPA_HRPWM_REG  half;
};

struct EPWM_REGS {
    union  TBCTL_REG           TBCTL;   
    union  TBSTS_REG           TBSTS;   
    union  TBPHS_HRPWM_GROUP   TBPHS;   
    Uint16                     TBCTR;   
    Uint16                     TBPRD;   
    Uint16                     rsvd1;   
    union  CMPCTL_REG          CMPCTL;  
    union  CMPA_HRPWM_GROUP    CMPA;    
    Uint16                     CMPB;    
    union  AQCTL_REG           AQCTLA;  
    union  AQCTL_REG           AQCTLB;  
    union  AQSFRC_REG          AQSFRC;  
    union  AQCSFRC_REG         AQCSFRC; 
    union  DBCTL_REG           DBCTL;   
    Uint16                     DBRED;   
    Uint16                     DBFED;   
    union  TZSEL_REG           TZSEL;   
    Uint16                     rsvd2;   
    union  TZCTL_REG           TZCTL;   
    union  TZEINT_REG          TZEINT;  
    union  TZFLG_REG           TZFLG;   
    union  TZCLR_REG           TZCLR;   
    union  TZFRC_REG    	   TZFRC;   
    union  ETSEL_REG           ETSEL;   
    union  ETPS_REG            ETPS;    
    union  ETFLG_REG           ETFLG;   
    union  ETCLR_REG           ETCLR;   
    union  ETFRC_REG           ETFRC;   
    union  PCCTL_REG           PCCTL;   
    Uint16                     rsvd3;   
    union  HRCNFG_REG          HRCNFG;  
};





extern volatile struct EPWM_REGS EPwm1Regs;
extern volatile struct EPWM_REGS EPwm2Regs;
extern volatile struct EPWM_REGS EPwm3Regs;
extern volatile struct EPWM_REGS EPwm4Regs;
extern volatile struct EPWM_REGS EPwm5Regs;
extern volatile struct EPWM_REGS EPwm6Regs;


























































struct QDECCTL_BITS {       
    Uint16 rsvd1:5;         
    Uint16 QSP:1;           
    Uint16 QIP:1;           
    Uint16 QBP:1;           
    Uint16 QAP:1;           
    Uint16 IGATE:1;         
    Uint16 SWAP:1;          
    Uint16 XCR:1;           
    Uint16 SPSEL:1;         
    Uint16 SOEN:1;          
    Uint16 QSRC:2;          
};

union QDECCTL_REG {
    Uint16              all;
    struct QDECCTL_BITS   bit;
};




struct QEPCTL_BITS {            
    Uint16 WDE:1;               
    Uint16 UTE:1;               
    Uint16 QCLM:1;              
    Uint16 QPEN:1;              
    Uint16 IEL:2;               
    Uint16 SEL:1;               
    Uint16 SWI:1;               
    Uint16 IEI:2;               
    Uint16 SEI:2;               
    Uint16 PCRM:2;              
    Uint16 FREE_SOFT:2;         
};

union QEPCTL_REG {
    Uint16               all;
    struct QEPCTL_BITS   bit;
};         




struct QCAPCTL_BITS {          
    Uint16 UPPS:4;              
    Uint16 CCPS:3;              
    Uint16 rsvd1:8;             
    Uint16 CEN:1;               
};

union QCAPCTL_REG {
    Uint16               all;
    struct QCAPCTL_BITS  bit;
}; 




struct QPOSCTL_BITS {           
    Uint16 PCSPW:12;            
    Uint16 PCE:1;               
    Uint16 PCPOL:1;             
    Uint16 PCLOAD:1;            
    Uint16 PCSHDW:1;            
};

union QPOSCTL_REG {
    Uint16               all;
    struct QPOSCTL_BITS  bit;
};         




struct QEINT_BITS {           
    Uint16 rsvd1:1;           
    Uint16 PCE:1;             
    Uint16 QPE:1;             
    Uint16 QDC:1;             
    Uint16 WTO:1;             
    Uint16 PCU:1;             
    Uint16 PCO:1;             
    Uint16 PCR:1;             
    Uint16 PCM:1;             
    Uint16 SEL:1;             
    Uint16 IEL:1;             
    Uint16 UTO:1;             
    Uint16 rsvd2:4;           
};

union QEINT_REG {
    Uint16               all;
    struct QEINT_BITS    bit;
};




struct QFLG_BITS {           
    Uint16 INT:1;            
    Uint16 PCE:1;            
    Uint16 PHE:1;            
    Uint16 QDC:1;            
    Uint16 WTO:1;            
    Uint16 PCU:1;            
    Uint16 PCO:1;            
    Uint16 PCR:1;            
    Uint16 PCM:1;            
    Uint16 SEL:1;            
    Uint16 IEL:1;            
    Uint16 UTO:1;            
    Uint16 rsvd2:4;          
};

union QFLG_REG {
    Uint16               all;
    struct QFLG_BITS     bit;
};




struct QFRC_BITS {           
    Uint16 reserved:1;       
    Uint16 PCE:1;            
    Uint16 PHE:1;            
    Uint16 QDC:1;            
    Uint16 WTO:1;            
    Uint16 PCU:1;            
    Uint16 PCO:1;            
    Uint16 PCR:1;            
    Uint16 PCM:1;            
    Uint16 SEL:1;            
    Uint16 IEL:1;            
    Uint16 UTO:1;            
    Uint16 rsvd2:4;          
};


union QFRC_REG {
    Uint16               all;
    struct QFRC_BITS     bit;
};









struct QEPSTS_BITS {           
    Uint16 PCEF:1;             
    Uint16 FIMF:1;             
    Uint16 CDEF:1;             
    Uint16 COEF:1;             
    Uint16 QDLF:1;             
    Uint16 QDF:1;              
    Uint16 FIDF:1;             
    Uint16 UPEVNT:1;           
    Uint16 rsvd1:8;            
};

union QEPSTS_REG {
    Uint16               all;
    struct QEPSTS_BITS   bit;
};

struct EQEP_REGS {
    Uint32              QPOSCNT;   
    Uint32              QPOSINIT;  
    Uint32              QPOSMAX;   
    Uint32              QPOSCMP;   
    Uint32              QPOSILAT;  
    Uint32              QPOSSLAT;  
    Uint32              QPOSLAT;   
    Uint32              QUTMR;     
    Uint32              QUPRD;     
    Uint16              QWDTMR;    
    Uint16              QWDPRD;    
    union  QDECCTL_REG  QDECCTL;   
    union  QEPCTL_REG   QEPCTL;    
    union  QCAPCTL_REG  QCAPCTL;   
    union  QPOSCTL_REG  QPOSCTL;   
    union  QEINT_REG    QEINT;     
    union  QFLG_REG     QFLG;      
    union  QFLG_REG     QCLR;      
    union  QFRC_REG     QFRC;      
    union  QEPSTS_REG   QEPSTS;    
    Uint16              QCTMR;     
    Uint16              QCPRD;     
    Uint16              QCTMRLAT;  
    Uint16              QCPRDLAT;  
    Uint16              rsvd1[30]; 
};




extern volatile struct EQEP_REGS EQep1Regs;
extern volatile struct EQEP_REGS EQep2Regs;

























































struct GPACTRL_BITS {         
    Uint16 QUALPRD0:8;        
    Uint16 QUALPRD1:8;        
    Uint16 QUALPRD2:8;        
    Uint16 QUALPRD3:8;        
};

union GPACTRL_REG {
    Uint32              all;
    struct GPACTRL_BITS bit;
};




struct GPBCTRL_BITS {        
    Uint16 QUALPRD0:8;        
    Uint16 QUALPRD1:8;        
    Uint16 QUALPRD2:8;        
    Uint16 QUALPRD3:8;        
};

union GPBCTRL_REG {
    Uint32              all;
    struct GPBCTRL_BITS bit;
};




struct GPA1_BITS {             
    Uint16 GPIO0:2;            
    Uint16 GPIO1:2;            
    Uint16 GPIO2:2;            
    Uint16 GPIO3:2;            
    Uint16 GPIO4:2;            
    Uint16 GPIO5:2;            
    Uint16 GPIO6:2;            
    Uint16 GPIO7:2;            
    Uint16 GPIO8:2;            
    Uint16 GPIO9:2;            
    Uint16 GPIO10:2;           
    Uint16 GPIO11:2;           
    Uint16 GPIO12:2;           
    Uint16 GPIO13:2;           
    Uint16 GPIO14:2;           
    Uint16 GPIO15:2;           
};

struct GPA2_BITS {             
    Uint16 GPIO16:2;           
    Uint16 GPIO17:2;           
    Uint16 GPIO18:2;           
    Uint16 GPIO19:2;           
    Uint16 GPIO20:2;           
    Uint16 GPIO21:2;           
    Uint16 GPIO22:2;           
    Uint16 GPIO23:2;           
    Uint16 GPIO24:2;           
    Uint16 GPIO25:2;           
    Uint16 GPIO26:2;           
    Uint16 GPIO27:2;           
    Uint16 GPIO28:2;           
    Uint16 GPIO29:2;           
    Uint16 GPIO30:2;           
    Uint16 GPIO31:2;           
};

struct GPB1_BITS {             
    Uint16 GPIO32:2;           
    Uint16 GPIO33:2;           
    Uint16 GPIO34:2;           
    Uint16 GPIO35:2;           
    Uint16 GPIO36:2;           
    Uint16 GPIO37:2;           
    Uint16 GPIO38:2;           
    Uint16 GPIO39:2;           
    Uint16 GPIO40:2;           
    Uint16 GPIO41:2;           
    Uint16 GPIO42:2;           
    Uint16 GPIO43:2;           
    Uint16 GPIO44:2;           
    Uint16 GPIO45:2;           
    Uint16 GPIO46:2;           
    Uint16 GPIO47:2;           
};

struct GPB2_BITS  {            
    Uint16 GPIO48:2;           
    Uint16 GPIO49:2;           
    Uint16 GPIO50:2;           
    Uint16 GPIO51:2;           
    Uint16 GPIO52:2;           
    Uint16 GPIO53:2;           
    Uint16 GPIO54:2;           
    Uint16 GPIO55:2;           
    Uint16 GPIO56:2;           
    Uint16 GPIO57:2;           
    Uint16 GPIO58:2;           
    Uint16 GPIO59:2;           
    Uint16 GPIO60:2;           
    Uint16 GPIO61:2;           
    Uint16 GPIO62:2;           
    Uint16 GPIO63:2;           
};

struct GPC1_BITS {             
    Uint16 GPIO64:2;           
    Uint16 GPIO65:2;           
    Uint16 GPIO66:2;           
    Uint16 GPIO67:2;           
    Uint16 GPIO68:2;           
    Uint16 GPIO69:2;           
    Uint16 GPIO70:2;           
    Uint16 GPIO71:2;           
    Uint16 GPIO72:2;           
    Uint16 GPIO73:2;           
    Uint16 GPIO74:2;           
    Uint16 GPIO75:2;           
    Uint16 GPIO76:2;           
    Uint16 GPIO77:2;           
    Uint16 GPIO78:2;           
    Uint16 GPIO79:2;           
};

struct GPC2_BITS {             
    Uint16 GPIO80:2;           
    Uint16 GPIO81:2;           
    Uint16 GPIO82:2;           
    Uint16 GPIO83:2;           
    Uint16 GPIO84:2;           
    Uint16 GPIO85:2;           
    Uint16 GPIO86:2;           
    Uint16 GPIO87:2;           
    Uint16 rsvd:16;            
};

union GPA1_REG {
    Uint32              all;
    struct GPA1_BITS    bit;
};

union GPA2_REG {
    Uint32              all;
    struct GPA2_BITS    bit;
};

union GPB1_REG {
    Uint32              all;
    struct GPB1_BITS    bit;
};

union GPB2_REG {
    Uint32              all;
    struct GPB2_BITS    bit;
};

union GPC1_REG {
    Uint32              all;
    struct GPC1_BITS    bit;
};

union GPC2_REG {
    Uint32              all;
    struct GPC2_BITS    bit;
};




struct GPADAT_BITS {           
    Uint16 GPIO0:1;            
    Uint16 GPIO1:1;            
    Uint16 GPIO2:1;            
    Uint16 GPIO3:1;            
    Uint16 GPIO4:1;            
    Uint16 GPIO5:1;            
    Uint16 GPIO6:1;            
    Uint16 GPIO7:1;            
    Uint16 GPIO8:1;            
    Uint16 GPIO9:1;            
    Uint16 GPIO10:1;           
    Uint16 GPIO11:1;           
    Uint16 GPIO12:1;           
    Uint16 GPIO13:1;           
    Uint16 GPIO14:1;           
    Uint16 GPIO15:1;           
    Uint16 GPIO16:1;           
    Uint16 GPIO17:1;           
    Uint16 GPIO18:1;           
    Uint16 GPIO19:1;           
    Uint16 GPIO20:1;           
    Uint16 GPIO21:1;           
    Uint16 GPIO22:1;           
    Uint16 GPIO23:1;           
    Uint16 GPIO24:1;           
    Uint16 GPIO25:1;           
    Uint16 GPIO26:1;           
    Uint16 GPIO27:1;           
    Uint16 GPIO28:1;           
    Uint16 GPIO29:1;           
    Uint16 GPIO30:1;           
    Uint16 GPIO31:1;           
};

struct GPBDAT_BITS {           
    Uint16 GPIO32:1;           
    Uint16 GPIO33:1;           
    Uint16 GPIO34:1;           
    Uint16 GPIO35:1;           
    Uint16 GPIO36:1;           
    Uint16 GPIO37:1;           
    Uint16 GPIO38:1;           
    Uint16 GPIO39:1;           
    Uint16 GPIO40:1;           
    Uint16 GPIO41:1;           
    Uint16 GPIO42:1;           
    Uint16 GPIO43:1;           
    Uint16 GPIO44:1;           
    Uint16 GPIO45:1;           
    Uint16 GPIO46:1;           
    Uint16 GPIO47:1;           
    Uint16 GPIO48:1;           
    Uint16 GPIO49:1;           
    Uint16 GPIO50:1;           
    Uint16 GPIO51:1;           
    Uint16 GPIO52:1;           
    Uint16 GPIO53:1;           
    Uint16 GPIO54:1;           
    Uint16 GPIO55:1;           
    Uint16 GPIO56:1;           
    Uint16 GPIO57:1;           
    Uint16 GPIO58:1;           
    Uint16 GPIO59:1;           
    Uint16 GPIO60:1;           
    Uint16 GPIO61:1;           
    Uint16 GPIO62:1;           
    Uint16 GPIO63:1;           
};

struct GPCDAT_BITS {           
    Uint16 GPIO64:1;           
    Uint16 GPIO65:1;           
    Uint16 GPIO66:1;           
    Uint16 GPIO67:1;           
    Uint16 GPIO68:1;           
    Uint16 GPIO69:1;           
    Uint16 GPIO70:1;           
    Uint16 GPIO71:1;           
    Uint16 GPIO72:1;           
    Uint16 GPIO73:1;           
    Uint16 GPIO74:1;           
    Uint16 GPIO75:1;           
    Uint16 GPIO76:1;           
    Uint16 GPIO77:1;           
    Uint16 GPIO78:1;           
    Uint16 GPIO79:1;           
    Uint16 GPIO80:1;           
    Uint16 GPIO81:1;           
    Uint16 GPIO82:1;           
    Uint16 GPIO83:1;           
    Uint16 GPIO84:1;           
    Uint16 GPIO85:1;           
    Uint16 GPIO86:1;           
    Uint16 GPIO87:1;           
    Uint16 rsvd1:8;            
};

union GPADAT_REG {
    Uint32              all;
    struct GPADAT_BITS  bit;
};

union GPBDAT_REG {
    Uint32              all;
    struct GPBDAT_BITS  bit;
};

union GPCDAT_REG {
    Uint32              all;
    struct GPCDAT_BITS  bit;
};




struct GPIOXINT_BITS {        
    Uint16 GPIOSEL:5;         
    Uint16 rsvd1:11;          
};

union GPIOXINT_REG {
    Uint16                all;
    struct GPIOXINT_BITS  bit;
};

struct GPIO_CTRL_REGS {
    union  GPACTRL_REG  GPACTRL;   
    
    
    
    
    union  GPA1_REG     GPAQSEL1;
    
    
    
    
    union  GPA2_REG     GPAQSEL2;
    
    
    
    
    union  GPA1_REG     GPAMUX1;
    
    
    
    
    union  GPA2_REG     GPAMUX2;
    
    union  GPADAT_REG   GPADIR;    
    
    
    
    
    union  GPADAT_REG   GPAPUD;
    
    Uint32              rsvd1;
    union  GPBCTRL_REG  GPBCTRL;   
    
    
    
    
    union  GPB1_REG     GPBQSEL1;
    
    
    
    
    union  GPB2_REG     GPBQSEL2;  
    
    union  GPB1_REG     GPBMUX1;   
    union  GPB2_REG     GPBMUX2;   
    union  GPBDAT_REG   GPBDIR;    
    
    
    
    
    union  GPBDAT_REG   GPBPUD;
    
    Uint16              rsvd2[8];
    union  GPC1_REG     GPCMUX1;   
    union  GPC2_REG     GPCMUX2;   
    union  GPCDAT_REG   GPCDIR;    
    
    
    
    
    union  GPCDAT_REG   GPCPUD;
};

struct GPIO_DATA_REGS {
    union  GPADAT_REG       GPADAT;       
    
    
    
    
    union  GPADAT_REG       GPASET;       
    
    
    
    
    union  GPADAT_REG       GPACLEAR;     
    
    
    
    
    union  GPADAT_REG       GPATOGGLE;
    
    union  GPBDAT_REG       GPBDAT;       
    
    
    
    
    union  GPBDAT_REG       GPBSET;
    
    
    
    
    union  GPBDAT_REG       GPBCLEAR;

    
    
    
    union  GPBDAT_REG       GPBTOGGLE;
    
    union  GPCDAT_REG       GPCDAT;    
    union  GPCDAT_REG       GPCSET;    
    
    
    
    
    union  GPCDAT_REG       GPCCLEAR;  
    
    
    
    
    union  GPCDAT_REG       GPCTOGGLE;    
    Uint16                  rsvd1[8];
};

struct GPIO_INT_REGS {
    union  GPIOXINT_REG     GPIOXINT1SEL; 
    union  GPIOXINT_REG     GPIOXINT2SEL; 
    union  GPIOXINT_REG     GPIOXNMISEL;  
    union  GPIOXINT_REG     GPIOXINT3SEL; 
    union  GPIOXINT_REG     GPIOXINT4SEL; 
    union  GPIOXINT_REG     GPIOXINT5SEL; 
    union  GPIOXINT_REG     GPIOXINT6SEL; 
    union  GPIOXINT_REG     GPIOXINT7SEL; 
    union  GPADAT_REG       GPIOLPMSEL;   
};




extern volatile struct GPIO_CTRL_REGS GpioCtrlRegs;
extern volatile struct GPIO_DATA_REGS GpioDataRegs;
extern volatile struct GPIO_INT_REGS GpioIntRegs;


























































struct I2CISRC_BITS {          
    Uint16 INTCODE:3;          
    Uint16 rsvd1:13;           
};

union I2CISRC_REG {
    Uint16                 all;
    struct I2CISRC_BITS    bit;
};




struct I2CIER_BITS {           
    Uint16 ARBL:1;             
    Uint16 NACK:1;             
    Uint16 ARDY:1;             
    Uint16 RRDY:1;             
    Uint16 XRDY:1;             
    Uint16 SCD:1;              
    Uint16 AAS:1;              
    Uint16 rsvd:9;             
};

union I2CIER_REG {
    Uint16                 all;
    struct I2CIER_BITS     bit;
};




struct I2CSTR_BITS {           
    Uint16 ARBL:1;             
    Uint16 NACK:1;             
    Uint16 ARDY:1;             
    Uint16 RRDY:1;             
    Uint16 XRDY:1;             
    Uint16 SCD:1;              
    Uint16 rsvd1:2;            
    Uint16 AD0:1;              
    Uint16 AAS:1;              
    Uint16 XSMT:1;             
    Uint16 RSFULL:1;           
    Uint16 BB:1;               
    Uint16 NACKSNT:1;          
    Uint16 SDIR:1;             
    Uint16 rsvd2:1;            
};

union I2CSTR_REG {
    Uint16                 all;
    struct I2CSTR_BITS     bit;
};




struct I2CMDR_BITS {           
    Uint16 BC:3;               
    Uint16 FDF:1;              
    Uint16 STB:1;              
    Uint16 IRS:1;              
    Uint16 DLB:1;              
    Uint16 RM:1;               
    Uint16 XA:1;               
    Uint16 TRX:1;              
    Uint16 MST:1;              
    Uint16 STP:1;              
    Uint16 rsvd1:1;            
    Uint16 STT:1;              
    Uint16 FREE:1;             
    Uint16 NACKMOD:1;          
};

union I2CMDR_REG {
   Uint16                 all;
   struct I2CMDR_BITS     bit;
};




struct I2CEMDR_BITS {          
    Uint16 BCM:1;              
    Uint16 rsvd:15;            
};

union I2CEMDR_REG {
    Uint16                 all;
    struct I2CEMDR_BITS     bit;
};




struct I2CPSC_BITS {          
    Uint16 IPSC:8;            
    Uint16 rsvd1:8;           
};

union I2CPSC_REG {
    Uint16                 all;
    struct I2CPSC_BITS     bit;
};




struct I2CFFTX_BITS {          
    Uint16 TXFFIL:5;           
    Uint16 TXFFIENA:1;         
    Uint16 TXFFINTCLR:1;       
    Uint16 TXFFINT:1;          
    Uint16 TXFFST:5;           
    Uint16 TXFFRST:1;          
    Uint16 I2CFFEN:1;          
    Uint16 rsvd1:1;            
};

union I2CFFTX_REG {
    Uint16                 all;
    struct I2CFFTX_BITS    bit;
};




struct I2CFFRX_BITS {          
    Uint16 RXFFIL:5;           
    Uint16 RXFFIENA:1;         
    Uint16 RXFFINTCLR:1;       
    Uint16 RXFFINT:1;          
    Uint16 RXFFST:5;           
    Uint16 RXFFRST:1;          
    Uint16 rsvd1:2;            
};

union I2CFFRX_REG {
    Uint16                 all;
    struct I2CFFRX_BITS    bit;
};

struct I2C_REGS {
    Uint16              I2COAR;             
    union  I2CIER_REG   I2CIER;             
    union  I2CSTR_REG   I2CSTR;             
    Uint16              I2CCLKL;            
    Uint16              I2CCLKH;            
    Uint16              I2CCNT;             
    Uint16              I2CDRR;             
    Uint16              I2CSAR;             
    Uint16              I2CDXR;             
    union  I2CMDR_REG   I2CMDR;             
    union  I2CISRC_REG  I2CISRC;            
    union  I2CEMDR_REG  I2CEMDR;            
    union  I2CPSC_REG   I2CPSC;             
    Uint16              rsvd2[19];          
    union  I2CFFTX_REG  I2CFFTX;            
    union  I2CFFRX_REG  I2CFFRX;            
};




extern volatile struct I2C_REGS I2caRegs;




























































struct  DRR2_BITS {        
    Uint16     HWLB:8;     
    Uint16     HWHB:8;     
};

union DRR2_REG {
    Uint16            all;
    struct DRR2_BITS  bit;
};




struct  DRR1_BITS {        
    Uint16     LWLB:8;     
    Uint16     LWHB:8;     
};

union DRR1_REG {
    Uint16            all;
    struct DRR1_BITS  bit;
};




struct  DXR2_BITS {        
    Uint16     HWLB:8;     
    Uint16     HWHB:8;     
};

union DXR2_REG {
    Uint16            all;
    struct DXR2_BITS  bit;
};




struct  DXR1_BITS {        
    Uint16     LWLB:8;     
    Uint16     LWHB:8;     
};

union DXR1_REG {
    Uint16              all;
    struct DXR1_BITS  bit;
};




struct  SPCR2_BITS {        
    Uint16     XRST:1;      
    Uint16     XRDY:1;      
    Uint16     XEMPTY:1;    
    Uint16     XSYNCERR:1;  
    Uint16     XINTM:2;     
    Uint16     GRST:1;      
    Uint16     FRST:1;      
    Uint16     SOFT:1;      
    Uint16     FREE:1;      
    Uint16     rsvd:6;      
};

union SPCR2_REG {
    Uint16               all;
    struct SPCR2_BITS  bit;
};




struct  SPCR1_BITS {        
    Uint16     RRST:1;      
    Uint16     RRDY:1;      
    Uint16     RFULL:1;     
    Uint16     RSYNCERR:1;  
    Uint16     RINTM:2;     
    Uint16     rsvd1:1;     
    Uint16     DXENA:1;     
    Uint16     rsvd2:3;     
    Uint16     CLKSTP:2;    
    Uint16     RJUST:2;     
    Uint16     DLB:1;       
};

union SPCR1_REG {
    Uint16              all;
    struct SPCR1_BITS bit;
};




struct  RCR2_BITS {             
    Uint16     RDATDLY:2;       
    Uint16     RFIG:1;          
    Uint16     RCOMPAND:2;      
    Uint16     RWDLEN2:3;       
    Uint16     RFRLEN2:7;       
    Uint16     RPHASE:1;        
};

union RCR2_REG {
    Uint16           all;
    struct RCR2_BITS bit;
};




struct  RCR1_BITS {          
    Uint16     rsvd1:5;      
    Uint16     RWDLEN1:3;    
    Uint16     RFRLEN1:7;    
    Uint16     rsvd2:1;      
};

union RCR1_REG {
    Uint16           all;
    struct RCR1_BITS bit;
};




struct  XCR2_BITS {          
    Uint16     XDATDLY:2;    
    Uint16     XFIG:1;       
    Uint16     XCOMPAND:2;   
    Uint16     XWDLEN2:3;    
    Uint16     XFRLEN2:7;    
    Uint16     XPHASE:1;     
};  

union XCR2_REG {
    Uint16           all;
    struct XCR2_BITS bit;
};




struct  XCR1_BITS {             
    Uint16     rsvd1:5;         
    Uint16     XWDLEN1:3;       
    Uint16     XFRLEN1:7;       
    Uint16     rsvd2:1;         
};

union XCR1_REG {
    Uint16             all;
    struct XCR1_BITS bit;
};




struct  SRGR2_BITS {            
    Uint16     FPER:12;         
    Uint16     FSGM:1;          
    Uint16     CLKSM:1;         
    Uint16     rsvd:1;          
    Uint16     GSYNC:1;         
};

union  SRGR2_REG {
    Uint16              all;
    struct  SRGR2_BITS  bit;
};




struct  SRGR1_BITS {         
    Uint16     CLKGDV:8;     
    Uint16     FWID:8;       
};

union  SRGR1_REG {
    Uint16              all;
    struct  SRGR1_BITS  bit;
};




struct  MCR2_BITS {             
    Uint16     XMCM:2;          
    Uint16     XCBLK:3;         
    Uint16     XPABLK:2;        
    Uint16     XPBBLK:2;        
    Uint16     XMCME:1;         
    Uint16     rsvd:6;          
};

union  MCR2_REG {
    Uint16             all;
    struct  MCR2_BITS  bit;
};




struct  MCR1_BITS {          
    Uint16     RMCM:1;       
    Uint16     rsvd:1;       
    Uint16     RCBLK:3;      
    Uint16     RPABLK:2;     
    Uint16     RPBBLK:2;     
    Uint16     RMCME:1;      
    Uint16     rsvd1:6;      
};

union  MCR1_REG {
    Uint16             all;
    struct  MCR1_BITS  bit;
};




struct  RCERA_BITS {          
    Uint16     RCEA0:1;       
    Uint16     RCEA1:1;       
    Uint16     RCEA2:1;       
    Uint16     RCEA3:1;       
    Uint16     RCEA4:1;       
    Uint16     RCEA5:1;       
    Uint16     RCEA6:1;       
    Uint16     RCEA7:1;       
    Uint16     RCEA8:1;       
    Uint16     RCEA9:1;       
    Uint16     RCEA10:1;      
    Uint16     RCEA11:1;      
    Uint16     RCEA12:1;      
    Uint16     RCEA13:1;      
    Uint16     RCEA14:1;      
    Uint16     RCEA15:1;      
};

union RCERA_REG {
    Uint16              all;
    struct  RCERA_BITS  bit;
};




struct  RCERB_BITS {          
    Uint16     RCEB0:1;       
    Uint16     RCEB1:1;       
    Uint16     RCEB2:1;       
    Uint16     RCEB3:1;       
    Uint16     RCEB4:1;       
    Uint16     RCEB5:1;       
    Uint16     RCEB6:1;       
    Uint16     RCEB7:1;       
    Uint16     RCEB8:1;       
    Uint16     RCEB9:1;       
    Uint16     RCEB10:1;      
    Uint16     RCEB11:1;      
    Uint16     RCEB12:1;      
    Uint16     RCEB13:1;      
    Uint16     RCEB14:1;      
    Uint16     RCEB15:1;      
}; 

union RCERB_REG {
    Uint16              all;
    struct  RCERB_BITS  bit;
};




struct  XCERA_BITS {            
    Uint16     XCERA0:1;        
    Uint16     XCERA1:1;        
    Uint16     XCERA2:1;        
    Uint16     XCERA3:1;        
    Uint16     XCERA4:1;        
    Uint16     XCERA5:1;        
    Uint16     XCERA6:1;        
    Uint16     XCERA7:1;        
    Uint16     XCERA8:1;        
    Uint16     XCERA9:1;        
    Uint16     XCERA10:1;       
    Uint16     XCERA11:1;       
    Uint16     XCERA12:1;       
    Uint16     XCERA13:1;       
    Uint16     XCERA14:1;       
    Uint16     XCERA15:1;       
};

union XCERA_REG {
    Uint16              all;
    struct  XCERA_BITS  bit;
};  




struct  XCERB_BITS {           
    Uint16     XCERB0:1;       
    Uint16     XCERB1:1;       
    Uint16     XCERB2:1;       
    Uint16     XCERB3:1;       
    Uint16     XCERB4:1;       
    Uint16     XCERB5:1;       
    Uint16     XCERB6:1;       
    Uint16     XCERB7:1;       
    Uint16     XCERB8:1;       
    Uint16     XCERB9:1;       
    Uint16     XCERB10:1;      
    Uint16     XCERB11:1;      
    Uint16     XCERB12:1;      
    Uint16     XCERB13:1;      
    Uint16     XCERB14:1;      
    Uint16     XCERB15:1;      
};
    
union XCERB_REG {
    Uint16              all;
    struct  XCERB_BITS  bit;
};




struct  PCR_BITS {            
    Uint16     CLKRP:1;       
    Uint16     CLKXP:1;       
    Uint16     FSRP:1;        
    Uint16     FSXP:1;        
    Uint16     DR_STAT:1;     
    Uint16     DX_STAT:1;     
    Uint16     CLKS_STAT:1;   
    Uint16     SCLKME:1;      
    Uint16     CLKRM:1;       
    Uint16     CLKXM:1;       
    Uint16     FSRM:1;        
    Uint16     FSXM:1;        
    Uint16     RIOEN:1;       
                              
    Uint16     XIOEN:1;       
                              
    Uint16     IDEL_EN:1;     
    Uint16     rsvd:1  ;      
};

union PCR_REG {
    Uint16            all;
    struct  PCR_BITS  bit;
};




struct  RCERC_BITS {          
    Uint16     RCEC0:1;       
    Uint16     RCEC1:1;       
    Uint16     RCEC2:1;       
    Uint16     RCEC3:1;       
    Uint16     RCEC4:1;       
    Uint16     RCEC5:1;       
    Uint16     RCEC6:1;       
    Uint16     RCEC7:1;       
    Uint16     RCEC8:1;       
    Uint16     RCEC9:1;       
    Uint16     RCEC10:1;      
    Uint16     RCEC11:1;      
    Uint16     RCEC12:1;      
    Uint16     RCEC13:1;      
    Uint16     RCEC14:1;      
    Uint16     RCEC15:1;      
};

union RCERC_REG {
    Uint16              all;
    struct  RCERC_BITS  bit;
};




struct  RCERD_BITS {          
    Uint16     RCED0:1;       
    Uint16     RCED1:1;       
    Uint16     RCED2:1;       
    Uint16     RCED3:1;       
    Uint16     RCED4:1;       
    Uint16     RCED5:1;       
    Uint16     RCED6:1;       
    Uint16     RCED7:1;       
    Uint16     RCED8:1;       
    Uint16     RCED9:1;       
    Uint16     RCED10:1;      
    Uint16     RCED11:1;      
    Uint16     RCED12:1;      
    Uint16     RCED13:1;      
    Uint16     RCED14:1;      
    Uint16     RCED15:1;      
};

union RCERD_REG {
    Uint16              all;
    struct  RCERD_BITS  bit;
};




struct  XCERC_BITS {           
    Uint16     XCERC0:1;       
    Uint16     XCERC1:1;       
    Uint16     XCERC2:1;       
    Uint16     XCERC3:1;       
    Uint16     XCERC4:1;       
    Uint16     XCERC5:1;       
    Uint16     XCERC6:1;       
    Uint16     XCERC7:1;       
    Uint16     XCERC8:1;       
    Uint16     XCERC9:1;       
    Uint16     XCERC10:1;      
    Uint16     XCERC11:1;      
    Uint16     XCERC12:1;      
    Uint16     XCERC13:1;      
    Uint16     XCERC14:1;      
    Uint16     XCERC15:1;      
};

union XCERC_REG {
    Uint16              all;
    struct  XCERC_BITS  bit;
};




struct  XCERD_BITS {           
    Uint16     XCERD0:1;       
    Uint16     XCERD1:1;       
    Uint16     XCERD2:1;       
    Uint16     XCERD3:1;       
    Uint16     XCERD4:1;       
    Uint16     XCERD5:1;       
    Uint16     XCERD6:1;       
    Uint16     XCERD7:1;       
    Uint16     XCERD8:1;       
    Uint16     XCERD9:1;       
    Uint16     XCERD10:1;      
    Uint16     XCERD11:1;      
    Uint16     XCERD12:1;      
    Uint16     XCERD13:1;      
    Uint16     XCERD14:1;      
    Uint16     XCERD15:1;      
}; 

union XCERD_REG {
    Uint16              all;
    struct  XCERD_BITS  bit;
};




struct  RCERE_BITS {          
    Uint16     RCEE0:1;       
    Uint16     RCEE1:1;       
    Uint16     RCEE2:1;       
    Uint16     RCEE3:1;       
    Uint16     RCEE4:1;       
    Uint16     RCEE5:1;       
    Uint16     RCEE6:1;       
    Uint16     RCEE7:1;       
    Uint16     RCEE8:1;       
    Uint16     RCEE9:1;       
    Uint16     RCEE10:1;      
    Uint16     RCEE11:1;      
    Uint16     RCEE12:1;      
    Uint16     RCEE13:1;      
    Uint16     RCEE14:1;      
    Uint16     RCEE15:1;      
};  

union RCERE_REG {
    Uint16              all;
    struct  RCERE_BITS  bit;
};




struct  RCERF_BITS {          
    Uint16     RCEF0:1;       
    Uint16     RCEF1:1;       
    Uint16     RCEF2:1;       
    Uint16     RCEF3:1;       
    Uint16     RCEF4:1;       
    Uint16     RCEF5:1;       
    Uint16     RCEF6:1;       
    Uint16     RCEF7:1;       
    Uint16     RCEF8:1;       
    Uint16     RCEF9:1;       
    Uint16     RCEF10:1;      
    Uint16     RCEF11:1;      
    Uint16     RCEF12:1;      
    Uint16     RCEF13:1;      
    Uint16     RCEF14:1;      
    Uint16     RCEF15:1;      
};

union RCERF_REG {
   Uint16              all;
   struct  RCERF_BITS  bit;
};


struct  XCERE_BITS {         
   Uint16     XCERE0:1;       
   Uint16     XCERE1:1;       
   Uint16     XCERE2:1;       
   Uint16     XCERE3:1;       
   Uint16     XCERE4:1;       
   Uint16     XCERE5:1;       
   Uint16     XCERE6:1;       
   Uint16     XCERE7:1;       
   Uint16     XCERE8:1;       
   Uint16     XCERE9:1;       
   Uint16     XCERE10:1;      
   Uint16     XCERE11:1;      
   Uint16     XCERE12:1;      
   Uint16     XCERE13:1;      
   Uint16     XCERE14:1;      
   Uint16     XCERE15:1;      
};

union XCERE_REG {
    Uint16              all;
    struct  XCERE_BITS  bit;
};




struct  XCERF_BITS {            
    Uint16     XCERF0:1;        
    Uint16     XCERF1:1;        
    Uint16     XCERF2:1;        
    Uint16     XCERF3:1;        
    Uint16     XCERF4:1;        
    Uint16     XCERF5:1;        
    Uint16     XCERF6:1;        
    Uint16     XCERF7:1;        
    Uint16     XCERF8:1;        
    Uint16     XCERF9:1;        
    Uint16     XCERF10:1;       
    Uint16     XCERF11:1;       
    Uint16     XCERF12:1;       
    Uint16     XCERF13:1;       
    Uint16     XCERF14:1;       
    Uint16     XCERF15:1;       
};

union XCERF_REG {
    Uint16              all;
    struct  XCERF_BITS  bit;
};




struct  RCERG_BITS {          
    Uint16     RCEG0:1;       
    Uint16     RCEG1:1;       
    Uint16     RCEG2:1;       
    Uint16     RCEG3:1;       
    Uint16     RCEG4:1;       
    Uint16     RCEG5:1;       
    Uint16     RCEG6:1;       
    Uint16     RCEG7:1;       
    Uint16     RCEG8:1;       
    Uint16     RCEG9:1;       
    Uint16     RCEG10:1;      
    Uint16     RCEG11:1;      
    Uint16     RCEG12:1;      
    Uint16     RCEG13:1;      
    Uint16     RCEG14:1;      
    Uint16     RCEG15:1;      
};

union RCERG_REG {
   Uint16              all;
   struct  RCERG_BITS  bit;
};


struct  RCERH_BITS {         
   Uint16     RCEH0:1;       
   Uint16     RCEH1:1;       
   Uint16     RCEH2:1;       
   Uint16     RCEH3:1;       
   Uint16     RCEH4:1;       
   Uint16     RCEH5:1;       
   Uint16     RCEH6:1;       
   Uint16     RCEH7:1;       
   Uint16     RCEH8:1;       
   Uint16     RCEH9:1;       
   Uint16     RCEH10:1;      
   Uint16     RCEH11:1;      
   Uint16     RCEH12:1;      
   Uint16     RCEH13:1;      
   Uint16     RCEH14:1;      
   Uint16     RCEH15:1;      
};

union RCERH_REG {
    Uint16              all;
    struct  RCERH_BITS  bit;
};




struct  XCERG_BITS {           
    Uint16     XCERG0:1;       
    Uint16     XCERG1:1;       
    Uint16     XCERG2:1;       
    Uint16     XCERG3:1;       
    Uint16     XCERG4:1;       
    Uint16     XCERG5:1;       
    Uint16     XCERG6:1;       
    Uint16     XCERG7:1;       
    Uint16     XCERG8:1;       
    Uint16     XCERG9:1;       
    Uint16     XCERG10:1;      
    Uint16     XCERG11:1;      
    Uint16     XCERG12:1;      
    Uint16     XCERG13:1;      
    Uint16     XCERG14:1;      
    Uint16     XCERG15:1;      
};

union XCERG_REG {
    Uint16              all;
    struct  XCERG_BITS  bit;
};




struct  XCERH_BITS {          
    Uint16     XCEH0:1;       
    Uint16     XCEH1:1;       
    Uint16     XCEH2:1;       
    Uint16     XCEH3:1;       
    Uint16     XCEH4:1;       
    Uint16     XCEH5:1;       
    Uint16     XCEH6:1;       
    Uint16     XCEH7:1;       
    Uint16     XCEH8:1;       
    Uint16     XCEH9:1;       
    Uint16     XCEH10:1;      
    Uint16     XCEH11:1;      
    Uint16     XCEH12:1;      
    Uint16     XCEH13:1;      
    Uint16     XCEH14:1;      
    Uint16     XCEH15:1;      
}; 

union XCERH_REG {
    Uint16              all;
    struct  XCERH_BITS  bit;
};




struct  MFFINT_BITS {       
    Uint16     XINT:1;      
    Uint16     rsvd1:1;     
    Uint16     RINT:1;      
    Uint16     rsvd2:13;    
};

union MFFINT_REG {
    Uint16              all;
    struct MFFINT_BITS  bit;
};




struct  MCBSP_REGS {
    union DRR2_REG    DRR2;       
    union DRR1_REG    DRR1;       
    union DXR2_REG    DXR2;       
    union DXR1_REG    DXR1;       
    union SPCR2_REG   SPCR2;      
    union SPCR1_REG   SPCR1;      
    union RCR2_REG    RCR2;       
    union RCR1_REG    RCR1;       
    union XCR2_REG    XCR2;       
    union XCR1_REG    XCR1;       
    union SRGR2_REG   SRGR2;      
    union SRGR1_REG   SRGR1;      
    union MCR2_REG    MCR2;       
    union MCR1_REG    MCR1;       
    union RCERA_REG   RCERA;      
    union RCERB_REG   RCERB;      
    union XCERA_REG   XCERA;      
    union XCERB_REG   XCERB;      
    union PCR_REG     PCR;        
    union RCERC_REG   RCERC;      
    union RCERD_REG   RCERD;      
    union XCERC_REG   XCERC;      
    union XCERD_REG   XCERD;      
    union RCERE_REG   RCERE;      
    union RCERF_REG   RCERF;      
    union XCERE_REG   XCERE;      
    union XCERF_REG   XCERF;      
    union RCERG_REG   RCERG;      
    union RCERH_REG   RCERH;      
    union XCERG_REG   XCERG;      
    union XCERH_REG   XCERH;      
    Uint16            rsvd1[4];   
    union MFFINT_REG  MFFINT;     
                                  
    Uint16            rsvd2;      
};




extern volatile struct MCBSP_REGS McbspaRegs;
extern volatile struct MCBSP_REGS McbspbRegs;




























































struct PIECTRL_BITS {       
    Uint16  ENPIE:1;        
    Uint16  PIEVECT:15;     
};

union PIECTRL_REG {
    Uint16                 all;
    struct PIECTRL_BITS  bit;
};  




struct PIEIER_BITS {        
    Uint16 INTx1:1;         
    Uint16 INTx2:1;         
    Uint16 INTx3:1;         
    Uint16 INTx4:1;         
    Uint16 INTx5:1;         
    Uint16 INTx6:1;         
    Uint16 INTx7:1;         
    Uint16 INTx8:1;         
    Uint16 rsvd:8;          
};
  
union PIEIER_REG {
    Uint16              all;
    struct PIEIER_BITS  bit;
}; 




struct PIEIFR_BITS {        
    Uint16 INTx1:1;         
    Uint16 INTx2:1;         
    Uint16 INTx3:1;         
    Uint16 INTx4:1;         
    Uint16 INTx5:1;         
    Uint16 INTx6:1;         
    Uint16 INTx7:1;         
    Uint16 INTx8:1;         
    Uint16 rsvd:8;          
}; 

union PIEIFR_REG {
    Uint16              all;
    struct PIEIFR_BITS  bit;
};




struct PIEACK_BITS {        
    Uint16 ACK1:1;          
    Uint16 ACK2:1;          
    Uint16 ACK3:1;          
    Uint16 ACK4:1;          
    Uint16 ACK5:1;          
    Uint16 ACK6:1;          
    Uint16 ACK7:1;          
    Uint16 ACK8:1;          
    Uint16 ACK9:1;          
    Uint16 ACK10:1;         
    Uint16 ACK11:1;         
    Uint16 ACK12:1;         
    Uint16 rsvd:4;          
};

union PIEACK_REG {
    Uint16              all;
    struct PIEACK_BITS  bit;
};




struct PIE_CTRL_REGS {
    union PIECTRL_REG PIECTRL;       
    union PIEACK_REG  PIEACK;        
    union PIEIER_REG  PIEIER1;       
    union PIEIFR_REG  PIEIFR1;       
    union PIEIER_REG  PIEIER2;       
    union PIEIFR_REG  PIEIFR2;       
    union PIEIER_REG  PIEIER3;       
    union PIEIFR_REG  PIEIFR3;       
    union PIEIER_REG  PIEIER4;       
    union PIEIFR_REG  PIEIFR4;       
    union PIEIER_REG  PIEIER5;       
    union PIEIFR_REG  PIEIFR5;       
    union PIEIER_REG  PIEIER6;       
    union PIEIFR_REG  PIEIFR6;       
    union PIEIER_REG  PIEIER7;       
    union PIEIFR_REG  PIEIFR7;       
    union PIEIER_REG  PIEIER8;       
    union PIEIFR_REG  PIEIFR8;       
    union PIEIER_REG  PIEIER9;       
    union PIEIFR_REG  PIEIFR9;       
    union PIEIER_REG  PIEIER10;      
    union PIEIFR_REG  PIEIFR10;      
    union PIEIER_REG  PIEIER11;      
    union PIEIFR_REG  PIEIFR11;      
    union PIEIER_REG  PIEIER12;      
    union PIEIFR_REG  PIEIFR12;      
};     








extern volatile struct PIE_CTRL_REGS PieCtrlRegs;




























































typedef interrupt void(*PINT)(void);




struct PIE_VECT_TABLE {
    
    
    
    
    PINT     PIE1_RESERVED;
    PINT     PIE2_RESERVED;
    PINT     PIE3_RESERVED;
    PINT     PIE4_RESERVED;
    PINT     PIE5_RESERVED;
    PINT     PIE6_RESERVED;
    PINT     PIE7_RESERVED;
    PINT     PIE8_RESERVED;
    PINT     PIE9_RESERVED;
    PINT     PIE10_RESERVED;
    PINT     PIE11_RESERVED;
    PINT     PIE12_RESERVED;
    PINT     PIE13_RESERVED;

    
    
    
    PINT     XINT13;        
    PINT     TINT2;         
    PINT     DATALOG;       
    PINT     RTOSINT;       
    PINT     EMUINT;        
    PINT     XNMI;          
    PINT     ILLEGAL;       
    PINT     USER1;         
    PINT     USER2;         
    PINT     USER3;         
    PINT     USER4;         
    PINT     USER5;         
    PINT     USER6;         
    PINT     USER7;         
    PINT     USER8;         
    PINT     USER9;         
    PINT     USER10;        
    PINT     USER11;        
    PINT     USER12;        

    
    
    
    PINT     SEQ1INT;
    PINT     SEQ2INT;
    PINT     rsvd1_3;
    PINT     XINT1;
    PINT     XINT2;
    PINT     ADCINT;    
    PINT     TINT0;     
    PINT     WAKEINT;   

    
    
    
    PINT     EPWM1_TZINT; 
    PINT     EPWM2_TZINT; 
    PINT     EPWM3_TZINT; 
    PINT     EPWM4_TZINT; 
    PINT     EPWM5_TZINT; 
    PINT     EPWM6_TZINT; 
    PINT     rsvd2_7;
    PINT     rsvd2_8;

    
    
    
    PINT     EPWM1_INT;  
    PINT     EPWM2_INT;  
    PINT     EPWM3_INT;  
    PINT     EPWM4_INT;  
    PINT     EPWM5_INT;  
    PINT     EPWM6_INT;  
    PINT     rsvd3_7;
    PINT     rsvd3_8;

    
    
    
    PINT     ECAP1_INT; 
    PINT     ECAP2_INT; 
    PINT     ECAP3_INT; 
    PINT     ECAP4_INT; 
    PINT     ECAP5_INT; 
    PINT     ECAP6_INT; 
    PINT     rsvd4_7;
    PINT     rsvd4_8;

    
    
    
    PINT     EQEP1_INT; 
    PINT     EQEP2_INT; 
    PINT     rsvd5_3;
    PINT     rsvd5_4;
    PINT     rsvd5_5;
    PINT     rsvd5_6;
    PINT     rsvd5_7;
    PINT     rsvd5_8;

    
    
    
    PINT     SPIRXINTA; 
    PINT     SPITXINTA; 
    PINT     MRINTB;    
    PINT     MXINTB;    
    PINT     MRINTA;    
    PINT     MXINTA;    
    PINT     rsvd6_7;
    PINT     rsvd6_8;

    
    
    
    PINT     DINTCH1;   
    PINT     DINTCH2;   
    PINT     DINTCH3;   
    PINT     DINTCH4;   
    PINT     DINTCH5;   
    PINT     DINTCH6;   
    PINT     rsvd7_7;
    PINT     rsvd7_8;

    
    
    
    PINT     I2CINT1A;  
    PINT     I2CINT2A;  
    PINT     rsvd8_3;
    PINT     rsvd8_4;
    PINT     SCIRXINTC;  
    PINT     SCITXINTC;  
    PINT     rsvd8_7;
    PINT     rsvd8_8;

    
    
    
    PINT     SCIRXINTA;  
    PINT     SCITXINTA;  
    PINT     SCIRXINTB;  
    PINT     SCITXINTB;  
    PINT     ECAN0INTA;  
    PINT     ECAN1INTA;  
    PINT     ECAN0INTB;  
    PINT     ECAN1INTB;  

    
    
    
    PINT     rsvd10_1;
    PINT     rsvd10_2;
    PINT     rsvd10_3;
    PINT     rsvd10_4;
    PINT     rsvd10_5;
    PINT     rsvd10_6;
    PINT     rsvd10_7;
    PINT     rsvd10_8;

    
    
    
    PINT     rsvd11_1;
    PINT     rsvd11_2;
    PINT     rsvd11_3;
    PINT     rsvd11_4;
    PINT     rsvd11_5;
    PINT     rsvd11_6;
    PINT     rsvd11_7;
    PINT     rsvd11_8;

    
    
    
    PINT     XINT3;      
    PINT     XINT4;
    PINT     XINT5;
    PINT     XINT6;
    PINT     XINT7;
    PINT     rsvd12_6;
    PINT     LVF;        
    PINT     LUF;        
};




extern volatile struct PIE_VECT_TABLE PieVectTable;




























































struct  SPIFFTX_BITS {        
    Uint16 TXFFIL:5;          
    Uint16 TXFFIENA:1;        
    Uint16 TXFFINTCLR:1;      
    Uint16 TXFFINT:1;         
    Uint16 TXFFST:5;          
    Uint16 TXFIFO:1;          
    Uint16 SPIFFENA:1;        
    Uint16 SPIRST:1;          
};

union SPIFFTX_REG {
    Uint16               all;
    struct SPIFFTX_BITS  bit;
};




struct  SPIFFRX_BITS {        
    Uint16 RXFFIL:5;          
    Uint16 RXFFIENA:1;        
    Uint16 RXFFINTCLR:1;      
    Uint16 RXFFINT:1;         
    Uint16 RXFFST:5;          
    Uint16 RXFIFORESET:1;     
    Uint16 RXFFOVFCLR:1;      
    Uint16 RXFFOVF:1;         
};

union SPIFFRX_REG {
    Uint16               all;
    struct SPIFFRX_BITS  bit;
};




struct  SPIFFCT_BITS {        
    Uint16 TXDLY:8;           
    Uint16 rsvd:8;            
}; 

union SPIFFCT_REG {
    Uint16               all;
    struct SPIFFCT_BITS  bit;
};




struct  SPICCR_BITS {         
    Uint16 SPICHAR:4;         
    Uint16 SPILBK:1;          
    Uint16 rsvd1:1;           
    Uint16 CLKPOLARITY:1;     
    Uint16 SPISWRESET:1;      
    Uint16 rsvd2:8;           
};

union SPICCR_REG {
    Uint16              all;
    struct SPICCR_BITS  bit;
};




struct  SPICTL_BITS {         
    Uint16 SPIINTENA:1;       
    Uint16 TALK:1;            
    Uint16 MASTER_SLAVE:1;    
    Uint16 CLK_PHASE:1;       
    Uint16 OVERRUNINTENA:1;   
    Uint16 rsvd:11;           
};

union SPICTL_REG {
    Uint16              all;
    struct SPICTL_BITS  bit;
};




struct  SPISTS_BITS {         
    Uint16 rsvd1:5;           
    Uint16 BUFFULL_FLAG:1;    
    Uint16 INT_FLAG:1;        
    Uint16 OVERRUN_FLAG:1;    
    Uint16 rsvd2:8;           
};

union SPISTS_REG {
    Uint16              all;
    struct SPISTS_BITS  bit;
};




struct  SPIPRI_BITS {         
    Uint16 rsvd1:4;           
    Uint16 FREE:1;            
    Uint16 SOFT:1;            
    Uint16 rsvd2:1;           
    Uint16 rsvd3:9;           
};

union SPIPRI_REG {
    Uint16              all;
    struct SPIPRI_BITS  bit;
};




struct  SPI_REGS {
    union SPICCR_REG     SPICCR;      
    union SPICTL_REG     SPICTL;      
    union SPISTS_REG     SPISTS;      
    Uint16               rsvd1;       
    Uint16               SPIBRR;      
    Uint16               rsvd2;       
    Uint16               SPIRXEMU;    
    Uint16               SPIRXBUF;    
    Uint16               SPITXBUF;    
    Uint16               SPIDAT;      
    union SPIFFTX_REG    SPIFFTX;     
    union SPIFFRX_REG    SPIFFRX;     
    union SPIFFCT_REG    SPIFFCT;     
    Uint16               rsvd3[2];    
    union SPIPRI_REG     SPIPRI;      
};




extern volatile struct SPI_REGS SpiaRegs;




























































struct  SCICCR_BITS {         
    Uint16 SCICHAR:3;         
    Uint16 ADDRIDLE_MODE:1;   
    Uint16 LOOPBKENA:1;       
    Uint16 PARITYENA:1;       
    Uint16 PARITY:1;          
    Uint16 STOPBITS:1;        
    Uint16 rsvd1:8;           
};  

union SCICCR_REG {
    Uint16              all;
    struct SCICCR_BITS  bit;
};




struct  SCICTL1_BITS {        
    Uint16 RXENA:1;           
    Uint16 TXENA:1;           
    Uint16 SLEEP:1;           
    Uint16 TXWAKE:1;          
    Uint16 rsvd:1;            
    Uint16 SWRESET:1;         
    Uint16 RXERRINTENA:1;     
    Uint16 rsvd1:9;           
}; 

union SCICTL1_REG {
    Uint16               all;
    struct SCICTL1_BITS  bit;
};




struct  SCICTL2_BITS {        
    Uint16 TXINTENA:1;        
    Uint16 RXBKINTENA:1;      
    Uint16 rsvd:4;            
    Uint16 TXEMPTY:1;         
    Uint16 TXRDY:1;           
    Uint16 rsvd1:8;           
}; 

union SCICTL2_REG {
    Uint16               all;
    struct SCICTL2_BITS  bit;
};




struct  SCIRXST_BITS {        
    Uint16 rsvd:1;            
    Uint16 RXWAKE:1;          
    Uint16 PE:1;              
    Uint16 OE:1;              
    Uint16 FE:1;              
    Uint16 BRKDT:1;           
    Uint16 RXRDY:1;           
    Uint16 RXERROR:1;         
}; 

union SCIRXST_REG {
    Uint16               all;
    struct SCIRXST_BITS  bit;
};




struct  SCIRXBUF_BITS {       
    Uint16 RXDT:8;            
    Uint16 rsvd:6;            
    Uint16 SCIFFPE:1;         
    Uint16 SCIFFFE:1;         
}; 

union SCIRXBUF_REG {
    Uint16                all;
    struct SCIRXBUF_BITS  bit;
};




struct  SCIPRI_BITS {         
    Uint16 rsvd:3;            
    Uint16 FREE:1;            
    Uint16 SOFT:1;            
    Uint16 rsvd1:3;           
};

union SCIPRI_REG {
    Uint16              all;
    struct SCIPRI_BITS  bit;
};




struct  SCIFFTX_BITS {        
    Uint16 TXFFIL:5;          
    Uint16 TXFFIENA:1;        
    Uint16 TXFFINTCLR:1;      
    Uint16 TXFFINT:1;         
    Uint16 TXFFST:5;          
    Uint16 TXFIFOXRESET:1;    
    Uint16 SCIFFENA:1;        
    Uint16 SCIRST:1;          
}; 

union SCIFFTX_REG {
    Uint16               all;
    struct SCIFFTX_BITS  bit;
};




struct  SCIFFRX_BITS {        
    Uint16 RXFFIL:5;          
    Uint16 RXFFIENA:1;        
    Uint16 RXFFINTCLR:1;      
    Uint16 RXFFINT:1;         
    Uint16 RXFFST:5;          
    Uint16 RXFIFORESET:1;     
    Uint16 RXFFOVRCLR:1;      
    Uint16 RXFFOVF:1;         
}; 

union SCIFFRX_REG {
    Uint16               all;
    struct SCIFFRX_BITS  bit;
};




struct  SCIFFCT_BITS {        
    Uint16 FFTXDLY:8;         
    Uint16 rsvd:5;            
    Uint16 CDC:1;             
    Uint16 ABDCLR:1;          
    Uint16 ABD:1;             
};
    
union SCIFFCT_REG {
    Uint16               all;
    struct SCIFFCT_BITS  bit;
};




struct  SCI_REGS {
    union SCICCR_REG     SCICCR;     
    union SCICTL1_REG    SCICTL1;    
    Uint16               SCIHBAUD;   
    Uint16               SCILBAUD;   
    union SCICTL2_REG    SCICTL2;    
    union SCIRXST_REG    SCIRXST;    
    Uint16               SCIRXEMU;   
    union SCIRXBUF_REG   SCIRXBUF;   
    Uint16               rsvd1;      
    Uint16               SCITXBUF;   
    union SCIFFTX_REG    SCIFFTX;    
    union SCIFFRX_REG    SCIFFRX;    
    union SCIFFCT_REG    SCIFFCT;    
    Uint16               rsvd2;      
    Uint16               rsvd3;      
    union SCIPRI_REG     SCIPRI;     
};




extern volatile struct SCI_REGS SciaRegs;
extern volatile struct SCI_REGS ScibRegs;
extern volatile struct SCI_REGS ScicRegs;




























































struct PLLSTS_BITS   {     
    Uint16 PLLLOCKS:1;     
    Uint16 rsvd1:1;        
    Uint16 PLLOFF:1;       
    Uint16 MCLKSTS:1;      
    Uint16 MCLKCLR:1;      
    Uint16 OSCOFF:1;       
    Uint16 MCLKOFF:1;      
    Uint16 DIVSEL:2;       
    Uint16 rsvd2:7;        
};

union PLLSTS_REG {
    Uint16              all;
    struct PLLSTS_BITS  bit;
};




struct HISPCP_BITS  {       
    Uint16 HSPCLK:3;        
    Uint16 rsvd1:13;        
};
    
union HISPCP_REG {
    Uint16              all;
    struct HISPCP_BITS  bit;
};




struct LOSPCP_BITS  {       
    Uint16 LSPCLK:3;        
    Uint16 rsvd1:13;        
};

union LOSPCP_REG {
    Uint16              all;
    struct LOSPCP_BITS  bit;
};




struct PCLKCR0_BITS  {    
    Uint16 rsvd1:2;       
    Uint16 TBCLKSYNC:1;   
    Uint16 ADCENCLK:1;    
    Uint16 I2CAENCLK:1;   
    Uint16 SCICENCLK:1;   
    Uint16 rsvd2:2;       
    Uint16 SPIAENCLK:1;   
    Uint16 rsvd3:1;       
    Uint16 SCIAENCLK:1;   
    Uint16 SCIBENCLK:1;   
    Uint16 MCBSPAENCLK:1; 
    Uint16 MCBSPBENCLK:1; 
    Uint16 ECANAENCLK:1;  
    Uint16 ECANBENCLK:1;  
};

union PCLKCR0_REG {
    Uint16              all;
    struct PCLKCR0_BITS bit;
};




struct PCLKCR1_BITS  {     
    Uint16 EPWM1ENCLK:1;   
    Uint16 EPWM2ENCLK:1;   
    Uint16 EPWM3ENCLK:1;   
    Uint16 EPWM4ENCLK:1;   
    Uint16 EPWM5ENCLK:1;   
    Uint16 EPWM6ENCLK:1;   
    Uint16 rsvd1:2;        
    Uint16 ECAP1ENCLK:1;   
    Uint16 ECAP2ENCLK:1;   
    Uint16 ECAP3ENCLK:1;   
    Uint16 ECAP4ENCLK:1;   
    Uint16 ECAP5ENCLK:1;   
    Uint16 ECAP6ENCLK:1;   
    Uint16 EQEP1ENCLK:1;   
    Uint16 EQEP2ENCLK:1;   
};

union PCLKCR1_REG {
    Uint16              all;
    struct PCLKCR1_BITS bit;
};




struct PCLKCR3_BITS  {         
    Uint16 rsvd1:8;            
    Uint16 CPUTIMER0ENCLK:1;   
    Uint16 CPUTIMER1ENCLK:1;   
    Uint16 CPUTIMER2ENCLK:1;   
    Uint16 DMAENCLK:1;         
    Uint16 XINTFENCLK:1;       
    Uint16 GPIOINENCLK:1;      
    Uint16 rsvd2:2;            
};

union PCLKCR3_REG {
    Uint16              all;
    struct PCLKCR3_BITS bit;
};




struct PLLCR_BITS {       
    Uint16 DIV:4;         
    Uint16 rsvd1:12;      
};

union PLLCR_REG {
    Uint16             all;
    struct PLLCR_BITS  bit;
};




struct LPMCR0_BITS {      
    Uint16 LPM:2;         
    Uint16 QUALSTDBY:6;   
    Uint16 rsvd1:7;       
    Uint16 WDINTE:1;      
};
    
union LPMCR0_REG {
    Uint16              all;
    struct LPMCR0_BITS  bit;
};




struct MAPCNF_BITS {     
    Uint16 MAPEPWM:1;    
    Uint16 rsvd1:15;     
};

union MAPCNF_REG {
	Uint16             all;
	struct MAPCNF_BITS bit;
};




struct SYS_CTRL_REGS {
    Uint16              rsvd1;     
    union   PLLSTS_REG  PLLSTS;    
    Uint16              rsvd2[8];  
    
    
    
    
    union   HISPCP_REG  HISPCP;
    
    union   LOSPCP_REG  LOSPCP;    
    union   PCLKCR0_REG PCLKCR0;   
    union   PCLKCR1_REG PCLKCR1;   
    union   LPMCR0_REG  LPMCR0;    
    Uint16              rsvd3;     
    union   PCLKCR3_REG PCLKCR3;   
    union   PLLCR_REG   PLLCR;     
    
    
    
    
    
    Uint16              SCSR;      
    
    Uint16              WDCNTR;    
    Uint16              rsvd4;     
    Uint16              WDKEY;     
    Uint16              rsvd5[3];  
    
    
    
    
    
    
    Uint16              WDCR;      
    
    Uint16              rsvd6[4];  
    union   MAPCNF_REG  MAPCNF;    
    Uint16              rsvd7[1];  
};








struct  CSMSCR_BITS {       
    Uint16     SECURE:1;    
    Uint16     rsvd1:14;    
    Uint16     FORCESEC:1;  
};




union CSMSCR_REG {
    Uint16             all;
    struct CSMSCR_BITS bit;
};




struct  CSM_REGS {
    Uint16           KEY0;    
    Uint16           KEY1;    
    Uint16           KEY2;    
    Uint16           KEY3;    
    Uint16           KEY4;    
    Uint16           KEY5;    
    Uint16           KEY6;    
    Uint16           KEY7;    
    Uint16           rsvd1;   
    Uint16           rsvd2;   
    Uint16           rsvd3;   
    Uint16           rsvd4;   
    Uint16           rsvd5;   
    Uint16           rsvd6;   
    Uint16           rsvd7;   
    union CSMSCR_REG CSMSCR;  
};  




struct  CSM_PWL {
    Uint16   PSWD0;  
    Uint16   PSWD1;  
    Uint16   PSWD2;  
    Uint16   PSWD3;  
    Uint16   PSWD4;  
    Uint16   PSWD5;  
    Uint16   PSWD6;  
    Uint16   PSWD7;  
};  
    







struct  FOPT_BITS {        
    Uint16     ENPIPE:1;   
    Uint16     rsvd:15;    
};




union FOPT_REG {
    Uint16           all;
    struct FOPT_BITS bit;
};




struct  FPWR_BITS {        
    Uint16     PWR:2;      
    Uint16     rsvd:14;    
};




union FPWR_REG {
    Uint16           all;
    struct FPWR_BITS bit;
};




struct  FSTATUS_BITS {        
    Uint16     PWRS:2;        
    Uint16     STDBYWAITS:1;  
    Uint16     ACTIVEWAITS:1; 
    Uint16     rsvd1:4;       
    Uint16     V3STAT:1;      
    Uint16     rsvd2:7;       
};  




union FSTATUS_REG {
    Uint16              all;
    struct FSTATUS_BITS bit;
};  




struct  FSTDBYWAIT_BITS {     
    
    
    
    Uint16     STDBYWAIT:9;
    
    Uint16     rsvd:7;        
};




union FSTDBYWAIT_REG {
    Uint16                 all;
    struct FSTDBYWAIT_BITS bit;
};




struct  FACTIVEWAIT_BITS {    
    
    
    
    Uint16     ACTIVEWAIT:9;
    
    Uint16     rsvd:7;        
};




union FACTIVEWAIT_REG {
    Uint16                  all;
    struct FACTIVEWAIT_BITS bit;
};




struct  FBANKWAIT_BITS {        
    Uint16     RANDWAIT:4;      
    Uint16     rsvd1:4;         
    Uint16     PAGEWAIT:4;      
    Uint16     rsvd2:4;         
}; 




union FBANKWAIT_REG {
    Uint16                all;
    struct FBANKWAIT_BITS bit;
};




struct  FOTPWAIT_BITS {       
    Uint16     OTPWAIT:5;     
    Uint16     rsvd:11;       
};




union FOTPWAIT_REG {
    Uint16               all;
    struct FOTPWAIT_BITS bit;
};  

struct FLASH_REGS {
    union FOPT_REG        FOPT;        
    Uint16                rsvd1;       
    union FPWR_REG        FPWR;        
    union FSTATUS_REG     FSTATUS;     
    
    
    
    
    union FSTDBYWAIT_REG  FSTDBYWAIT;
    
    
    
    
    union FACTIVEWAIT_REG FACTIVEWAIT;
    
    union FBANKWAIT_REG   FBANKWAIT;   
    union FOTPWAIT_REG    FOTPWAIT;    
};




extern volatile struct SYS_CTRL_REGS SysCtrlRegs;
extern volatile struct CSM_REGS CsmRegs;
extern volatile struct CSM_PWL CsmPwl;
extern volatile struct FLASH_REGS FlashRegs;






















































struct XINTCR_BITS {
    Uint16   ENABLE:1;    
    Uint16   rsvd1:1;     
    Uint16   POLARITY:2;  
    Uint16   rsvd2:12;    
};

union XINTCR_REG {
    Uint16               all;
    struct XINTCR_BITS   bit;
};  

struct XNMICR_BITS {
    Uint16   ENABLE:1;    
    Uint16   SELECT:1;    
    Uint16   POLARITY:2;  
    Uint16   rsvd2:12;    
};

union XNMICR_REG {
    Uint16               all;
    struct XNMICR_BITS   bit;
};  




struct XINTRUPT_REGS {
    union XINTCR_REG XINT1CR;
    union XINTCR_REG XINT2CR;
    union XINTCR_REG XINT3CR;
    union XINTCR_REG XINT4CR;
    union XINTCR_REG XINT5CR;
    union XINTCR_REG XINT6CR;
    union XINTCR_REG XINT7CR;
    union XNMICR_REG XNMICR;
    Uint16           XINT1CTR;
    Uint16           XINT2CTR;
    Uint16           rsvd[5];
    Uint16           XNMICTR;
};




extern volatile struct XINTRUPT_REGS XIntruptRegs;
























































struct XTIMING_BITS {     
    Uint16 XWRTRAIL:2;    
    Uint16 XWRACTIVE:3;   
    Uint16 XWRLEAD:2;     
    Uint16 XRDTRAIL:2;    
    Uint16 XRDACTIVE:3;   
    Uint16 XRDLEAD:2;     
    Uint16 USEREADY:1;    
    Uint16 READYMODE:1;   
    Uint16 XSIZE:2;       
    Uint16 rsvd1:4;       
    Uint16 X2TIMING:1;    
    Uint16 rsvd3:9;       
};

union XTIMING_REG {
    Uint32               all;
    struct XTIMING_BITS  bit;
};




struct XINTCNF2_BITS {     
    Uint16 WRBUFF:2;       
    Uint16 CLKMODE:1;      
    Uint16 CLKOFF:1;       
    Uint16 rsvd1:2;        
    Uint16 WLEVEL:2;       
    Uint16 rsvd2:1;        
    Uint16 HOLD:1;         
    Uint16 HOLDS:1;        
    Uint16 HOLDAS:1;       
    Uint16 rsvd3:4;        
    Uint16 XTIMCLK:3;      
    Uint16 rsvd4:13;       
};

union XINTCNF2_REG {
    Uint32                all;
    struct XINTCNF2_BITS  bit;
};




struct XBANK_BITS {       
    Uint16  BANK:3;       
    Uint16  BCYC:3;       
    Uint16  rsvd:10;      
};  
    
union XBANK_REG {
    Uint16             all;
    struct XBANK_BITS  bit;
};

struct XRESET_BITS {
    Uint16  XHARDRESET:1;
    Uint16  rsvd1:15;
};

union XRESET_REG {
    Uint16            all;
    struct XRESET_BITS bit;
};




struct XINTF_REGS {
    union XTIMING_REG XTIMING0;
    Uint32  rsvd1[5];
    union XTIMING_REG XTIMING6;
    union XTIMING_REG XTIMING7;
    Uint32  rsvd2[2];
    union XINTCNF2_REG XINTCNF2;
    Uint32  rsvd3;
    union XBANK_REG    XBANK;
    Uint16  rsvd4;
    Uint16  XREVISION;
    Uint16  rsvd5[2];
    union XRESET_REG   XRESET;
};




extern volatile struct XINTF_REGS XintfRegs;

























































































































































































extern void InitAdc(void);
extern void DMAInitialize(void);




extern void DMACH1AddrConfig(volatile Uint16 *DMA_Dest,
                             volatile Uint16 *DMA_Source);
extern void DMACH1BurstConfig(Uint16 bsize, int16 srcbstep, int16 desbstep);
extern void DMACH1TransferConfig(Uint16 tsize, int16 srctstep, int16 deststep);
extern void DMACH1WrapConfig(Uint16 srcwsize, int16 srcwstep, Uint16 deswsize,
                             int16 deswstep);
extern void DMACH1ModeConfig(Uint16 persel, Uint16 perinte, Uint16 oneshot, 
                             Uint16 cont, Uint16 synce, Uint16 syncsel, 
                             Uint16 ovrinte, Uint16 datasize, Uint16 chintmode,
                             Uint16 chinte);
extern void StartDMACH1(void);




extern void DMACH2AddrConfig(volatile Uint16 *DMA_Dest,
                             volatile Uint16 *DMA_Source);
extern void DMACH2BurstConfig(Uint16 bsize, int16 srcbstep, int16 desbstep);
extern void DMACH2TransferConfig(Uint16 tsize, int16 srctstep, int16 deststep);
extern void DMACH2WrapConfig(Uint16 srcwsize, int16 srcwstep, Uint16 deswsize, 
                             int16 deswstep);
extern void DMACH2ModeConfig(Uint16 persel, Uint16 perinte, Uint16 oneshot, 
                             Uint16 cont, Uint16 synce, Uint16 syncsel,
                             Uint16 ovrinte, Uint16 datasize, Uint16 chintmode,
                             Uint16 chinte);
extern void StartDMACH2(void);




extern void DMACH3AddrConfig(volatile Uint16 *DMA_Dest,
                             volatile Uint16 *DMA_Source);
extern void DMACH3BurstConfig(Uint16 bsize, int16 srcbstep, int16 desbstep);
extern void DMACH3TransferConfig(Uint16 tsize, int16 srctstep, int16 deststep);
extern void DMACH3WrapConfig(Uint16 srcwsize, int16 srcwstep, Uint16 deswsize, 
                             int16 deswstep);
extern void DMACH3ModeConfig(Uint16 persel, Uint16 perinte, Uint16 oneshot, 
                             Uint16 cont, Uint16 synce, Uint16 syncsel, 
                             Uint16 ovrinte, Uint16 datasize, Uint16 chintmode,
                             Uint16 chinte);
extern void StartDMACH3(void);




extern void DMACH4AddrConfig(volatile Uint16 *DMA_Dest,
                             volatile Uint16 *DMA_Source);
extern void DMACH4BurstConfig(Uint16 bsize, int16 srcbstep, int16 desbstep);
extern void DMACH4TransferConfig(Uint16 tsize, int16 srctstep, int16 deststep);
extern void DMACH4WrapConfig(Uint16 srcwsize, int16 srcwstep, Uint16 deswsize, 
                             int16 deswstep);
extern void DMACH4ModeConfig(Uint16 persel, Uint16 perinte, Uint16 oneshot, 
                             Uint16 cont, Uint16 synce, Uint16 syncsel,
                             Uint16 ovrinte, Uint16 datasize, Uint16 chintmode,
                             Uint16 chinte);
extern void StartDMACH4(void);




extern void DMACH5AddrConfig(volatile Uint16 *DMA_Dest,
                             volatile Uint16 *DMA_Source);
extern void DMACH5BurstConfig(Uint16 bsize, int16 srcbstep, int16 desbstep);
extern void DMACH5TransferConfig(Uint16 tsize, int16 srctstep, int16 deststep);
extern void DMACH5WrapConfig(Uint16 srcwsize, int16 srcwstep, Uint16 deswsize, 
                             int16 deswstep);
extern void DMACH5ModeConfig(Uint16 persel, Uint16 perinte, Uint16 oneshot, 
                             Uint16 cont, Uint16 synce, Uint16 syncsel,
                             Uint16 ovrinte, Uint16 datasize, Uint16 chintmode,
                             Uint16 chinte);
extern void StartDMACH5(void);




extern void DMACH6AddrConfig(volatile Uint16 *DMA_Dest,
                             volatile Uint16 *DMA_Source);
extern void DMACH6BurstConfig(Uint16 bsize, int16 srcbstep, int16 desbstep);
extern void DMACH6TransferConfig(Uint16 tsize, int16 srctstep, int16 deststep);
extern void DMACH6WrapConfig(Uint16 srcwsize, int16 srcwstep, Uint16 deswsize, 
                             int16 deswstep);
extern void DMACH6ModeConfig(Uint16 persel, Uint16 perinte, Uint16 oneshot, 
                             Uint16 cont, Uint16 synce, Uint16 syncsel,
                             Uint16 ovrinte, Uint16 datasize, Uint16 chintmode,
                             Uint16 chinte);
extern void StartDMACH6(void);

extern void InitPeripherals(void);
extern void InitECan(void);
extern void InitECana(void);
extern void InitECanGpio(void);
extern void InitECanaGpio(void);
extern void InitECanb(void);
extern void InitECanbGpio(void);
extern void InitECap(void);
extern void InitECapGpio(void);
extern void InitECap1Gpio(void);
extern void InitECap2Gpio(void);
extern void InitECap3Gpio(void);
extern void InitECap4Gpio(void);
extern void InitECap5Gpio(void);
extern void InitECap6Gpio(void);
extern void InitEPwm(void);
extern void InitEPwmGpio(void);
extern void InitEPwm1Gpio(void);
extern void InitEPwm2Gpio(void);
extern void InitEPwm3Gpio(void);
extern void InitEPwm4Gpio(void);
extern void InitEPwm5Gpio(void);
extern void InitEPwm6Gpio(void);
extern void InitEQep(void);
extern void InitEQepGpio(void);
extern void InitEQep1Gpio(void);
extern void InitEQep2Gpio(void);
extern void InitGpio(void);
extern void InitI2CGpio(void);

extern void InitMcbsp(void);
extern void InitMcbspa(void);
extern void delay_loop(void);
extern void InitMcbspaGpio(void);
extern void InitMcbspa8bit(void);
extern void InitMcbspa12bit(void);
extern void InitMcbspa16bit(void);
extern void InitMcbspa20bit(void);
extern void InitMcbspa24bit(void);
extern void InitMcbspa32bit(void);
extern void InitMcbspb(void);
extern void InitMcbspbGpio(void);
extern void InitMcbspb8bit(void);
extern void InitMcbspb12bit(void);
extern void InitMcbspb16bit(void);
extern void InitMcbspb20bit(void);
extern void InitMcbspb24bit(void);
extern void InitMcbspb32bit(void);

extern void InitPieCtrl(void);
extern void InitPieVectTable(void);

extern void InitSci(void);
extern void InitSciGpio(void);
extern void InitSciaGpio(void);
extern void InitScibGpio(void);
extern void InitScicGpio(void);
extern void InitSpi(void);
extern void InitSpiGpio(void);
extern void InitSpiaGpio(void);
extern void InitSysCtrl(void);
extern void InitTzGpio(void);
extern void InitXIntrupt(void);
extern void XintfInit(void);
extern void InitXintf16Gpio();
extern void InitXintf32Gpio();
extern void InitPll(Uint16 pllcr, Uint16 clkindiv);
extern void InitPeripheralClocks(void);
extern void EnableInterrupts(void);
extern void DSP28x_usDelay(Uint32 Count);
extern void ADC_cal (void);
extern void ServiceDog(void);
extern void DisableDog(void);
extern Uint16 CsmUnlock(void);




extern void SetDBGIER(Uint16 dbgier);






extern void InitFlash(void);

void MemCopy(Uint16 *SourceAddr, Uint16* SourceEndAddr, Uint16* DestAddr);







extern Uint16 RamfuncsLoadStart;
extern Uint16 RamfuncsLoadEnd;
extern Uint16 RamfuncsRunStart;
extern Uint16 RamfuncsLoadSize;

extern Uint16 XintffuncsLoadStart;
extern Uint16 XintffuncsLoadEnd;
extern Uint16 XintffuncsRunStart;
extern Uint16 XintffuncsLoadSize;




























































































































































































































































































































































struct I2CMSG 
{
    Uint16 MsgStatus;	
                        
                        
                        
                        
                        
                        
                        
                        
                        
    Uint16 SlaveAddress; 
    Uint16 NumOfBytes;	 
    
    
    
    
    Uint16 MemoryHighAddr;  
    
    
    
    
    Uint16 MemoryLowAddr;   
    
    
    
    
    Uint16 MsgBuffer[16];	
};






































































interrupt void INT13_ISR(void);     
interrupt void INT14_ISR(void);     
interrupt void DATALOG_ISR(void);   
interrupt void RTOSINT_ISR(void);   
interrupt void EMUINT_ISR(void);    
interrupt void NMI_ISR(void);       
interrupt void ILLEGAL_ISR(void);   
interrupt void USER1_ISR(void);     
interrupt void USER2_ISR(void);     
interrupt void USER3_ISR(void);     
interrupt void USER4_ISR(void);     
interrupt void USER5_ISR(void);     
interrupt void USER6_ISR(void);     
interrupt void USER7_ISR(void);     
interrupt void USER8_ISR(void);     
interrupt void USER9_ISR(void);     
interrupt void USER10_ISR(void);    
interrupt void USER11_ISR(void);    
interrupt void USER12_ISR(void);    




interrupt void  SEQ1INT_ISR(void);   
interrupt void  SEQ2INT_ISR(void);   
interrupt void  XINT1_ISR(void);     
interrupt void  XINT2_ISR(void);     
interrupt void  ADCINT_ISR(void);    
interrupt void  TINT0_ISR(void);     
interrupt void  WAKEINT_ISR(void);   




interrupt void EPWM1_TZINT_ISR(void);    
interrupt void EPWM2_TZINT_ISR(void);    
interrupt void EPWM3_TZINT_ISR(void);    
interrupt void EPWM4_TZINT_ISR(void);    
interrupt void EPWM5_TZINT_ISR(void);    
interrupt void EPWM6_TZINT_ISR(void);    
  



interrupt void EPWM1_INT_ISR(void);    
interrupt void EPWM2_INT_ISR(void);    
interrupt void EPWM3_INT_ISR(void);    
interrupt void EPWM4_INT_ISR(void);    
interrupt void EPWM5_INT_ISR(void);    
interrupt void EPWM6_INT_ISR(void);    
  



interrupt void ECAP1_INT_ISR(void);    
interrupt void ECAP2_INT_ISR(void);    
interrupt void ECAP3_INT_ISR(void);    
interrupt void ECAP4_INT_ISR(void);    
interrupt void ECAP5_INT_ISR(void);    
interrupt void ECAP6_INT_ISR(void);    
     



interrupt void EQEP1_INT_ISR(void);    
interrupt void EQEP2_INT_ISR(void);    




interrupt void SPIRXINTA_ISR(void);   
interrupt void SPITXINTA_ISR(void);   
interrupt void MRINTA_ISR(void);      
interrupt void MXINTA_ISR(void);      
interrupt void MRINTB_ISR(void);      
interrupt void MXINTB_ISR(void);      




interrupt void DINTCH1_ISR(void);     
interrupt void DINTCH2_ISR(void);     
interrupt void DINTCH3_ISR(void);     
interrupt void DINTCH4_ISR(void);     
interrupt void DINTCH5_ISR(void);     
interrupt void DINTCH6_ISR(void);     




interrupt void I2CINT1A_ISR(void);     
interrupt void I2CINT2A_ISR(void);     
interrupt void SCIRXINTC_ISR(void);    
interrupt void SCITXINTC_ISR(void);    
 



interrupt void SCIRXINTA_ISR(void);    
interrupt void SCITXINTA_ISR(void);    
interrupt void SCIRXINTB_ISR(void);    
interrupt void SCITXINTB_ISR(void);    
interrupt void ECAN0INTA_ISR(void);    
interrupt void ECAN1INTA_ISR(void);    
interrupt void ECAN0INTB_ISR(void);    
interrupt void ECAN1INTB_ISR(void);    




 







interrupt void  XINT3_ISR(void);     
interrupt void  XINT4_ISR(void);     
interrupt void  XINT5_ISR(void);     
interrupt void  XINT6_ISR(void);     
interrupt void  XINT7_ISR(void);     
interrupt void  LVF_ISR(void);       
interrupt void  LUF_ISR(void);       




interrupt void PIE_RESERVED(void);       
interrupt void rsvd_ISR(void);           
interrupt void INT_NOTUSED_ISR(void);    































 




 


 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 


 
# pragma diag_push
# pragma CHECK_MISRA("-19.7")
# pragma CHECK_MISRA("-19.4")
# pragma CHECK_MISRA("-19.1")
# pragma CHECK_MISRA("-19.15")
# pragma diag_pop

_Pragma("diag_push")
_Pragma("CHECK_MISRA(\"-19.4\")")
_Pragma("CHECK_MISRA(\"-19.1\")")
_Pragma("CHECK_MISRA(\"-19.6\")")



 



 

 
  







 



 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 


#pragma diag_push
#pragma CHECK_MISRA("-19.4")  

 


 
 
 

 
 
 

 
 
 

#pragma diag_pop


_Pragma("diag_pop")


_Pragma("diag_push")
_Pragma("CHECK_MISRA(\"-6.3\")")  
_Pragma("CHECK_MISRA(\"-12.7\")")  
_Pragma("CHECK_MISRA(\"-16.4\")")  
_Pragma("CHECK_MISRA(\"-19.1\")")  
_Pragma("CHECK_MISRA(\"-19.4\")")  
_Pragma("CHECK_MISRA(\"-19.7\")")  
_Pragma("CHECK_MISRA(\"-19.10\")")  
_Pragma("CHECK_MISRA(\"-20.1\")")  
_Pragma("CHECK_MISRA(\"-20.2\")")  

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 



_Pragma("diag_push")

_Pragma("CHECK_MISRA(\"-6.3\")")  
_Pragma("CHECK_MISRA(\"-8.1\")")  
_Pragma("CHECK_MISRA(\"-8.5\")")  
_Pragma("CHECK_MISRA(\"-8.11\")")  
_Pragma("CHECK_MISRA(\"-10.1\")")  
_Pragma("CHECK_MISRA(\"-10.3\")")  
_Pragma("CHECK_MISRA(\"-12.1\")")  
_Pragma("CHECK_MISRA(\"-12.2\")")  
_Pragma("CHECK_MISRA(\"-12.4\")")  
_Pragma("CHECK_MISRA(\"-12.7\")")  
_Pragma("CHECK_MISRA(\"-14.7\")")  
_Pragma("CHECK_MISRA(\"-14.9\")")  
_Pragma("CHECK_MISRA(\"-19.1\")")  
_Pragma("CHECK_MISRA(\"-19.4\")")  
_Pragma("CHECK_MISRA(\"-19.6\")")  
_Pragma("CHECK_MISRA(\"-19.7\")")  

_Pragma("diag_suppress 1558")  

 
 
 
 
 
 
 
 
 
 
 
 
 
 


 





























 





































 



_Pragma("diag_push")
_Pragma("CHECK_MISRA(\"none\")")



 






 









 












 











 





 





 







 







 









 








 







 


 







 




























 





 






 






 

 








 







 





























 

 

 

 




 











 

 





 



 






 












 


 

 

 

 

 

 

 

 

_Pragma("diag_pop")

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 



#pragma diag_push
 
#pragma CHECK_MISRA("-6.3")




 
    typedef          int    __int16_t;
    typedef unsigned int   __uint16_t;
    typedef          long   __int32_t;
    typedef unsigned long  __uint32_t;


 
typedef	long long		__int64_t;

 
typedef	unsigned long long	__uint64_t;



 
typedef	__uint32_t	__clock_t;		 
typedef	__int32_t	__critical_t;
typedef	double		__double_t;
typedef	float		__float_t;
typedef	__int32_t	__intfptr_t;
typedef	__int64_t	__intmax_t;
typedef __int32_t       __intptr_t;

typedef	__int16_t	__int_fast8_t;
typedef	__int16_t	__int_fast16_t;
typedef	__int32_t	__int_fast32_t;
typedef	__int64_t	__int_fast64_t;
typedef	__int16_t	__int_least8_t;
typedef	__int16_t	__int_least16_t;
typedef	__int32_t	__int_least32_t;
typedef	__int64_t	__int_least64_t;
typedef	long __ptrdiff_t;		 
typedef	__int16_t	__register_t;
typedef	__int32_t	__segsz_t;		 
typedef	unsigned long	__size_t;		 
typedef	__int32_t	__ssize_t;		 
typedef __uint32_t      __time_t;
typedef	__uint32_t	__uintfptr_t;
typedef	__uint64_t	__uintmax_t;
typedef	__uint32_t	__uintptr_t;

typedef	__uint16_t	__uint_fast8_t;
typedef	__uint16_t	__uint_fast16_t;
typedef	__uint32_t	__uint_fast32_t;
typedef	__uint64_t	__uint_fast64_t;
typedef	__uint16_t	__uint_least8_t;
typedef	__uint16_t	__uint_least16_t;
typedef	__uint32_t	__uint_least32_t;
typedef	__uint64_t	__uint_least64_t;
typedef	__uint16_t	__u_register_t;
typedef	__uint32_t	__vm_offset_t;
typedef	__uint32_t	__vm_paddr_t;
typedef	__uint32_t	__vm_size_t;

typedef	unsigned int ___wchar_t;




 
typedef long int _off_t;



 
typedef char* __va_list;

#pragma diag_pop


_Pragma("diag_push")
 
_Pragma("CHECK_MISRA(\"-6.3\")")



 
typedef	__int32_t	__blksize_t;	 
typedef	__int64_t	__blkcnt_t;	 
typedef	__int32_t	__clockid_t;	 
typedef	__uint32_t	__fflags_t;	 
typedef	__uint64_t	__fsblkcnt_t;
typedef	__uint64_t	__fsfilcnt_t;
typedef	__uint32_t	__gid_t;
typedef	__int64_t	__id_t;		 
typedef	__uint64_t	__ino_t;	 
typedef	long		__key_t;	 
typedef	__int32_t	__lwpid_t;	 
typedef	__uint16_t	__mode_t;	 
typedef	int		__accmode_t;	 
typedef	int		__nl_item;
typedef	__uint64_t	__nlink_t;	 
typedef	_off_t	        __off_t;	 
typedef	__int64_t	__off64_t;	 
typedef	__int32_t	__pid_t;	 
typedef	__int64_t	__rlim_t;	 
					 
					 
typedef	__uint16_t	__sa_family_t;
typedef	__uint32_t	__socklen_t;
typedef	long		__suseconds_t;	 
typedef	struct __timer	*__timer_t;	 
typedef	struct __mq	*__mqd_t;	 
typedef	__uint32_t	__uid_t;
typedef	unsigned int	__useconds_t;	 
typedef	int		__cpuwhich_t;	 
typedef	int		__cpulevel_t;	 
typedef int		__cpusetid_t;	 



 














 
typedef	int		__ct_rune_t;	 

typedef	__ct_rune_t	__rune_t;	 
typedef	__ct_rune_t	__wint_t;	 

 
typedef	__uint_least16_t __char16_t;
typedef	__uint_least32_t __char32_t;
 

typedef struct {
	long long __max_align1 __attribute__((aligned(__alignof__(long long))));
	long double __max_align2 __attribute__((aligned(__alignof__(long double))));
} __max_align_t;

typedef	__uint64_t	__dev_t;	 

typedef	__uint32_t	__fixpt_t;	 




 

typedef int _Mbstatet;

typedef _Mbstatet __mbstate_t;

typedef __uintmax_t     __rman_res_t;





 

_Pragma("diag_pop")

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

































 



_Pragma("diag_push")
_Pragma("CHECK_MISRA(\"-19.4\")")








 







			 




 


 

_Pragma("diag_pop")



 

































 

 __inline int __isfinite(double d)
{ return (((((unsigned int)(__f32_bits_as_u32(d) >> 16)) & 0x7f80u) == 0x7f80u)) == 0; }
 __inline int __isfinitef(float f)
{ return (((((unsigned int)(__f32_bits_as_u32(f) >> 16)) & 0x7f80u) == 0x7f80u)) == 0; }
 __inline int __isfinitel(long double e)
{ return (((((unsigned int)(__f64_bits_as_u64(e) >> 48)) & 0x7ff0u) == 0x7ff0u)) == 0; }

 __inline int __isnan(double d)
{ return (((((unsigned int)(__f32_bits_as_u32(d) >> 16)) & 0x7f80u) == 0x7f80u)) &&
        ((((__f32_bits_as_u32(d) & (((__uint32_t)(1) << (24-1)) - 1)) == 0)) == 0); }
 __inline int __isnanf(float f)
{ return (((((unsigned int)(__f32_bits_as_u32(f) >> 16)) & 0x7f80u) == 0x7f80u)) &&
        ((((__f32_bits_as_u32(f) & (((__uint32_t)(1) << (24-1)) - 1)) == 0)) == 0); }
 __inline int __isnanl(long double e)
{ return (((((unsigned int)(__f64_bits_as_u64(e) >> 48)) & 0x7ff0u) == 0x7ff0u)) &&
        ((((__f64_bits_as_u64(e) & (((__uint64_t)(1) << (53-1)) - 1)) == 0)) == 0); }

 __inline int __isnormal(double d)
{ return ((((((unsigned int)(__f32_bits_as_u32(d) >> (24-1))) & ((128u * 2) - 1)) == 0)) == 0) &&
         ((((((unsigned int)(__f32_bits_as_u32(d) >> 16)) & 0x7f80u) == 0x7f80u)) == 0); }

 __inline int __isnormalf(float f)
{ return ((((((unsigned int)(__f32_bits_as_u32(f) >> (24-1))) & ((128u * 2) - 1)) == 0)) == 0) &&
         ((((((unsigned int)(__f32_bits_as_u32(f) >> 16)) & 0x7f80u) == 0x7f80u)) == 0); }

 __inline int __isnormall(long double e)
{ return (((((__f64_bits_as_u64(e) >> (53-1)) & ((1024u * 2) - 1)) == 0)) == 0) &&
         ((((((unsigned int)(__f64_bits_as_u64(e) >> 48)) & 0x7ff0u) == 0x7ff0u)) == 0); }

 __inline int __signbit(double d)
{ return (((__f32_bits_as_u32(d) & ((__uint32_t)(1) << (32-1))) == 0)) == 0; }
 __inline int __signbitf(float f)
{ return (((__f32_bits_as_u32(f) & ((__uint32_t)(1) << (32-1))) == 0)) == 0; }
 __inline int __signbitl(long double e)
{ return (((__f64_bits_as_u64(e) & ((__uint64_t)(1) << (64-1))) == 0)) == 0; }



 

 __inline int __isinff(float f)
{ return (((((unsigned int)(__f32_bits_as_u32(f) >> 16)) & 0x7f80u) == 0x7f80u)) && (((__f32_bits_as_u32(f) & (((__uint32_t)(1) << (24-1)) - 1)) == 0)); }
 __inline int __isinf (double d)
{ return (((((unsigned int)(__f32_bits_as_u32(d) >> 16)) & 0x7f80u) == 0x7f80u)) && (((__f32_bits_as_u32(d) & (((__uint32_t)(1) << (24-1)) - 1)) == 0)); }
 __inline int __isinfl(long double e)
{ return (((((unsigned int)(__f64_bits_as_u64(e) >> 48)) & 0x7ff0u) == 0x7ff0u)) && (((__f64_bits_as_u64(e) & (((__uint64_t)(1) << (53-1)) - 1)) == 0)); }

 

 __inline int __fpclassifyf(float f)
{
    if ((((((unsigned int)(__f32_bits_as_u32(f) >> 16)) & 0x7f80u) == 0x7f80u)))
    {
        if ((((__f32_bits_as_u32(f) & (((__uint32_t)(1) << (24-1)) - 1)) == 0)))
            return 1;
        else return 2;
    }
    if ((((((unsigned int)(__f32_bits_as_u32(f) >> (24-1))) & ((128u * 2) - 1)) == 0)))
    {
        if ((((__f32_bits_as_u32(f) & (((__uint32_t)(1) << (24-1)) - 1)) == 0)))
            return 0;
        else return (-2);
    }
    return (-1);
}

 __inline int __fpclassify (double d)
{
    if ((((((unsigned int)(__f32_bits_as_u32(d) >> 16)) & 0x7f80u) == 0x7f80u)))
    {
        if ((((__f32_bits_as_u32(d) & (((__uint32_t)(1) << (24-1)) - 1)) == 0)))
            return 1;
        else return 2;
    }
    if ((((((unsigned int)(__f32_bits_as_u32(d) >> (24-1))) & ((128u * 2) - 1)) == 0)))
    {
        if ((((__f32_bits_as_u32(d) & (((__uint32_t)(1) << (24-1)) - 1)) == 0)))
            return 0;
        else return (-2);
    }
    return (-1);
}

 __inline int __fpclassifyl(long double e)
{
    if ((((((unsigned int)(__f64_bits_as_u64(e) >> 48)) & 0x7ff0u) == 0x7ff0u)))
    {
        if ((((__f64_bits_as_u64(e) & (((__uint64_t)(1) << (53-1)) - 1)) == 0)))
            return 1;
        else return 2;
    }
    if (((((__f64_bits_as_u64(e) >> (53-1)) & ((1024u * 2) - 1)) == 0)))
    {
        if ((((__f64_bits_as_u64(e) & (((__uint64_t)(1) << (53-1)) - 1)) == 0)))
            return 0;
        else return (-2);
    }
    return (-1);
}

















 







_Pragma("diag_pop")




 





 








 


 
 
 
 
 
 
 
 

 
 
 

 

 double      acos(double x);
 float       acosf(float x);
 long double acosl(long double x);
 double      asin(double x);
 float       asinf(float x);
 long double asinl(long double x);
 double      atan(double x);
 float       atanf(float x);
 long double atanl(long double x);
 double      atan2(double y, double x);
 float       atan2f(float y, float x);
 long double atan2l(long double y, long double x);
 double      cos(double x);
 float       cosf(float x);
 long double cosl(long double x);
 double      sin(double x);
 float       sinf(float x);
 long double sinl(long double x);
 double      tan(double x);
 float       tanf(float x);
 long double tanl(long double x);
 double      acosh(double x);
 float       acoshf(float x);
 long double acoshl(long double x);
 double      asinh(double x);
 float       asinhf(float x);
 long double asinhl(long double x);
 double      atanh(double x);
 float       atanhf(float x);
 long double atanhl(long double x);
 double      cosh(double x);
 float       coshf(float x);
 long double coshl(long double x);
 double      sinh(double x);
 float       sinhf(float x);
 long double sinhl(long double x);
 double      tanh(double x);
 float       tanhf(float x);
 long double tanhl(long double x);
 double      exp(double x);
 float       expf(float x);
 long double expl(long double x);
 double      exp2(double x);
 float       exp2f(float x);
 long double exp2l(long double x);
 double      expm1(double x);
 float       expm1f(float x);
 long double expm1l(long double x);
 double      frexp(double val, int *e);
 float       frexpf(float val, int *e);
 long double frexpl(long double val, int *e);
 int         ilogb(double x);
 int         ilogbf(float x);
 int         ilogbl(long double x);
 double      ldexp(double x, int e);
 float       ldexpf(float x, int e);
 long double ldexpl(long double x, int e);
 double      log(double x);
 float       logf(float x);
 long double logl(long double x);
 double      log10(double x);
 float       log10f(float x);
 long double log10l(long double x);
 double      log1p(double x);
 float       log1pf(float x);
 long double log1pl(long double x);
 double      log2(double x);
 float       log2f(float x);
 long double log2l(long double x);
 double      logb(double x);
 float       logbf(float x);
 long double logbl(long double x);
 double      modf(double val, double *iptr);
 float       modff(float val, float *iptr);
 long double modfl(long double val, long double *iptr);
 double      scalbn(double x, int n);
 float       scalbnf(float x, int n);
 long double scalbnl(long double x, int n);
 double      scalbln(double x, long n);
 float       scalblnf(float x, long n);
 long double scalblnl(long double x, long n);
 double      cbrt(double x);
 float       cbrtf(float x);
 long double cbrtl(long double x);
 double      fabs(double x);
 float       fabsf(float x);
 long double fabsl(long double x);
 double      hypot(double x, double y);
 float       hypotf(float x, float y);
 long double hypotl(long double x, long double y);
 double      pow(double x, double y);
 float       powf(float x, float y);
 long double powl(long double x, long double y);
 double      sqrt(double x);
 float       sqrtf(float x);
 long double sqrtl(long double x);
 double      erf(double x);
 float       erff(float x);
 long double erfl(long double x);
 double      erfc(double x);
 float       erfcf(float x);
 long double erfcl(long double x);
 double      lgamma(double x);
 float       lgammaf(float x);
 long double lgammal(long double x);
 double      tgamma(double x);
 float       tgammaf(float x);
 long double tgammal(long double x);
 double      ceil(double x);
 float       ceilf(float x);
 long double ceill(long double x);
 double      floor(double x);
 float       floorf(float x);
 long double floorl(long double x);
 double      nearbyint(double x);
 float       nearbyintf(float x);
 long double nearbyintl(long double x);
 double      rint(double x);
 float       rintf(float x);
 long double rintl(long double x);
 long        lrint(double x);
 long        lrintf(float x);
 long        lrintl(long double x);
 long long   llrint(double x);
 long long   llrintf(float x);
 long long   llrintl(long double x);
 double      round(double x);
 float       roundf(float x);
 long double roundl(long double x);
 long        lround(double x);
 long        lroundf(float x);
 long        lroundl(long double x);
 long long   llround(double x);
 long long   llroundf(float x);
 long long   llroundl(long double x);
 double      trunc(double x);
 float       truncf(float x);
 long double truncl(long double x);
 double      fmod(double x, double y);
 float       fmodf(float x, float y);
 long double fmodl(long double x, long double y);
 double      remainder(double x, double y);
 float       remainderf(float x, float y);
 long double remainderl(long double x, long double y);
 double      remquo(double x, double y, int *quo);
 float       remquof(float x, float y, int *quo);
 long double remquol(long double x, long double y, int *quo);
 double      copysign(double x, double y);
 float       copysignf(float x, float y);
 long double copysignl(long double x, long double y);
 double      nan(const char *tagp);
 float       nanf(const char *tagp);
 long double nanl(const char *tagp);
 double      nextafter(double x, double y);
 float       nextafterf(float x, float y);
 long double nextafterl(long double x, long double y);
 double      nexttoward(double x, long double y);
 float       nexttowardf(float x, long double y);
 long double nexttowardl(long double x, long double y);
 double      fdim(double x, double y);
 float       fdimf(float x, float y);
 long double fdiml(long double x, long double y);
 double      fmax(double x, double y);
 float       fmaxf(float x, float y);
 long double fmaxl(long double x, long double y);
 double      fmin(double x, double y);
 float       fminf(float x, float y);
 long double fminl(long double x, long double y);
 double      fma(double x, double y, double z);
 float       fmaf(float x, float y, float z);
 long double fmal(long double x, long double y, long double z);



_Pragma("diag_pop")

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 






_Pragma("diag_push")
_Pragma("CHECK_MISRA(\"-6.3\")")  
_Pragma("CHECK_MISRA(\"-8.5\")")  
_Pragma("CHECK_MISRA(\"-19.1\")")  
_Pragma("CHECK_MISRA(\"-19.7\")")  
_Pragma("CHECK_MISRA(\"-20.1\")")  
_Pragma("CHECK_MISRA(\"-20.2\")")  

 
 
 


_Pragma("diag_push")
_Pragma("CHECK_MISRA(\"-5.7\")")  

typedef struct { int quot, rem; } div_t;

typedef struct { long quot, rem; } ldiv_t;

typedef struct { long long quot, rem; } lldiv_t;

_Pragma("diag_pop")




typedef unsigned long size_t;


typedef unsigned int wchar_t;




 
 
 
 
 
 
 
_Pragma("diag_push")
_Pragma("CHECK_MISRA(\"-16.4\")")  
      int       abs(int _val); 
      long      labs(long _val);
      long long llabs(long long _val);
_Pragma("diag_pop")

     int       atoi(const char *_st);
     long      atol(const char *_st);
     long long atoll(const char *_st);
     char     *ltoa(long val, char * buffer, int radix);
          extern  double    atof(const char *_st);

     long      strtol(const char * __restrict _st,
                                  char ** __restrict _endptr, int _base);
     unsigned long strtoul(const char * __restrict _st,
                                       char ** __restrict _endptr, int _base);
     long long strtoll(const char * __restrict _st,
                                   char ** __restrict _endptr, int _base);
     unsigned long long strtoull(const char * __restrict _st,
                                             char ** __restrict _endptr,
					     int _base);
     float     strtof(const char * __restrict _st,
                                  char ** __restrict _endptr);
     double    strtod(const char * __restrict _st,
                                  char ** __restrict _endptr);
     long double strtold(const char * __restrict _st,
                                     char ** __restrict _endptr);
    
     int    rand(void);
     void   srand(unsigned _seed);
    
     void  *calloc(size_t _num, size_t _size)
               ;
     void  *malloc(size_t _size)
               ;
     void  *realloc(void *_ptr, size_t _size);
     void   free(void *_ptr);
     void  *memalign(size_t _aln, size_t _size)
               ;
     void  *aligned_alloc(size_t _aln, size_t _size)
               ;

     void   __TI_heap_stats(void);
     void  *__TI_heap_check(void);
     size_t __TI_heap_total_available(void);
     size_t __TI_heap_largest_available(void);
    
    __attribute__((noreturn))  void abort(void) ;

    typedef void (*__TI_atexit_fn)(void);
     int    atexit(__TI_atexit_fn _func) ;

    typedef int (*__TI_compar_fn)(const void *_a,const void *_b);
     void  *bsearch(const void *_key, const void *_base,
                                size_t _nmemb, size_t _size, 
                                __TI_compar_fn compar);
     void   qsort(void *_base, size_t _nmemb, size_t _size, 
                              __TI_compar_fn compar);

    __attribute__((noreturn))  void exit(int _status);
    __attribute__((noreturn))  void _Exit(int _status);

    __attribute__((noreturn))  void quick_exit(int _status);
     int at_quick_exit(__TI_atexit_fn _func) ;
    
     div_t  div(int _numer, int _denom);
     ldiv_t ldiv(long _numer, long _denom);
     lldiv_t lldiv(long long _numer, long long _denom);

     char  *getenv(const char *_string);
     int    system(const char *_name);

     int    mblen(const char *_s, size_t _n);
     size_t mbstowcs(wchar_t * __restrict _dest,
                                 const char * __restrict _src, size_t _n);
     int    mbtowc(wchar_t * __restrict _dest,
                               const char * __restrict _src, size_t _n);

     size_t wcstombs(char * __restrict _dest,
                                 const wchar_t * __restrict _src, size_t _n);
     int    wctomb(char *_s, wchar_t _wc);





 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

#pragma diag_push
#pragma CHECK_MISRA("-6.3")


 long          far_strtol (const char *st,
                                       char **endptr, 
				       int base);
 unsigned long far_strtoul(const char *st,
                                       char **endptr, 
				       int base);
 double        far_strtod (const char *st,
                                       char **endptr);
 long double   far_strtold (const char *st,
                                        char **endptr);
 long long     far_strtoll(const char *st,
                                       char **endptr, 
		 		       int base);
 unsigned long long far_strtoull(const char *st, 
                                                   char **endptr,
                                                   int base);
 int           far_atoi(const char *st);
 long          far_atol(const char *st);
 double        far_atof(const char *st);
 long long     far_atoll(const char *st);

 void     *far_calloc  (unsigned long num, unsigned long size);
 void     *far_malloc  (unsigned long size);
 void     *far_realloc (void *ptr, unsigned long size);
 void          far_free    (void *ptr);

 void     *far_bsearch(const void *key, 
                                       const void *base, 
			               size_t nmemb, size_t size, 
			               int (*compar)(const void *a,
                                                     const void *b));
 void          far_qsort  (void *base, 
                                       size_t nmemb, size_t size,
			               int (*compar)(const void *a, 
                                                     const void *b));


#pragma diag_pop



_Pragma("diag_push")
_Pragma("CHECK_MISRA(\"-19.4\")")  

ldiv_t __attribute__((builtin))
__euclidean_div_i32byu32(long numerator, unsigned long denominator);


_Pragma("diag_pop")


_Pragma("diag_pop")



_Pragma("diag_push")
_Pragma("CHECK_MISRA(\"-19.15\")") 
 
_Pragma("CHECK_MISRA(\"-19.1\")")

 
 
 
 

 
 
 
 

 
 
 
 
 
 
#pragma diag_pop
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 




_Pragma("diag_push")
_Pragma("CHECK_MISRA(\"-6.3\")")  
_Pragma("CHECK_MISRA(\"-19.1\")")  
_Pragma("CHECK_MISRA(\"-20.1\")")  
_Pragma("CHECK_MISRA(\"-20.2\")")  





_Pragma("diag_push")
_Pragma("CHECK_MISRA(\"-19.4\")")  


_Pragma("diag_pop")

 size_t  strlen(const char *string);

 char *strcpy(char * __restrict dest,
                        const char * __restrict src);
 char *strncpy(char * __restrict dest,
                         const char * __restrict src, size_t n);
 char *strcat(char * __restrict string1,
                        const char * __restrict string2);
 char *strncat(char * __restrict dest,
                         const char * __restrict src, size_t n);
 char *strchr(const char *string, int c);
 char *strrchr(const char *string, int c);

 int  strcmp(const char *string1, const char *string2);
 int  strncmp(const char *string1, const char *string2, size_t n);

 int     strcoll(const char *string1, const char *_string2);
 size_t  strxfrm(char * __restrict to,
                             const char * __restrict from, size_t n);
 char   *strpbrk(const char *string, const char *chs);
 size_t  strspn(const char *string, const char *chs);
 size_t  strcspn(const char *string, const char *chs);
 char   *strstr(const char *string1, const char *string2);
 char   *strtok(char * __restrict str1,
                            const char * __restrict str2);
 char   *strerror(int _errno);
 char   *strdup(const char *string);


 void   *memmove(void *s1, const void *s2, size_t n);

 void   *memccpy(void *dest, const void *src, int ch, size_t count);

_Pragma("diag_push")
_Pragma("CHECK_MISRA(\"-16.4\")")  
 void   *memcpy(void * __restrict s1,
                            const void * __restrict s2, size_t n);
_Pragma("diag_pop")

 int     memcmp(const void *cs, const void *ct, size_t n);
 void   *memchr(const void *cs, int c, size_t n);

   void   *memset(void *mem, int ch, size_t length);



_Pragma("diag_push")




 
_Pragma("CHECK_MISRA(\"-19.4\")")

_Pragma("diag_pop")

size_t    far_strlen(const char *s);
char     *strcpy_nf(char *s1, const char *s2);
char *strcpy_fn(char *s1, const char *s2);
char *strcpy_ff(char *s1, const char *s2);
char *far_strncpy(char *s1, const char *s2, size_t n);
char *far_strcat(char *s1, const char *s2);
char *far_strncat(char *s1, const char *s2, size_t n);
char *far_strchr(const char *s, int c);
char *far_strrchr(const char *s, int c);
int       far_strcmp(const char *s1, const char *s2);
int       far_strncmp(const char *s1, const char *s2, size_t n);
int       far_strcoll(const char *s1, const char *s2);
size_t    far_strxfrm(char *s1, const char *s2, size_t n);
char *far_strpbrk(const char *s1, const char *s2);
size_t    far_strspn(const char *s1, const char *s2);
size_t    far_strcspn(const char *s1, const char *s2);
char *far_strstr(const char *s1, const char *s2);
char *far_strtok(char *s1, const char *s2);
char *far_strerror(int _errno);
void *far_memmove(void *s1, const void *s2, size_t n);
void     *__memcpy_nf (void *_s1, const void *_s2, size_t _n);
void *__memcpy_fn (void *_s1, const void *_s2, size_t _n);
void *__memcpy_ff (void *_s1, const void *_s2, size_t _n);
int       far_memcmp(const void *s1, const void *s2, size_t n);
void *far_memchr(const void *s, int c, size_t n);
void *far_memset(void *s, int c, size_t n);
void *far_memlcpy(void *to, const void *from,
                        unsigned long n);
void *far_memlmove(void *to, const void *from,
                         unsigned long n);




 
 
 
 

 
 
 
 


_Pragma("diag_pop")






 


unsigned long definePRD(float T);
unsigned int defineQuotient(float T);
void readEncoder(void);
void definePWM_DIVSandPRD(float PWMfreq,short PWMchannel);
void defineDeadBand(float deadtime,short PWMchannel);






 


void initMCU(void);






 


__interrupt void SCI_RX();
__interrupt void TIMER0INT();
__interrupt void TIMER1INT();
__interrupt void TIMER2INT();
__interrupt void BUTTON1INT();
__interrupt void BUTTON2INT();
__interrupt void ENCODERINT();
__interrupt void ADCINT();
void PWM_setDuty();






 


void sendTMSstate(void);
void parseUARTframe(void);

void setLED(short index,short state);
void setPWMfreq(short index, float freq);
void setTimerFreq(short index, float freq);
void setDeadTime(short index, float deadtime);


     
     



 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 



_Pragma("diag_push")
_Pragma("CHECK_MISRA(\"-20.1\")")  









_Pragma("diag_pop")



 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

 
 
 
 
 


_Pragma("diag_push")
_Pragma("CHECK_MISRA(\"-20.1\")")  










_Pragma("diag_pop")


void main(void)
{
     initMCU();

    while(1){
        DSP28x_usDelay(((((long double) 1000000 * 1000.0L) / (long double)6.667L) - 9.0L) / 5.0L);

        __asm(" NOP");
        state.pwm_duty[4] = state.vr_adc[0];
        state.pwm_duty[5] = state.vr_adc[1];
        PWM_setDuty();

    }
}
