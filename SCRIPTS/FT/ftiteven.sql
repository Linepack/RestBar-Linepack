create table ftiteven(
 cd_fil         number(2),
 nr_venda       number(6),
 sq_item        number(3),
 cd_item        number(6) not null,
 cd_fil_dep     number(2),
 cd_dep         number(2),
 cd_unimed      varchar2(3) not null,
 qt_item        number(14,4) not null,
 vl_item        number(12,2) not null,
 nm_usuinc      varchar2(30) not null,
 dt_usuinc      date not null,
 nm_usualt      varchar2(30),
 dt_usualt      date
)
/

alter table ftiteven
 add (constraint FK_FTITEVEN_FTMESVEN foreign key (cd_fil, nr_venda) references ftmesven(cd_fil, nr_venda))
 add (constraint FK_FTITEVEN_ESITEMES foreign key (cd_item) references esitemes(cd_item))
 add (constraint FK_FTITEVEN_ESDEPOSI foreign key (cd_fil_dep,cd_dep) references esdeposi(cd_fil, cd_dep))
 add (constraint FK_FTITEVEN_ESUNIMED foreign key (cd_unimed) references esunimed(cd_unimed))
/

create index FK_FTITEVEN_FTMESVEN_ix on ftiteven(cd_fil, nr_venda)
 tablespace indices_tablespace
/

create index FK_FTITEVEN_ESITEMES_ix on ftiteven(cd_item)
 tablespace indices_tablespace
/

create index FK_FTITEVEN_ESDEPOSI_ix on ftiteven(cd_fil_dep, cd_dep)
 tablespace indices_tablespace
/

create index FK_FTITEVEN_ESUNIMED_ix on ftiteven(cd_unimed)
 tablespace indices_tablespace
/

alter table ftiteven
 add constraint PK_FTITEVEN primary key (cd_fil, nr_venda, sq_item)
/

create public synonym ftiteven for ftiteven
/

grant all on ftiteven to linepack_role
/