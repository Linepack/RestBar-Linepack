create or replace package PKG_VALIDA IS
  PROCEDURE PRC_VALIDA_USUARIO(p_cd_usuario   in   number,
                               p_nm_usuario   out  varchar2,
                               p_erro         out  varchar2);
  PROCEDURE PRC_VALIDA_FILIAL(P_cd_fil_parameter  in   number,
                              p_cd_fil_changed    in   number,
                              p_ds_login          in   varchar2,
                              p_erro              out  varchar2,
                              p_retorno           out  varchar2);
 PROCEDURE PRC_VALIDA_DEPOSITO (P_CD_FIL    IN  NUMBER,
                                P_CD_DEP    IN  NUMBER,
                                P_ERRO      OUT VARCHAR2,
                                P_RETORNO   OUT VARCHAR2);
 PROCEDURE PRC_VALIDA_ITEM_ESMOVTO(P_CD_FIL      IN   NUMBER,
                                   P_CD_DEP      IN   NUMBER,
                                   P_CD_ITEM     IN   NUMBER,
                                   P_CD_BARRA    IN   NUMBER,
                                   P_ERRO        OUT  VARCHAR2,
                                   P_DS_ITEM     OUT  VARCHAR2,
                                   P_CD_UNIMED   OUT  VARCHAR2,
                                   P_VL_ITEM     OUT  NUMBER,
                                   P_CD_ITEM_OUT OUT  NUMBER);
 PROCEDURE PRC_VALIDA_ITEM(P_CD_FIL      IN        NUMBER,
                           P_CD_BARRA    IN        NUMBER,
                           P_CD_ITEM     IN        NUMBER,
                           P_ERRO        OUT       VARCHAR2,
                           P_DS_ITEM     OUT       VARCHAR2,
                           P_CD_UNIMED   OUT       VARCHAR2,
                           P_CD_ITEM_OUT OUT       NUMBER,
                           P_CD_DEP      OUT       NUMBER,
                           P_VL_ITEM     OUT       NUMBER);
 PROCEDURE PRC_VALIDA_TIPO_PESSOA(P_CD_TP_PESSOA IN  NUMBER,
                                  P_ERRO         OUT VARCHAR2,
                                  P_NM_TP_PESSOA OUT VARCHAR2);
 PROCEDURE PRC_VALIDA_CONDICAO(P_CD_CONDICAO   IN   NUMBER,
                               P_ERRO          OUT  VARCHAR2,
                               P_DS_CONDICAO   OUT  VARCHAR2);
 PROCEDURE PRC_VALIDA_PESSOA(P_CD_PESSOA   IN    NUMBER,
                            P_TP_PESSOA   IN    VARCHAR2, 
                            P_ERRO        OUT   VARCHAR2,
                            P_NM_FANTASIA OUT   VARCHAR2);
 PROCEDURE PRC_SUGERE_DEPOSITO_PADRAO(P_CD_FIL  IN    NUMBER,
                                      P_CD_DEP  OUT   NUMBER,
                                      P_ERRO    OUT   VARCHAR2);

                                 
end pkg_VALIDA;
/
