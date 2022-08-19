CREATE OR REPLACE PROCEDURE fiori_ushtrimi1_xmlProcedure AS

-- cursor cur_dataxml select data into variables from XML FILE using a specific path   (this xml file is stored XML_DATA column of FIORI_XMLTAB  table) 
CURSOR cur_dataxml IS      
     SELECT xt.* 
       FROM   fiori_xmlTab x,
       XMLTABLE('/Msg/Docs/Doc/Cctinit/Document/CstmrCdtTrfInitn/PmtInf/CdtTrfTxInf'
         PASSING x.xml_data
         COLUMNS
           EndToEndId1  VARCHAR2(1000)   PATH 'PmtId/EndToEndId',
           AMT1         NUMBER(5,2)  PATH 'Amt/InstdAmt',
           Ccy1         VARCHAR2(80)  PATH 'Amt/InstdAmt/@Ccy',
           BIC1         VARCHAR2(80)  PATH 'CdtrAgt/FinInstnId/BIC',
           IBAN1        VARCHAR2(80) PATH 'CdtrAcct/Id/IBAN'
         )xt;

         

BEGIN
       --use a for cursor  loop to fetch  all rows that may be in the xml file into fiori_klient table. 
     FOR L_cur_var in cur_dataxml LOOP 
      
     INSERT INTO fiori_klient(EndToEndId,AMT,Ccy,BIC,IBAN) VALUES (L_cur_var.EndToEndId1,L_cur_var.AMT1,
                                                                   L_cur_var.Ccy1,L_cur_var.BIC1,
                                                                   L_cur_var.Iban1);  
     END LOOP;
       
     --for cursor loop ends automatically when there are no more row to fetch
     
     EXCEPTION 
       WHEN OTHERS THEN 
         dbms_output.put_line(sqlerrm);   

END;
/
