CREATE TABLE STTM_FIORI3_X(
 
       CUSTOMER_TYPE VARCHAR2(150),
       CUSTOMER_CATEGORY  VARCHAR2(150),
       FIELD_DESCRPTION    VARCHAR2(150),
       MANDATORY_VALIDATION  VARCHAR2(150), 
       CONSTRAINT PK_STTM_FIORI3_X PRIMARY KEY (CUSTOMER_TYPE,CUSTOMER_CATEGORY,FIELD_DESCRPTION)         
); 