create table ESTIPITE(
 cd_tipo  number(2),
 ds_tipo  varchar2(30) not null,
 tp_tipo  char(1) not null
)
/

ALTER TABLE ESTIPITE
 ADD (NM_USUINC  VARCHAR2(30) NOT NULL)
 ADD (DT_USUINC  DATE NOT NULL)
 ADD (NM_USUALT  VARCHAR2(30))
 ADD (DT_USUALT  DATE)
/

alter table estipite
 add constraint CK_ESTIPITE_TP_TIPO check (tp_tipo in ('E','S','A'))
/

alter table estipite
 add constraint PK_ESTIPITE primary key (cd_tipo)
/

comment on column ESTIPITE.cd_tipo is 'Código do tipo do item';
comment on column ESTIPITE.ds_tipo is 'Descrição do tipo de item';
comment on column ESTIPITE.tp_tipo is 'Entrada, Saída ou Todos(All)';

create public synonym ESTIPITE for ESTIPITE
/

grant all on ESTIPITE to linepack_role
/