% testy funkcji odbieraj¹cej UART

clear

conn = serialport('COM4',9600,'Parity','odd','StopBits',1);
configureTerminator(conn,"CR/LF");
configureCallback(conn,"terminator",@uartGetFrame);

pause;

delete(conn);
clear conn;

%%
function uartGetFrame(src,evt)
    frame = [];
    while src.NumBytesAvailable > 0
        d = read(src,1,"uint8");
        frame = [ frame d ];
    end
    
    for i = 1:numel(frame)
        fprintf("%d\t",frame(i));
    end
    fprintf("\n");
    
end