-- Create table
create table GEFILIAL
(
  CD_FIL               NUMBER(2) not null,
  NM_RAZAO             VARCHAR2(40) not null,
  NM_FANTASIA          VARCHAR2(40) not null,
  NR_CGC               NUMBER(15) not null,
  NR_INSC_EST          VARCHAR2(20) not null,
  NM_USUINC            VARCHAR2(30) not null,
  DT_USUINC            DATE not null,
  NM_USUALT            VARCHAR2(30),
  DT_USUALT            DATE,
  ST_MICRO_EMPRESA     CHAR(1),
  NR_INSC_MUNICIPAL    VARCHAR2(15) not null
)
tablespace DADOS_TABLESPACE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
-- Add comments to the columns 
comment on column GEFILIAL.CD_FIL
  is 'Código da filial';
comment on column GEFILIAL.NM_RAZAO
  is 'Rrazão social da empresa';
comment on column GEFILIAL.NM_FANTASIA
  is 'Nome fantasia';
comment on column GEFILIAL.NR_CGC
  is 'Número do CGC';
comment on column GEFILIAL.NR_INSC_EST
  is 'Inscrição Estadual';
comment on column GEFILIAL.NM_USUINC
  is 'Nome do usuário de inclusão';
comment on column GEFILIAL.DT_USUINC
  is 'Data de inclusão';
comment on column GEFILIAL.CD_FIL_MATRIZ
  is 'Código da filial';
comment on column GEFILIAL.NM_USUALT
  is 'Nome do usuário de alteração';
comment on column GEFILIAL.DT_USUALT
  is 'Data de alteração';
comment on column GEFILIAL.NM_CONTATO
  is 'Nome da pessoa contato da filial';
comment on column GEFILIAL.NM_REPRESENTANTE
  is 'Nome da pessoa representante legal da filial';
comment on column GEFILIAL.DS_EMAIL
  is 'Email da filial';
-- Create/Recreate primary, unique and foreign key constraints 
alter table GEFILIAL
  add constraint PK_GEFILIAL primary key (CD_FIL)
  using index 
  tablespace INDICES_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table GEFILIAL
  add constraint FK_GEFILIAL_GEFILIAL foreign key (CD_FIL_MATRIZ)
  references GEFILIAL (CD_FIL);
-- Create/Recreate indexes 
create index FK_GEFILIAL_GEFILIAL_IX on GEFILIAL (CD_FIL_MATRIZ)
  tablespace INDICES_TABLESPACE
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 64K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

create public synonym gefilial for gefilial;

grant all on gefilial to linepack_role;