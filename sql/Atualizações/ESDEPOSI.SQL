alter table esdeposi
 add st_padrao_vendas  char(1)
/

alter table esdeposi
 add constraint CK_ESDEPOSI_ST_PADRAO check (st_padrao_vendas in ('S','N'))
/

update esdeposi
 set st_padrao_vendas = 'S' 
/

COMMIT
/