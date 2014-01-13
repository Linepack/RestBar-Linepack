create table GEPESSOA(
 CD_PESSOA   NUMBER(6),
 NM_RAZAO    VARCHAR2(60) NOT NULL,
 NM_FANTASIA VARCHAR2(60) NOT NULL,
 NR_CPF_CGC  NUMBER(20),
 NR_INSC_EST NUMBER(15),
 NR_INSC_MUN NUMBER(15),
 ST_PESSOA   CHAR(1) 
)
/

ALTER TABLE GEPESSOA
 ADD (NM_USUINC  VARCHAR2(30) NOT NULL)
ADD (DT_USUINC  DATE NOT NULL)
 ADD (NM_USUALT  VARCHAR2(30))
 ADD (DT_USUALT  DATE)
/


ALTER TABLE GEPESSOA 
 ADD CONSTRAINT PK_GEPESSOA PRIMARY KEY (CD_PESSOA)
/


ALTER TABLE GEPESSOA
 add constraint CK_GEPESSOA_ST_PESSOA check (st_pessoa in ('A','I','B'))
/

comment on column gepessoa.cd_pessoa is 'Código da Pessoa';
comment on column gepessoa.nm_razao is 'Razão Social';
comment on column gepessoa.nm_fantasia is 'Nome Fantasia';
comment on column gepessoa.nr_cpf_cgc is 'Numero do CPF ou CGC da pessoa';
comment on column gepessoa.nr_insc_est is 'Inscrição Estadual';
comment on column gepessoa.nr_insc_mun is 'Inscrição Municipal';
comment on column gepessoa.st_pessoa is 'Ativo, Inativo ou Bloqueado';

create public synonym gepessoa for gepessoa
/

grant all on gepessoa to linepack_role
/