alter table ftiteven
 add st_cancelado  char(1)
/

alter table ftiteven
  add constraint CK_FTITEVEN_ST_CANCELADO check (st_cancelado in ('S','N'))
/

