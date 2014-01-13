create table ftmesven(
 cd_fil               number(2),
 nr_venda             number(6),
 dt_venda             date not null,
 cd_pessoa_cliente    number(6),
 cd_pessoa_vendedor   number(6),
 nm_usuinc            varchar2(30) not null,
 dt_usuinc            date not null,
 nm_usualt            varchar2(30),
 dt_usualt            date
)
/

alter table ftmesven
 add (constraint FK_FTMESVEN_GEPESSOA_CLI foreign key (cd_pessoa_cliente) references gepessoa(cd_pessoa))
 add (constraint FK_FTMESVEN_GEPESSOA_VEN foreign key (cd_pessoa_vendedor) references gepessoa(cd_pessoa))
/

create index FK_FTMESVEN_GEPESSOA_CLI_ix on ftmesven(cd_pessoa_cliente)
 tablespace indices_tablespace
/

create index FK_FTMESVEN_GEPESSOA_VEN_ix on ftmesven(cd_pessoa_vendedor)
 tablespace indices_tablespace
/ 

alter table ftmesven
 add constraint PK_FTMESVEN primary key (cd_fil, nr_venda)
/

create public synonym ftmesven for ftmesven
/

grant all on ftmesven to linepack_role
/
 