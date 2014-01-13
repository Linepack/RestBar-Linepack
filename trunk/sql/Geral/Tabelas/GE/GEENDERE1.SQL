alter table geendere
 add cd_fil number(2)
/

alter table geendere 
 add constraint FK_GEENDERE_GEFILIAL_CD_FIL foreign key (cd_fil)
 references GEFILIAL(CD_FIL)
/

create index FK_GEENDERE_GEFILIAL_CD_FIL_ix on geendere(cd_fil)
 tablespace indices_tablespace
/