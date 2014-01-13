create table GERECEIT(
  cd_pessoa_medico number(6),
  cd_pessoa_paciente number(6),
  sq_receita number(6),
  ds_receita varchar2(4000) not null
);

alter table gereceit
  add (nm_usuinc varchar2(30) not null)
  add (dt_usuinc date not null)
  add (nm_usualt varchar2(30))
  add (dt_usualt date);

alter table gereceit 
  add constraint fk_gereceit_gepessoa_med foreign key (cd_pessoa_medico)
      references gepessoa(cd_pessoa);
      
create index fk_gereceit_gepessoa_med_ix on gereceit(cd_pessoa_medico)
  tablespace indices_tablespace;
  
alter table gereceit
  add constraint fk_gereceit_gepessoa_pac foreign key (cd_pessoa_paciente)
      references gepessoa(cd_pessoa);
      
create index fk_gereceit_gepessoa_pac_ix on gereceit(cd_pessoa_paciente)
  tablespace indices_tablespace;
  
alter table gereceit
  add constraint PK_GERECEIT primary key (cd_pessoa_medico, cd_pessoa_paciente, sq_receita);
  
create public synonym gereceit for gereceit;

grant all on gereceit to linepack_role;
