create or replace package PKG_REGRAS IS

 PROCEDURE PRC_BAIXA_ESTOQUE_VENDA (P_CD_FIL      IN  NUMBER,
                                    P_NR_VENDA    IN  NUMBER,
                                    P_TP_OPERACAO IN  VARCHAR2,
                                    P_ERRO        OUT VARCHAR2);
                                    
 PROCEDURE PRC_CONSULTA_ESSALDO(P_CD_FIL     IN       NUMBER,
                                P_CD_DEP     IN       NUMBER,
                                P_CD_ITEM    IN       NUMBER,
                                P_QT_ITEM    IN       NUMBER,
                                P_QT_SALDO   OUT      NUMBER,
                                P_ERRO       OUT      VARCHAR2);

end PKG_REGRAS;
/
