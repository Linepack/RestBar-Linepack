alter table esitemes
 modify cd_tipo null
/

alter table esitemes
 modify cd_unimed null
/

alter table geendere
  modify ds_logradouro null
  modify ds_bairro null
  modify nr_cep null
  modify cd_pais null
  modify sg_estado null
/

alter table gefilial
  modify nm_fantasia null
  modify nr_cgc null
/

alter table gepessoa
  modify nm_fantasia null
/