create or replace trigger TRG_SQ_ESMOVTO
before insert or update on ESMOVTO
for each row
declare

begin
  if inserting then
      -- SELECIONA SEQUENCIA --
      begin
        select sq_esmovto.nextval
          into :new.sq_movto
          from dual;
      exception
        when others then
          raise_application_error(-20000, 'Erro inserindo SQ_ESMOVTO'||CHR(13)||sqlerrm);
      end;    
      -- USUINC -- 
      :new.dt_usuinc := sysdate;
      :new.nm_usuinc := user;
  elsif updating then
      -- USUALT -- 
      :new.dt_usualt := sysdate;
      :new.nm_usualt := user;  
  end if;
end;
/
