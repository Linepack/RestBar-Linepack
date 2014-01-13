create or replace trigger TRG_ALIMENTA_ESSALDO
before insert on esmovto
for each row
declare
 va_existe_essaldo            number(1);
 va_qt_saldo_anterior         essaldo.qt_saldo%type;
 va_dt_saldo_maxima           essaldo.dt_saldo%type;
begin  
  
  if sign(:new.qt_movto) = -1 then
     raise_application_error(-20006, 'Não se pode movimentar saldo Negativo');
  end if;
  
  -- verifica se o movimento está ocorrendo com data retroativa, a última data --
  begin
    select max(dt_saldo)
      into va_dt_saldo_maxima 
      from essaldo
     where cd_fil  = :new.cd_fil
       and cd_dep  = :new.cd_dep
       and cd_item = :new.cd_item;
  exception
    when others then
       raise_application_error(-20007,'Erro consultando ESSALDO'||chr(13)||sqlerrm);
  end;     
  
  if va_dt_saldo_maxima > :new.dt_movto then
     raise_application_error(-20008,'Não é possível movimentar saldo de datas anteriores à '||va_dt_saldo_maxima);
  end if;     

  -- Primeiro seleciona o saldo anterior -- 
  begin
    select qt_saldo
      into va_qt_saldo_anterior
      from essaldo
     where cd_fil   = :new.cd_fil
       and cd_dep   = :new.cd_dep
       and cd_item  = :new.cd_item
       and dt_saldo = va_dt_saldo_maxima;
   exception
     when no_data_found then
        va_qt_saldo_anterior := 0;
     when others then
        raise_application_Error(-20005, 'Erro consultando ESSALDO'||chr(13)||sqlerrm);
   end;  
    

  -- Verifica se já existe registro em ESSALDO para este MOVTO --
  begin
    select count(*)
      into va_existe_essaldo
      from essaldo
     where cd_fil   = :new.cd_fil
       and cd_dep   = :new.cd_dep
       and cd_item  = :new.cd_item
       and dt_saldo = :new.dt_movto;
  exception
    when others then
       raise_application_Error(-20000, 'Erro consultando ESSALDO'||chr(13)||sqlerrm);     
  end;
    
  if va_existe_essaldo > 0 then
    
    if :new.tp_movto = 'E' then
      
      begin
        update essaldo
           set qt_saldo   = qt_saldo + :new.qt_movto,
               qt_entrada = qt_entrada + :new.qt_movto
         where cd_fil   = :new.cd_fil
           and cd_dep   = :new.cd_dep
           and cd_item  = :new.cd_item
           and dt_saldo = :new.dt_movto;
      exception
        when others then
           raise_application_Error(-20001, 'Erro atualizando ESSALDO'||chr(13)||sqlerrm);
      end;
    
    else --if :new.tp_movto = 'E' then
      
      if sign(va_qt_saldo_anterior - :new.qt_movto) = -1 then
         raise_application_error(-20006, 'Não se pode movimentar saldo Negativo');
      end if;
    
      begin
        update essaldo
           set qt_saldo   = qt_saldo - :new.qt_movto,
               qt_saida   = qt_saida + :new.qt_movto
         where cd_fil   = :new.cd_fil
           and cd_dep   = :new.cd_dep
           and cd_item  = :new.cd_item
           and dt_saldo = :new.dt_movto;
      exception
        when others then
           raise_application_Error(-20002, 'Erro atualizando ESSALDO'||chr(13)||sqlerrm);
      end;

    end if; --if :new.tp_movto = 'E' then
      
  
  else --if va_existe_essaldo > 0 then
    
    if :new.tp_movto = 'E' then
      
      begin
        insert into essaldo(cd_fil,              cd_dep,
                            cd_item,             dt_saldo,
                            qt_saldo,
                            qt_entrada,
                            qt_saida,            dt_usuinc,
                            nm_usuinc,           dt_usualt,
                            nm_usualt)
                     values(:new.cd_fil,         :new.cd_dep,
                            :new.cd_item,        :new.dt_movto,
                            nvl(va_qt_saldo_anterior,0) + :new.qt_movto,
                            :new.qt_movto,
                            0,                   sysdate,
                            user,                null,
                            null);
      exception
        when others then
            raise_application_Error(-20003, 'Erro inserindo ESSALDO'||chr(13)||sqlerrm);
      end;      
           
   else -- if :new.tp_movto = 'E' then
     
      if sign(va_qt_saldo_anterior - :new.qt_movto) = -1 then
         raise_application_error(-20006, 'Não se pode movimentar saldo Negativo');
      end if;
     
      begin
        insert into essaldo(cd_fil,              cd_dep,
                            cd_item,             dt_saldo,
                            qt_saldo,            
                            qt_entrada,
                            qt_saida,            dt_usuinc,
                            nm_usuinc,           dt_usualt,
                            nm_usualt)
                     values(:new.cd_fil,         :new.cd_dep,
                            :new.cd_item,        :new.dt_movto,
                            abs(nvl(va_qt_saldo_anterior,0) - :new.qt_movto),
                            0,
                            :new.qt_movto,       sysdate,
                            user,                null,
                            null);
      exception
        when others then
            raise_application_Error(-20004, 'Erro inserindo ESSALDO'||chr(13)||sqlerrm);
      end;                                    
                            
    end if; --if :new.tp_movto = 'E' then
      
  end if; --if va_existe_essaldo > 0 then
 
end trg_alimenta_essaldo;
/
