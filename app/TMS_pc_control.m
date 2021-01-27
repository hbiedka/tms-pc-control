% TMS320x2833 Peripherial Controller
% by Bogdan Bednarski & Hubert Biedka 2021

clear
close all

%% pobierz informacje o porcie szeregowym

%znajdŸ dostêpne porty szeregowe
ports = serialportlist;

if numel(ports) == 0
    def_port = 'COM1';
else
    def_port = convertStringsToChars(ports(1));
end

com_dialog = inputdlg({'Select serial port'},'Select COM port',[1 20],{def_port});

if numel(com_dialog) > 0
    serial_port = com_dialog{1};
else
    errordlg("Serial port not selected")
    return
end
fprintf("Connecting to %s...\n",serial_port);


%%

conn = serialport(serial_port,9600,'Parity','odd','StopBits',1);
configureTerminator(conn,"CR/LF");

% Potstawowe elementy UI
gui = figure("Name","TMS320 Peripherial UART Control");
gui_title = uicontrol(gui,'Style','text','String','TMS320x2833 Peripherial UART Control','Position',[20 350 500 50],'HorizontalAlignment','left','FontSize',18,'FontWeight','bold');
gui_credits = uicontrol(gui,'Style','text','String','By Bogdan Bednarski & Hubert Biedka Warsaw University of Technology, 2021','Position',[350 10 200 30],'HorizontalAlignment','right');

% Enkoder, przyciski
x=20;
y=20;
gui_b1 = uicontrol(gui,'Style','edit','Position',[x+50 y+60 15 20]);
gui_b2 = uicontrol(gui,'Style','edit','Position',[x+50 y+30 15 20]);
gui_encoder = uicontrol(gui,'Style','edit','Position',[x+50 y 15 20]);
gui_b1_label = uicontrol(gui,'Style','text','String','PB1','Position',[x y+55 45 20],'HorizontalAlignment','right');
gui_b2_label = uicontrol(gui,'Style','text','String','PB2','Position',[x y+25 45 20],'HorizontalAlignment','right');
gui_encoder_label = uicontrol(gui,'Style','text','String','Encoder','Position',[x y-5 45 20],'HorizontalAlignment','right');

%potencjometry
x = 100;
y = 20;
gui_vr1_label = uicontrol(gui,'Style','text','String','VR1','Position',[x y+55 45 20],'HorizontalAlignment','right');
gui_vr2_label = uicontrol(gui,'Style','text','String','VR2','Position',[x y+25 45 20],'HorizontalAlignment','right');
gui_vr1 = uicontrol(gui,'Style','edit','Position',[x+50 y+60 30 20]);
gui_vr2 = uicontrol(gui,'Style','edit','Position',[x+50 y+30 30 20]);

%sterowanie LEDami
x = 200;
y = 40;
gui_LD3_label = uicontrol(gui,'Style','text','String','LD3','Position',[x y+40 45 20],'HorizontalAlignment','right');
gui_LD3_0 = uicontrol(gui,'Style','PushButton','String','0','Position',[x+60 y+40 30 30],'Callback',@(src,evt)UartSend(conn,0,0,1));
gui_LD3_1 = uicontrol(gui,'Style','PushButton','String','1','Position',[x+100 y+40 30 30],'Callback',@(src,evt)UartSend(conn,0,1,1));

gui_LD4_label = uicontrol(gui,'Style','text','String','LD4','Position',[x y 45 20],'HorizontalAlignment','right');
gui_LD4_0 = uicontrol(gui,'Style','PushButton','String','0','Position',[x+60 y 30 30],'Callback',@(src,evt)UartSend(conn,1,0,1));
gui_LD4_1 = uicontrol(gui,'Style','PushButton','String','1','Position',[x+100 y 30 30],'Callback',@(src,evt)UartSend(conn,1,1,1));

%tabela PWM
gui_PWM_label = {};
gui_PWM_freq = {};
gui_PWM_duty = {};
gui_PWM_dead = {};
gui_PWM_send = {};

x = 20;
y = 150;

gui_freq_label = uicontrol(gui,'Style','text','String','Freq [Hz] (1-10000)','Position',[x+50 y+165 50 40]);
gui_duty_label = uicontrol(gui,'Style','text','String','Duty [%] (0-100)','Position',[x+110 y+165 50 40]);
gui_dead_label = uicontrol(gui,'Style','text','String','DeadTime [ns] (0-10000)','Position',[x+170 y+165 70 40]);

for i = 1:6 
    label = sprintf("ePWM%d",i);
    gui_PWM_label{i} = uicontrol(gui,'Style','text','String',label,'Position',[x y+30*(6-i)-5 45 20],'HorizontalAlignment','right');
    gui_PWM_freq{i} = uicontrol(gui,'Style','edit','String','1000','Position',[x+50 y+30*(6-i) 50 20]);
    gui_PWM_duty{i} = uicontrol(gui,'Style','edit','String','50','Position',[x+110 y+30*(6-i) 50 20]);
    gui_PWM_dead{i} = uicontrol(gui,'Style','edit','String','0','Position',[x+180 y+30*(6-i) 50 20]);
    gui_PWM_send{i} = uicontrol(gui,'Style','PushButton','String','Update','Position',[x+250 y+30*(6-i)-3 50 25],...
        'Callback',@(src,evt)PwmUpdate(conn,i,gui_PWM_freq{i},gui_PWM_duty{i},gui_PWM_dead{i}));
end

%timery
x = 350;
y = 270;

gui_timfreq_label = uicontrol(gui,'Style','text','String','Frequency [Hz] (0.001-10000)','Position',[x+40 y+45 80 40]);
gui_T1_label = uicontrol(gui,'Style','text','String','Timer1','Position',[x y+25 40 20],'HorizontalAlignment','right');
gui_T2_label = uicontrol(gui,'Style','text','String','Timer2','Position',[x y-5 40 20],'HorizontalAlignment','right');
gui_T1 = uicontrol(gui,'Style','edit','String','100','Position',[x+50 y+30 60 20]);
gui_T2 = uicontrol(gui,'Style','edit','String','100','Position',[x+50 y 60 20]);

gui_T1_send = uicontrol(gui,'Style','PushButton','String','Update','Position',[x+120 y+27 50 25],'Callback',@(src,evt)TimerUpdate(conn,1,gui_T1));
gui_T2_send = uicontrol(gui,'Style','PushButton','String','Update','Position',[x+120 y-3 50 25],'Callback',@(src,evt)TimerUpdate(conn,2,gui_T2));

% funkcja wywo³ana po odebraniu ramki UART
configureCallback(conn,"terminator",@(src,evt)uartGetFrame(src,gui_vr1,gui_vr2,gui_b1,gui_b2,gui_encoder));

%dopóki GUI otwarte
while(ishandle(gui))
    %NOP NOP NOP
    pause(0.2);
end

%zamykanie po³aczeñ
disp("Closing...")

delete(conn);
clear conn;

close all;
%%
function uartGetFrame(src,vr1,vr2,b1,b2,encoder)

    frame = [];
    while src.NumBytesAvailable > 0
        d = read(src,1,"uint8");
        frame = [ frame d ];
    end

    %%process and display
    hexenc = dec2hex(bitand(frame(2),15));
    but1 = bitshift(bitand(frame(2),16),-4);
    but2 = bitshift(bitand(frame(2),32),-5);
    
    encoder.String = hexenc;
    b1.String=num2str(but1);
    b2.String=num2str(but2);
    
    vr1.String=num2str(frame(3));
    vr2.String=num2str(frame(4));
    
end

function UartSend(src,reg,val,valbytes)

    valdata = val; %backup
    val = []; % zmiana na tablicê

    for i = 1:valbytes
        %pobierz najm³odszy bajt
        vb = bitand(valdata,255);
        valdata = bitshift(valdata,-8);
        val = [ vb val ];
    end
    
    frame = [ 100 reg val 13 10];
    write(src,frame,"uint8");
end

function TimerUpdate(conn,i,freq)
    
    freqData = str2double(freq.String);
    freq_reg = floor(freqData*1000);
    
    if freq_reg > 0 && freq_reg <= 10000000
        UartSend(conn,64+i,freq_reg,4);
    else
        %ostrze¿enie
        errordlg("Invalid value. Frequency should be from 0.001 to 10000 [Hz]")
    end
end

function PwmUpdate(conn,i,freq,duty,dead)
    
    dataFreq = floor(str2double(freq.String));
    dataDuty = floor(str2double(duty.String));
    dataDead = floor(str2double(dead.String));
    
    if dataFreq <= 10000 && dataFreq > 0
        UartSend(conn,15+i,dataFreq,2);
    else
        %ostrze¿enie
        errordlg("Invalid value. Frequency should be from 1 to 10000 [Hz]")
    end
    
    pause(0.01);
    if dataDuty <= 100
        UartSend(conn,31+i,dataDuty,1);
    else
        %ostrze¿enie
        errordlg("Invalid value. Duty cycle should be from 0 to 100 [%]")
    end
    
    pause(0.01);
    if dataDead <= 10000
        UartSend(conn,47+i,dataDead,2);
    else
        %ostrze¿enie
        errordlg("Invalid value. Deadband time should be from 0 to 10000 [ns]")
    end
end
