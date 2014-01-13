alter table geusuari
 add (cd_pessoa_vendedor  number(6))
 add (constraint fk_geusuari_gepessoa_ven FOREIGN KEY (cd_pessoa_vendedor) references gepessoa(cd_pessoa))
/

create index fk_geusuari_gepessoa_ven_ix on geusuari(cd_pessoa_vendedor)
 tablespace indices_tablespace
/

