alter table geparame
  add st_venda_saldo_zero   char(1)
/

alter table geparame
  add constraint CK_GEPARAME_ST_VENDA_SALDO check (st_venda_saldo_zero in ('S','N'))
/

update geparame
  set st_venda_saldo_zero   = 'S'
/

COMMIT
/
