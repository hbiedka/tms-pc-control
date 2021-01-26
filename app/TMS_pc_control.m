% testy funkcji odbieraj¹cej UART
clear
close all

conn = serialport('COM4',9600,'Parity','odd','StopBits',1);
configureTerminator(conn,"CR/LF");

gui = figure("Name","TMS320 Peripherial UART Control");

x=100;
y=250;
gui_vr1 = uicontrol(gui,'Style','edit','Position',[x+50 y+120 30 20]);
gui_vr2 = uicontrol(gui,'Style','edit','Position',[x+50 y+90 30 20]);

gui_b1 = uicontrol(gui,'Style','edit','Position',[x+50 y+60 15 20]);
gui_b2 = uicontrol(gui,'Style','edit','Position',[x+50 y+30 15 20]);
gui_encoder = uicontrol(gui,'Style','edit','Position',[x+50 y 15 20]);

gui_vr1_label = uicontrol(gui,'Style','text','String','VR1','Position',[x y+115 45 20],'HorizontalAlignment','right');
gui_vr2_label = uicontrol(gui,'Style','text','String','VR2','Position',[x y+85 45 20],'HorizontalAlignment','right');
gui_b1_label = uicontrol(gui,'Style','text','String','PB1','Position',[x y+55 45 20],'HorizontalAlignment','right');
gui_b2_label = uicontrol(gui,'Style','text','String','PB2','Position',[x y+25 45 20],'HorizontalAlignment','right');
gui_encoder_label = uicontrol(gui,'Style','text','String','Encoder','Position',[x y-5 45 20],'HorizontalAlignment','right');

x = 200;
y = 320;

gui_LD3_label = uicontrol(gui,'Style','text','String','LD3','Position',[x y+40 45 20],'HorizontalAlignment','right');
gui_LD3_0 = uicontrol(gui,'Style','PushButton','String','0','Position',[x+60 y+40 30 30],'Callback',@(src,evt)UartSend(conn,0,0,1));
gui_LD3_1 = uicontrol(gui,'Style','PushButton','String','1','Position',[x+100 y+40 30 30],'Callback',@(src,evt)UartSend(conn,0,1,1));

gui_LD4_label = uicontrol(gui,'Style','text','String','LD4','Position',[x y 45 20],'HorizontalAlignment','right');
gui_LD4_0 = uicontrol(gui,'Style','PushButton','String','0','Position',[x+60 y 30 30],'Callback',@(src,evt)UartSend(conn,1,0,1));
gui_LD4_1 = uicontrol(gui,'Style','PushButton','String','1','Position',[x+100 y 30 30],'Callback',@(src,evt)UartSend(conn,1,1,1));

gui_PWM_label = {};
gui_PWM_freq = {};
gui_PWM_duty = {};
gui_PWM_dead = {};
gui_PWM_send = {};

x = 20;
y = 20;

gui_freq_label = uicontrol(gui,'Style','text','String','Freq [Hz] (0-10000)','Position',[x+50 y+165 50 40]);
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


configureCallback(conn,"terminator",@(src,evt)uartGetFrame(src,gui_vr1,gui_vr2,gui_b1,gui_b2,gui_encoder));

while(ishandle(gui))
    pause(0.2);
end


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
    
    if valbytes == 2
        %rozk³ad na 2 bajty
        val_hi = bitshift(bitand(val,0xFF00),-8);
        val_lo = bitand(val,0x00FF);
        val = [val_hi val_lo];
    end
        
    frame = [ 100 reg val 13 10];
    write(src,frame,"uint8");
end

function PwmUpdate(conn,i,freq,duty,dead)
    
    dataFreq = floor(str2double(freq.String));
    dataDuty = floor(str2double(duty.String));
    dataDead = floor(str2double(dead.String));
    
    if dataFreq <= 10000
        UartSend(conn,15+i,dataFreq,2);
    else
        %ostrze¿enie
        errordlg("Invalid value. Frequency should be from 0 to 10000 [Hz]")
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
