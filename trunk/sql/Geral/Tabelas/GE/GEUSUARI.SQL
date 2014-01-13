-- Create table
create table GEUSUARI
(
  CD_USUARIO           NUMBER(6) not null,
  NM_USUARIO           VARCHAR2(40) not null,
  DS_LOGIN             VARCHAR2(30) not null,
  ST_USUARIO           VARCHAR2(1) not null,
  NM_INICIAL           VARCHAR2(6) ,
  DS_EMAIL             VARCHAR2(200),
  NR_DDD               NUMBER(2) ,
  NR_TELEFONE          NUMBER(8) ,
  ST_TROCA_FILIAL      VARCHAR2(1) ,
  ST_MOSTRA_APLICACAO  VARCHAR2(1) ,
  ST_PERMISSAO_MENU    VARCHAR2(1),
  NM_USUINC            VARCHAR2(30) not null,
  DT_USUINC            DATE not null,
  DS_ACESSO            VARCHAR2(30),
  CD_USUARIO_PAI       NUMBER(6),
  NM_USUALT            VARCHAR2(30),
  DT_USUALT            DATE
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
comment on column GEUSUARI.CD_USUARIO
  is 'Código do usuário';
comment on column GEUSUARI.NM_USUARIO
  is 'Nome do usuário';
comment on column GEUSUARI.DS_LOGIN
  is 'Nome do login';
comment on column GEUSUARI.ST_USUARIO
  is 'Domínio para o status do usuário do sistema';
comment on column GEUSUARI.ST_ATUALIZA_HELP
  is 'Domínio para os valores Sim ou Não';
comment on column GEUSUARI.NM_INICIAL
  is 'Iniciais do nome do usuário';
comment on column GEUSUARI.DS_EMAIL
  is 'E-mail do usuário';
comment on column GEUSUARI.NR_DDD
  is 'DDD do usuário';
comment on column GEUSUARI.NR_TELEFONE
  is 'Número do telefone do usuário';
comment on column GEUSUARI.QT_ULT_ACESSOS
  is 'Quantidade de itens de menu que estará nos últimos acessos';
comment on column GEUSUARI.ST_EXPIRA_SENHA
  is 'Domínio para os valores Sim ou Não';
comment on column GEUSUARI.ST_TROCA_FILIAL
  is 'Domínio para os valores Sim ou Não';
comment on column GEUSUARI.ST_MOSTRA_APLICACAO
  is 'Domínio para os valores Sim ou Não';
comment on column GEUSUARI.ST_PERMISSAO_MENU
  is 'Define se o usuário pode alterar as permissões do menu';
comment on column GEUSUARI.ST_LIBERA_MENU_TOTAL
  is 'Flag para definir se mostra o menu total para o usuário alterar';
comment on column GEUSUARI.NM_USUINC
  is 'Nome do usuário de inclusão';
comment on column GEUSUARI.DT_USUINC
  is 'Data de inclusão';
comment on column GEUSUARI.DS_SENHA_WEB
  is 'Descrição da senha para visualizar a senha da web';
comment on column GEUSUARI.DT_EXPIRACAO_SENHA
  is 'Data de expiração da senha';
comment on column GEUSUARI.DS_ACESSO
  is 'Senha do usuário';
comment on column GEUSUARI.CD_MATRICULA_FOLHA
  is 'Código da matrícula da folha de pgto';
comment on column GEUSUARI.CD_USUARIO_PAI
  is 'Código do usuário';
comment on column GEUSUARI.NM_USUALT
  is 'Nome do usuário de alteração';
comment on column GEUSUARI.DT_USUALT
  is 'Data de alteração';
-- Create/Recreate primary, unique and foreign key constraints 
alter table GEUSUARI
  add constraint PK_GEUSUARI primary key (CD_USUARIO)
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
alter table GEUSUARI
  add constraint FK_GEUSUARIPAI_GEUSUARI_FILHO foreign key (CD_USUARIO_PAI)
  references GEUSUARI (CD_USUARIO);
-- Create/Recreate check constraints 
alter table GEUSUARI
  add constraint CK_GEUSUARI_ST_ATUALIZA_HELP
  check (ST_ATUALIZA_HELP IN ('S', 'N'));
alter table GEUSUARI
  add constraint CK_GEUSUARI_ST_EXPIRA_SENHA
  check (ST_EXPIRA_SENHA IN ('S', 'N'));
alter table GEUSUARI
  add constraint CK_GEUSUARI_ST_LIB_MENU_TOT
  check (ST_LIBERA_MENU_TOTAL IN ('S', 'N'));
alter table GEUSUARI
  add constraint CK_GEUSUARI_ST_MOSTRA_APLIC
  check (ST_MOSTRA_APLICACAO IN ('S', 'N'));
alter table GEUSUARI
  add constraint CK_GEUSUARI_ST_PERMISSAO_MENU
  check (ST_PERMISSAO_MENU IN ('S', 'N'));
alter table GEUSUARI
  add constraint CK_GEUSUARI_ST_TROCA_FILIAL
  check (ST_TROCA_FILIAL IN ('S', 'N'));
alter table GEUSUARI
  add constraint CK_GEUSUARI_ST_USUARIO
  check (ST_USUARIO IN ('A', 'B', 'D'));
-- Create/Recreate indexes 
create index FK_GEUSUARIPAI_GEUSUARI_FILHO_ on GEUSUARI (CD_USUARIO_PAI)
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


create public synonym GEUSUARI for geusuari;

grant all on geusuari to linepack_role;