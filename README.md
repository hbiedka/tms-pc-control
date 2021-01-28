# tms-pc-control
Sterowanie peryferiami mikrokontrolera TMS320F2 za pomoc� aplikacji na komputer PC

*** W ramach projektu przygotowano:
- kod �r�d�owy dla mikrokontrolera w j�zyku C (*/TI_wkspc/tms_pc_control*),
- aplikacj� (GUI) do sterowania z komputera w �rodowisku MATLAB (*/app*).

*** Za pomoc� takiego systemu mo�na:
- wy�wietla� na ekranie komputera stan przycisk�w PB1 i PB2,
- wy�wietla� po�o�enie enkodera obrotowego heksadecymalnego,
- wy�wietla� odczyty z ADC (potencjometry VR1 i VR2),
- sterowa� diodami LD3 i LD4,
- sterowa� kana�ami ePWM1...6 (cz�stotliwo��, wype�nienie, czasy martwe),
- sterowa� wewn�trznymi zegarami Timer1 i Timer2.

