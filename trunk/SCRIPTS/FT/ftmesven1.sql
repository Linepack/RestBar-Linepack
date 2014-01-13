alter table ftmesven
  add st_venda   char(1);

alter table ftmesven 
  add constraint ck_ftmesven_st check (st_venda in ('A','P','C'));
  
comment on column ftmesven.st_venda is 'A = ABERTO, P = PAGO, C = CANCELADO';

alter table ftiteven
  add st_item_venda  char(1);
  
alter table ftiteven
  add constraint ck_ftiteven_st check (st_item_venda in ('A','P','C'));
  
comment on column ftiteven.st_item_venda is 'A = ABERTO, P = PAGO, C = CANCELADO';

update ftmesven
   set st_venda = 'A';

COMMIT;     

insert into geiteblk values
                    ('FTF00001','BLK01',
                    'ST_VENDA','SITUAÇÃO DA VENDA (ABERTO, PAGO E CANCELADO)',
                    'S','S',
                    'S','S',
                    user,
                    sysdate,
                    null,
                    null); 
                                                            
commit;                    

update ftiteven  
   set st_item_venda  = 'A';
   
commit;

insert into geiteblk values
                    ('FTF00001','BLK02',
                    'ST_ITEM_VENDA','SITUAÇÃO DO ITEM DA VENDA (ABERTO, PAGO E CANCELADO)',
                    'S','S',
                    'S','S',
                    user,
                    sysdate,
                    null,
                    null); 
       
COMMIT;
