CREATE TABLE STTM_FIORI1_MASTER(
      Group_code varchar2(35),
      Description varchar2(255),
      Exposure_category varchar2(35),
      Group_Status varchar2(35),
      Since Date,
      Group_Type varchar2(35),
      AUTH_STAT        CHAR(1 BYTE),
      RECORD_STAT      CHAR(1 BYTE),
      MOD_NO           NUMBER,
      CHECKER_ID       VARCHAR2(12 BYTE),
      ONCE_AUTH        VARCHAR2(1 BYTE),
      MAKER_ID         VARCHAR2(12 BYTE),
      MAKER_DT_STAMP   TIMESTAMP (6),
      CHECKER_DT_STAMP TIMESTAMP (6),
      CONSTRAINT STTM_FIORI1_MASTER PRIMARY KEY (Group_code)       
);

CREATE SYNONYM STTMS_FIORI1_MASTER FOR STTM_FIORI1_MASTER;
