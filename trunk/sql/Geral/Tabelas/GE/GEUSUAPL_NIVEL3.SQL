create table geusuapl_nivel3(
 cd_usuario                  number(6),
 cd_aplicacao                varchar2(8),
 nm_bloco                    varchar2(8),
 nm_item                     varchar2(30),
 st_inclusao                 char(1),
 st_alteracao                char(1),
 st_exclusao                 char(1),
 st_visivel                  char(1)
)
/

alter table geusuapl_nivel3
 add (nm_usuinc varchar2(30) not null)
 add (dt_usuinc date not null)
 add (nm_usualt varchar2(30))
 add (dt_usualt date)
/

alter table geusuapl_nivel3
  add constraint FK_NIVEL3_GEUSUAPL foreign key (cd_usuario, cd_aplicacao, nm_bloco)
      references geusuapl_nivel2(cd_usuario, cd_aplicacao, nm_bloco)
/

create index FK_NIVEL3_GEUSUAPL on geusuapl_nivel3(cd_usuario, cd_aplicacao, nm_bloco)
 tablespace indices_tablespace
/

alter table geusuapl_nivel3
  add constraint PK_GEUSUAPL_NIVEL3 primary key (cd_usuario, cd_aplicacao, nm_bloco, nm_item)
/

alter table geusuapl_nivel3 
  add constraint CK_NIVEL3_ST_INCLUSAO3 check (st_inclusao in ('S','N'))
/



alter table geusuapl_nivel3 
  add constraint CK_NIVEL3_ST_ALTERACAO3 check (st_alteracao in ('S','N'))
/

alter table geusuapl_nivel3
  add constraint CK_NIVEL3_ST_EXCLUSAO3 check (st_exclusao in ('S','N'))
/

alter table geusuapl_nivel3
  add constraint CK_NIVEL3_ST_VISIVEL check (st_visivel in ('S','N'))
/

comment on column geusuapl_nivel3.nm_item is 'Nome do item contido no bloco';
comment on column geusuapl_nivel3.st_inclusao is 'Sim ou Não';
comment on column geusuapl_nivel3.st_alteracao is 'Sim ou Não';
comment on column geusuapl_nivel3.st_exclusao is 'Sim ou Não';

create public synonym geusuapl_nivel3 for geusuapl_nivel3
/

grant all on geusuapl_nivel3 to linepack_role
/

  
 
 
