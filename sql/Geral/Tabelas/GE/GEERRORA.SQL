-- Create table
create table GEERRORA
(
  CD_ERRO   VARCHAR2(8) not null,
  DS_ERRO   VARCHAR2(200) not null,
  CA_ERRO   VARCHAR2(200) not null,
  AC_ERRO   VARCHAR2(200) not null,
  NM_USUINC VARCHAR2(30) not null,
  DT_USUINC DATE not null,
  NM_USUALT VARCHAR2(30),
  DT_USUALT DATE
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
-- Create/Recreate primary, unique and foreign key constraints 
alter table GEERRORA
  add constraint PK_GEERRORA primary key (CD_ERRO)
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


create public synonym geerrora for geerroa;

grant all on geerrora to linepack_role;