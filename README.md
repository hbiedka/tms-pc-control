# tms-pc-control
Sterowanie peryferiami mikrokontrolera TMS320F2 za pomocą aplikacji na komputer PC

### W ramach projektu przygotowano:
- kod źródłowy dla mikrokontrolera w języku C (*/TI_wkspc/tms_pc_control*),
- aplikację (GUI) do sterowania z komputera w środowisku MATLAB (*/app*).

### Za pomocą takiego systemu można:
- wyświetlać na ekranie komputera stan przycisków PB1 i PB2,
- wyświetlać położenie enkodera obrotowego heksadecymalnego,
- wyświetlać odczyty z ADC (potencjometry VR1 i VR2),
- sterować diodami LD3 i LD4,
- sterować kanałami ePWM1...6 (częstotliwość, wypełnienie, czasy martwe),
- sterować wewnętrznymi zegarami Timer1 i Timer2.

