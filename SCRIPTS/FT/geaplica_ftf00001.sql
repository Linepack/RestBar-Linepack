
/*N�O ESQUECER DE PERMITIR A APLICA��O PARA O USU�RIO*/

insert into geaplica(cd_aplicacao,
                    nm_aplicacao,
                    st_bloqueado,
                    st_inclusao,
                    st_alteracao,
                    st_exclusao,
                    ds_help,
                    nm_usuinc,
                    dt_usuinc,
                    nm_usualt,
                    dt_usualt,
                    st_aplicacao,
                    cd_modulo) 
             values('FTF00001',
                    'Venda nominal', 
                    'N', 
                    'S',
                    'S',
                    'S',
                    null,
                    user,
                    sysdate,
                    null, 
                    null,
                    'A',
                    'FT');
                    
insert into geblkapl(cd_aplicacao,
                    nm_bloco,
                    ds_bloco,
                    st_inclusao,
                    st_alteracao,
                    st_exclusao,
                    nm_usuinc,
                    dt_usuinc,
                    nm_usualt,
                    dt_usualt)
             values('FTF00001', 
                    'BLK01',
                    'MESTRE DA VENDA',
                    'S',
                    'S',
                    'S',
                    USER,
                    SYSDATE,
                    NULL,
                    NULL);
                    
insert into geiteblk values
                    ('FTF00001','BLK01',
                    'CD_FIL','C�DIGO DA FILIAL',
                    'S','S',
                    'S','S',
                    user,
                    sysdate,
                    null,
                    null);

insert into geiteblk values
                    ('FTF00001','BLK01',
                    'VA_NM_FANTASIA_FIL','NOME FANTASIA DA FILIAL',
                    'S','S',
                    'N','S',
                    user,
                    sysdate,
                    null,
                    null);                    
                    
insert into geiteblk values
                    ('FTF00001','BLK01',
                    'NR_VENDA','N�MERO DA VENDA',
                    'S','S',
                    'N','S',
                    user,
                    sysdate,
                    null,
                    null);                    
                    
insert into geiteblk values
                    ('FTF00001','BLK01',
                    'DT_VENDA','DATA DA VENDA',
                    'S','S',
                    'S','S',
                    user,
                    sysdate,
                    null,
                    null);                    
                                 
insert into geiteblk values
                    ('FTF00001','BLK01',
                    'CD_PESSOA_CLIENTE','C�DIGO DO CLIENTE',
                    'S','S',
                    'S','S',
                    user,
                    sysdate,
                    null,
                    null);                            

insert into geiteblk values
                    ('FTF00001','BLK01',
                    'VA_NM_FANTASIA_CLI','NOME FANTASIA DO CLIENTE',
                    'S','S',
                    'N','S',
                    user,
                    sysdate,
                    null,
                    null);
                    
insert into geiteblk values
                    ('FTF00001','BLK01',
                    'CD_PESSOA_VENDEDOR','C�DIGO DO VENDEDOR',
                    'S','S',
                    'N','S',
                    user,
                    sysdate,
                    null,
                    null);    
                    
insert into geiteblk values
                    ('FTF00001','BLK01',
                    'VA_NM_FANTASIA_VEN','NOME FANTASIA DO VENDEDOR',
                    'S','S',
                    'N','S',
                    user,
                    sysdate,
                    null,
                    null);                                    

insert into geblkapl(cd_aplicacao,
                    nm_bloco,
                    ds_bloco,
                    st_inclusao,
                    st_alteracao,
                    st_exclusao,
                    nm_usuinc,
                    dt_usuinc,
                    nm_usualt,
                    dt_usualt)
             values('FTF00001', 
                    'BLK02',
                    'ITEM DA VENDA',
                    'S',
                    'S',
                    'S',
                    USER,
                    SYSDATE,
                    NULL,
                    NULL);
                    
                   
insert into geiteblk values
                    ('FTF00001','BLK02',
                    'SQ_ITEM','SEQUENCIA DO ITEM NA VENDA',
                    'S','S',
                    'N','S',
                    user,
                    sysdate,
                    null,
                    null);                     
                    
insert into geiteblk values
                    ('FTF00001','BLK02',
                    'CD_ITEM','C�DIGO DO ITEM',
                    'S','S',
                    'S','S',
                    user,
                    sysdate,
                    null,
                    null);                                         
                    
insert into geiteblk values
                    ('FTF00001','BLK02',
                    'VA_DS_ITEM','DESCRI��O DO ITEM',
                    'S','S',
                    'N','S',
                    user,
                    sysdate,
                    null,
                    null);  
                    
insert into geiteblk values
                    ('FTF00001','BLK02',
                    'CD_UNIMED','C�DIGO DA UNIDADE DE MEDIDA',
                    'S','S',
                    'S','S',
                    user,
                    sysdate,
                    null,
                    null);                                                                                
                    
insert into geiteblk values
                    ('FTF00001','BLK02',
                    'QT_ITEM','QUANTIDADE DE VENDA DO ITEM',
                    'S','S',
                    'S','S',
                    user,
                    sysdate,
                    null,
                    null);                                         
                    
insert into geiteblk values
                    ('FTF00001','BLK02',
                    'VL_ITEM','VALOR UNIT�RIO DO ITEM',
                    'S','S',
                    'S','S',
                    user,
                    sysdate,
                    null,
                    null);                                         
                    
insert into geiteblk values
                    ('FTF00001','BLK02',
                    'VA_VL_TOTAL','Quantidade do item vezes o valor unit�rio',
                    'S','S',
                    'N','S',
                    user,
                    sysdate,
                    null,
                    null);

insert into geiteblk values
                    ('FTF00001','BLK02',
                    'VA_VL_TOTAL_GERAL','SOMA DO VALOR FINAL DE CADA ITEM',
                    'S','S',
                    'N','S',
                    user,
                    sysdate,
                    null,
                    null);                                                                                  
