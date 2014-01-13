CREATE OR REPLACE FUNCTION fun_valida_cgc(wnumero in number)                                      
                    RETURN boolean  IS                                          
    BEGIN                                                                       
    /*                                                                          
       Este Procedimento e usado para verificacao de CGC sendo baseado          
       na funcao de Modulo Onze Com dois digitos.                               
       Para se Chamar o Procedimento envia-se o numero e obtem-se como          
       retorno o numero enviado + seus digitos verificadores                    
    */                                                                          
    declare                                                                     
      wmultiplicador number(1) :=2;                                             
      wsoma          number(5) :=0;                                             
      wresto         number(2);                                                 
      wguarda        number(20):= wnumero;                                      
      wnumero2       number(20):= wnumero;                                      
      NUMERO_NULO      exception;                                               
    begin                                                                       
      if wnumero IS NULL then                                                   
         raise NUMERO_NULO;                                                     
      end if;                                                                   
      if length(to_char(wnumero)) <= 2 then                                     
           return false;                                                        
      end if;                                                                   
      wnumero2:= to_number(substr(to_char(wnumero),1,length(to_char(wnumero))-2));                                                                                
      wguarda:= wnumero2;                                                       
      /* Duas Passagens para Dois Digitos */                                    
      for i in 1..2 loop                                                        
        /*varre Sequencialmente da direita para esquerda                        
         multiplicando o numero pelo multiplicador correspondente               
         e guardando numa soma total*/                                          
       for tam in reverse 1..length(to_char(wnumero2)) loop                     
           wsoma:= wsoma + to_number(substr(to_char(wnumero2),tam,1))*wmultiplicador;                                                                                
           /*define o Maximo para o Multip.*/                                   
           if wmultiplicador = 9 then                                           
              wmultiplicador := 2;                                              
           else                                                                 
              wmultiplicador := wmultiplicador + 1;                             
           end if;                                                              
       end loop;                                                                
       /*calcula o resto da divisao por onze*/                                  
       wresto := mod(wsoma,11);                                                 
       /* Define Resultado Final Para o Digito*/                                
       if  11-wresto > 9  then                                                  
           wnumero2 := 0;                                                       
       else                                                                     
           wnumero2 := 11-wresto;                                               
       end if;                                                                  
       /* reatualiza o numero colocando o 1o digito verificador para            
         2a passagem e otencao do 2o digito. */                                 
         wnumero2 := to_number(to_char(wguarda)||to_char(wnumero2));            
       /* Guarda o numero atualizado ,reseta multiplicador e a soma para        
         2a passagem e otencao do 2o digito. */                                 
       wguarda := wnumero2;                                                     
       wmultiplicador:= 2;                                                      
       wsoma:=0;                                                                
    end loop;                                                                   
    if wguarda <> wnumero then                                                  
       return false;                                                            
    else                                                                        
       return true;                                                             
    end if;                                                                     
   exception                                                                    
     When NUMERO_NULO then null;                                                
   end;                                                                         
  END;                                                                          
/

create public synonym fun_valida_cgc for fun_valida_cgc
/

grant all on fun_valida_cgc to linepack_role
/