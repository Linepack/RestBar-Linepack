create table ESUNIMED(
 cd_unimed varchar2(3),
 ds_unimed varchar2(30) not null
)
/

ALTER TABLE ESUNIMED
 ADD (NM_USUINC  VARCHAR2(30) NOT NULL)
ADD (DT_USUINC  DATE NOT NULL)
 ADD (NM_USUALT  VARCHAR2(30))
 ADD (DT_USUALT  DATE)
/

alter table ESUNIMED
 add constraint PK_ESUNIMED primary key (cd_unimed)
/

comment on column ESUNIMED.cd_unimed is 'Código da Unidade de Medida, exemplo UN, KG';
comment on column ESUNIMED.ds_unimed is 'Descrição da Unidade de Medida';

create public synonym ESUNIMED for ESUNIMED
/

grant all on ESUNIMED to linepack_role
/
  