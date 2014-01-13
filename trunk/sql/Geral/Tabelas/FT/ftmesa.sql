create table ftmesa(
   sq_mesa      number(6),
   nr_mesa      number(6),
   ds_nome      varchar2(100),
   dt_hr_mesa   date,
   st_mesa      char(1));

alter table ftmesa
  add constraint pk_ftmesa primary key (sq_mesa)
      using index tablespace indices_tablespace;

create public synonym ftmesa for ftmesa;

grant all on ftmesa to linepack_role;
   
create table ftitemes(
   sq_mesa   number(6),
   sq_item   number(4),
   cd_item   number(6),
   vl_unitario number(12,2),
   qt_item     number(14,4),
   st_pedido   char(1),
   dt_hr_pedido date,
   dt_hr_update date);   
   
alter table ftitemes 
  add constraint fk_ftitemes_ftmesa foreign key (sq_mesa)
      references ftmesa;   

create index fk_ftitemes_ftmesa_ix on ftitemes(sq_mesa)
  tablespace indices_tablespace;
  
alter table ftitemes 
  add constraint fk_ftitemes_esitemes foreign key (cd_item)
      references  esitemes;
      
create index fk_ftitemes_esitemes_ix on ftitemes(cd_item)
  tablespace indices_tablespace;
  
alter table ftitemes
  add constraint pk_ftitemes primary key (sq_mesa,sq_item)
      using index tablespace indices_tablespace;
      
create public synonym ftitemes for ftitemes;

grant all on ftitemes to linepack_role;                  
   
create table ftpagmes(
   sq_Mesa    number(6),
   sq_pagamento number(4),
   sq_item      number(4),
   ds_nome      varchar2(100),
   vl_pago      number(12,2),
   vl_desconto  number(12,2));
   
alter table ftpagmes
  add constraint fk_ftpagmes_ftmesa foreign key (sq_mesa)
      references ftmesa;
      
create index fk_ftpagmes_ftmesa_ix on ftpagmes(sq_mesa)
   tablespace indices_tablespace;
   
alter table ftpagmes
  add constraint pk_ftpagmes primary key (sq_mesa, sq_pagamento)
      using index tablespace indices_tablespace;

create public synonym ftpagmes for ftpagmes;

grant all on ftpagmes to linepack_role;      
         
     
     
