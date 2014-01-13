create table ftpagven(
  cd_fil           number(2),
  nr_venda         number(6),
  cd_condicao      number(4),
  nr_parc          number(3),
  dt_venc          date not null,
  vl_venc          number(12,2) not null,
  nm_usuinc        varchar2(30) not null,
  dt_usuinc        date not null,
  nm_usualt        varchar2(30),
  dt_usualt        date
)
/

alter table ftpagven
 add (constraint FK_FTPAGVEN_GEPAGCON foreign key (cd_condicao, nr_parc) references gepagcon(cd_condicao, nr_parc))
 add (constraint FK_FTPAGVEN_FTMESVEN foreign key (cd_fil, nr_venda) references ftmesven(cd_fil, nr_venda))
/

create index FK_FTPAGVEN_GEPAGCON_ix on ftpagven(cd_condicao, nr_parc)
 tablespace indices_tablespace
/

create index FK_FTPAGVEN_FTMESVEN_ix on ftpagven(cd_fil, nr_venda)
 tablespace indices_tablespace
/

alter table ftpagven
  add constraint PK_FTPAGVEN primary key (cd_fil, nr_venda, cd_condicao, nr_parc)
/

create public synonym ftpagven for ftpagven
/

grant all on ftpagven to linepack_role
/

