CREATE TABLE GETIPOPE(
 CD_TP_PESSOA         NUMBER(4),
 NM_TP_PESSOA         VARCHAR2(30) NOT NULL
)
/

ALTER TABLE GETIPOPE
 ADD (NM_USUINC  VARCHAR2(30) NOT NULL)
ADD (DT_USUINC  DATE NOT NULL)
 ADD (NM_USUALT  VARCHAR2(30))
 ADD (DT_USUALT  DATE)
/

ALTER TABLE GETIPOPE
 ADD CONSTRAINT PK_GETIPOPE PRIMARY KEY (CD_TP_PESSOA)
/

comment on column GETIPOPE.cd_tp_pessoa is 'Código do Tipo da Pessoa';
comment on column GETIPOPE.nm_tp_pessoa is 'Nome do Tipo da Pessoa';

create public synonym GETIPOPE for GETIPOPE
/

grant all on GETIPOPE to linepack_role
/