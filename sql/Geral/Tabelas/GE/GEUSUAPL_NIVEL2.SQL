create table geusuapl_nivel2(
 cd_usuario                  number(6),
 cd_aplicacao                varchar2(8),
 nm_bloco                    varchar2(8),
 st_inclusao                 char(1),
 st_alteracao                char(1),
 st_exclusao                 char(1)
 );
 
 alter table geusuapl_nivel2
  add (nm_usuinc varchar2(30) not null)
  add (dt_usuinc date)
  add (nm_usualt varchar2(30))
  add (dt_usualt date)
/

alter table geusuapl_nivel2
  add constraint FK_NIVEL2_GEUSUAPL foreign key (cd_aplicacao, cd_usuario)
      references geusuapl(cd_aplicacao, cd_usuario)
/

create index FK_NIVEL2_GEUSUAPL_ix on geusuapl_nivel2(cd_aplicacao,cd_usuario)
 tablespace indices_tablespace
/ 

alter table geusuapl_nivel2
 add constraint PK_GEUSUAPL_NIVEL2 primary key (cd_aplicacao, cd_usuario, nm_bloco)
/

alter table geusuapl_nivel2
 add constraint CK_NINEL2_ST_INCLUSAO check (st_inclusao in ('S','N','F'))
/

alter table geusuapl_nivel2
 add constraint CK_NINEL2_ST_ALTERACAO check (st_alteracao in ('S','N','F'))
/

alter table geusuapl_nivel2
 add constraint CK_NINEL2_ST_EXCLUSAO check (st_exclusao in ('S','N','F'))
/

comment on column geusuapl_nivel2.nm_bloco is 'Nome do Bloco contido na Aplicação';
comment on column geusuapl_nivel2.st_inclusao is 'Sim, Não ou Não Definido';
comment on column geusuapl_nivel2.st_alteracao is 'Sim, Não ou Não Definido';
comment on column geusuapl_nivel2.st_exclusao is 'Sim, Não ou Não Definido';

create public synonym geusuapl_nivel2 for geusuapl_nivel2
/

grant all on geusuapl_nivel2 to linepack_role
/