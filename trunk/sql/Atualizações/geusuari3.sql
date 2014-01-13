alter table geusuari
  add (cd_fil_acesso number(2)) 
  add (constraint FK_GEUSUARI_GEFILIAL foreign key (cd_fil_acesso) references gefilial(cd_fil))
/
