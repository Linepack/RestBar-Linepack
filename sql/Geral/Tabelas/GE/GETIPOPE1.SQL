alter table getipope
 add tp_pessoa char(1)
/

comment on column getipope.tp_pessoa is 'Física, Jurídica, Ambos ou Outros';

alter table getipope
 add constraint CK_GETIPOPE_TP_PESSOA check (tp_pessoa in ('F','J','O','A'))
/

update getipope
     set tp_pessoa = 'A'
/

COMMIT
/

ALTER TABLE GETIPOPE
 MODIFY TP_PESSOA NOT NULL
/