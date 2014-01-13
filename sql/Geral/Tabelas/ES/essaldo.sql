create table ESSALDO(
 CD_FIL      NUMBER(2),
 CD_DEP      NUMBER(2),
 CD_ITEM     NUMBER(6),
 DT_SALDO    DATE,
 QT_SALDO    NUMBER(14,4) NOT NULL,
 QT_ENTRADA  NUMBER(14,4),
 QT_SAIDA    NUMBER(14,4),
 DT_USUINC     DATE NOT NULL,
 NM_USUINC     VARCHAR2(30) NOT NULL,
 DT_USUALT     DATE,
 NM_USUALT     VARCHAR2(30)
)
/

alter table essaldo
 add (constraint pk_essaldo primary key (cd_fil, cd_dep, cd_item, dt_saldo))
/

create public synonym ESSALDO for ESSALDO
/

grant all on essaldo to linepack_role
/