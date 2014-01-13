create table geblkapl(
 cd_aplicacao        varchar2(8),
 nm_bloco	varchar2(8),
 ds_bloco	varchar2(30) not null,
 st_inclusao	char(1),
 st_alteracao	char(1),
 st_exclusao	char(1)
)
/

ALTER TABLE GEBLKAPL
 ADD (NM_USUINC  VARCHAR2(30) NOT NULL)
ADD (DT_USUINC  DATE NOT NULL)
 ADD (NM_USUALT  VARCHAR2(30))
 ADD (DT_USUALT  DATE)
/

alter table geblkapl
 add constraint FK_GEBLKAPL_GEAPLICA foreign key (cd_aplicacao)
        references geaplica(cd_aplicacao)
/

create index FK_GEBLKAPL_GEAPLICA_IX on GEBLKAPL(CD_aplicacao)
  tablespace indices_tablespace
/

alter table geblkapl
 add constraint PK_GEBLKAPL primary key (cd_aplicacao, nm_bloco)
/

alter table geblkapl
 add constraint CK_GEBLKAPL_ST_INCLUSAO check (st_inclusao in ('S','N','F'))
/

alter table geblkapl
 add constraint CK_GEBLKAPL_ST_ALTERACAO check (st_alteracao in ('S','N','F'))
/

alter table geblkapl
 add constraint CK_GEBLKAPL_ST_EXCLUSAO check (st_exclusao in ('S','N','F'))
/

comment on column geblkapl.nm_bloco is 'Nome do Bloco contido na Aplicação';
comment on column geblkapl.ds_bloco is 'Descrição do Bloco contido na Aplicação';
comment on column geblkapl.st_inclusao is 'Sim, Não ou Não Definido';
comment on column geblkapl.st_alteracao is 'Sim, Não ou Não Definido';
comment on column geblkapl.st_exclusao is 'Sim, Não ou Não Definido';

create public synonym geblkapl for geblkapl
/

grant all on geblkapl to linepack_role
/
