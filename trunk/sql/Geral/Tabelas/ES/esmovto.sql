create table ESMOVTO(
 SQ_MOVTO      NUMBER(10),
 CD_FIL        NUMBER(2) NOT NULL,
 CD_DEP        NUMBER(2) NOT NULL,
 CD_ITEM       NUMBER(5) NOT NULL,
 DT_MOVTO      DATE NOT NULL,
 TP_MOVTO      CHAR(1) NOT NULL,
 QT_MOVTO      NUMBER(14,4) NOT NULL,
 DT_USUINC     DATE NOT NULL,
 NM_USUINC     VARCHAR2(30) NOT NULL,
 DT_USUALT     DATE,
 NM_USUALT     VARCHAR2(30)
)
/

alter table esmovto
 add (constraint PK_ESMOVTO primary key (sq_movto))
 add (constraint CK_ESMOVTO_TP check (tp_movto in ('E','S')))
 add (constraint FK_ESMOVTO_ESDEPITE foreign key (cd_fil, cd_dep, cd_item) references esdepite(cd_fil, cd_dep, cd_item))
/

Create public synonym ESMOVTO for ESMOVTO
/

grant all on esmovto to linepack_role
/
 