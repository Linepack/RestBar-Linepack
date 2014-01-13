create table geagenda(
   sq_agenda      number(6),
   cd_pessoa_cli  number(6),
   dt_usuinc	  date not null,
   nm_usuinc	  varchar2(30) not null,
   dt_usualt	  date,
   nm_usualt	  varchar2(30));

alter table geagenda
  add constraint pk_geagenda primary key (sq_agenda);

alter table geagenda
  add constraint fk_geagenda_gepessoa foreign key (cd_pessoa_cli)
      references gepessoa(cd_pessoa);

create index fk_geagenda_gepessoa_ix on geagenda(cd_pessoa_cli)
  tablespace indices_tablespace;

create public synonym geagenda for geagenda;

grant all on geagenda to linepack_role;