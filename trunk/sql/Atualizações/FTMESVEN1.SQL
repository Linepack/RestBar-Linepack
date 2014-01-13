alter table ftmesven
 add st_cancelado  char(1)
/

alter table ftmesven
  add constraint CK_ftmesven_ST_CANCELADO check (st_cancelado in ('S','N'))
/

