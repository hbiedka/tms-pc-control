clear


conn = serial('COM4','baudrate',9600,'parity','odd','stopbits',1);
fopen(conn);

n = 0;
while(1)
    if conn.BytesAvailable > 0
        d = fread(conn,1,"uint8");
        fprintf("%d,",d);
        n=n+1;
        if n >= 6
            break
        end
    end
end
%%
fclose(conn);
delete(conn);
clear conn;