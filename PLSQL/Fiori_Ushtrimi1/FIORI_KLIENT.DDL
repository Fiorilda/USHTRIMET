create table FIORI_KLIENT
(
  endtoendid VARCHAR2(80) not null,
  amt        NUMBER(5,2),
  ccy        VARCHAR2(80),
  bic        VARCHAR2(80),
  iban       VARCHAR2(80),
  primary key (ENDTOENDID)
);