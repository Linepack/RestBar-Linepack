CREATE OR REPLACE FUNCTION     fun_valida_cpf                                                     
     (par_cpf  IN number)                                                       
     RETURN BOOLEAN IS                                                          
   va_cpf       varchar2(15);                                                   
   va_numero    number(1);                                                      
   va_multip    number(2) := 2;                                                 
   va_total     number(4) := 0;                                                 
   va_digito1   number(1);                                                      
   va_digito2   number(1);                                                      
BEGIN                                                                           
   va_cpf := ltrim(to_char(par_cpf,'00000000000'));                             
   for ind in reverse 1..9 loop                                                 
       va_numero := to_number(substr(va_cpf,ind,1));                            
       va_total  := va_total + (va_numero * va_multip); 
       va_multip := va_multip + 1;                                              
   end loop;                            
   if 11-mod(va_total,11) > 9 then                                              
      va_digito1 := 0;                                                          
   else                                                                         
      va_digito1 := 11-mod(va_total,11);                                        
   end if;                              
   va_total := 0;                                                               
   va_multip := 2;                      
   for ind in reverse 1..10 loop                                                
       va_numero := to_number(substr(va_cpf,ind,1));                            
       va_total  := va_total + (va_numero * va_multip);                         
       va_multip := va_multip + 1;                                              
   end loop;                            
   if 11-mod(va_total,11) > 9 then                                              
      va_digito2 := 0;                                                          
   else                                                                         
      va_digito2 := 11-mod(va_total,11);                                        
   end if;                                                                      
   if va_digito1 = to_number(substr(va_cpf,10,1)) and                           
      va_digito2 = to_number(substr(va_cpf,11,1)) then                          
      return TRUE;                                                              
   else                                                                         
      return FALSE;                                                             
   end if;                                                                      
END;                                                                            
/

create public synonym fun_valida_cpf for fun_valida_cpf
/

grant all on fun_valida_cpf to linepack_role
/