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
gui_LD3_0 = uicontrol(gui,'Style','PushButton','String','0','Position',[x+60 y+40 30 30],'Callback',@(src,evt)UartSend(conn,0,0));
gui_LD3_1 = uicontrol(gui,'Style','PushButton','String','1','Position',[x+100 y+40 30 30],'Callback',@(src,evt)UartSend(conn,0,1));

gui_LD4_label = uicontrol(gui,'Style','text','String','LD4','Position',[x y 45 20],'HorizontalAlignment','right');
gui_LD4_0 = uicontrol(gui,'Style','PushButton','String','0','Position',[x+60 y 30 30],'Callback',@(src,evt)UartSend(conn,1,0));
gui_LD4_1 = uicontrol(gui,'Style','PushButton','String','1','Position',[x+100 y 30 30],'Callback',@(src,evt)UartSend(conn,1,1));



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

function UartSend(src,reg,val)
    %fprintf('Sending %d=(%d)\n',reg,val);
    frame = [ 100 reg val 13 10];
    write(src,frame,"uint8");
end
