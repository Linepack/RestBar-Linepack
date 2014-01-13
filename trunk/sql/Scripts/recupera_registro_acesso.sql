declare
 va_string 		varchar2(2000);
 va_value  		number(2);
 va_value2 		char(1);
 va_random 		number;
 va_count  		number(10) := 0;
 va_st_acesso linepackrandom.st_acesso%type;
begin 
   for i in 1.. 35 loop
     va_count   := va_count + 1;
     
     begin  
      select nr_random
        into va_random
        from linepackrandom
       where nr_posicao = va_count
         and to_char(dt_mes_ano,'MM/YYYY') = to_char(sysdate,'MM/YYYY');    
     end;
     
     va_value   := substr(va_random,2,2);
     va_value2  := substr('ablcedeafgnhidjkrlmonopqrstuvxzwablcedeafgnhidjkrlmonopqrstuvxzwablcedeafgnhidjkrlmonopqrstuvxzw',substr(va_random,2,2),1);
     va_string  := va_string||va_value||va_value2;
   end loop;
   dbms_output.put_line(va_string);
end;