-- Create table
create table GEMENU
(
  CD_MENU      VARCHAR2(20) not null,
  NR_ORDEM     NUMBER(3) not null,
  NM_MENU      VARCHAR2(60) not null,
  NR_SEQ       VARCHAR2(30) not null,
  NM_USUINC    VARCHAR2(30) not null,
  DT_USUINC    DATE not null,
  CD_MENU_PAI  VARCHAR2(20),
  CD_APLICACAO VARCHAR2(8),
  NM_USUALT    VARCHAR2(30),
  DT_USUALT    DATE
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
comment on column GEMENU.CD_MENU
  is 'C�digo do menu';
comment on column GEMENU.NR_ORDEM
  is 'N�mero da ordem do menu';
comment on column GEMENU.NM_MENU
  is 'Nome do menu';
comment on column GEMENU.NR_SEQ
  is 'N�mero da Sequ�ncia';
comment on column GEMENU.NM_USUINC
  is 'Nome do usuario de inclusao';
comment on column GEMENU.DT_USUINC
  is 'Data de Inclusao';
comment on column GEMENU.CD_MENU_PAI
  is 'C�digo do menu';
comment on column GEMENU.CD_APLICACAO
  is 'C�digo da aplica��o';
comment on column GEMENU.NM_USUALT
  is 'Nome do usuario de alteracao';
comment on column GEMENU.DT_USUALT
  is 'Data de alteracao';


alter table gemenu
 add constraints PK_GEMENU primary key (CD_MENU)
/

alter table gemenu
 add constraints FK_GEMENUPAI_GEMENU foreign key (CD_MENU_PAI)
  REFERENCES gemenu (cd_menu)
/

create index FK_GEMENUPAI_GEMENU_ix ON gemenu(cd_menu_pai)
/

-- Create/Recreate primary, unique and foreign key constraints 
alter table GEMENU
  add constraint FK_GEMENU_GEAPLICACAO foreign key (CD_APLICACAO)
  references GEAPLICA (CD_APLICACAO);
-- Create/Recreate indexes 
create index FK_GEMENU_GEAPLICACAO_IX on GEMENU (CD_APLICACAO)
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


create public synonym gemenu for gemenu;

grant all on gemenu to linepack_role;
