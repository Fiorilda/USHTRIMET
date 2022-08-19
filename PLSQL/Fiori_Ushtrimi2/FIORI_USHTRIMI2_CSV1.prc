CREATE OR REPLACE PROCEDURE FIORI_USHTRIMI2_CSV1 AS

      l_file         utl_file.file_type;
      l_text         VARCHAR2(32767);
      
      l_var_currencyFROM   VARCHAR2(30);
      L_var_currencyTO     VARCHAR2(30)  DEFAULT 'EUR';
      l_var_exchangeRate   FLOAT;
      l_var_date1          VARCHAR2(30); 
      
 
BEGIN 
  
      l_file := utl_file.fopen('FIORI_CSV', 'cvs_ushtrimi2.csv', 'R');    
  
      LOOP
       utl_file.get_line(l_file, l_text, 32767);
       
        l_var_currencyFROM :=regexp_substr(l_text, '[^,]+', 1, 1);
        l_var_exchangeRate:=regexp_substr(l_text, '[^,]+', 1, 2);
        l_var_date1 :=regexp_substr(l_text, '[^,]+', 1, 3);
        
                          -- dbms_output.put_line(l_var_currencyFROM);
                          ---- dbms_output.put_line(l_var_exchangeRate);
                          -- dbms_output.put_line(l_var_date1);
         
         
       IF regexp_substr(l_var_currencyFROM, '\d') = '1' THEN
       
            BEGIN
                        INSERT  
                          INTO fiori_exchange_rates ( currency_from, currency_to,exchangeRate,date1) 
                       VALUES (
                               regexp_substr(l_var_currencyFROM, '(\S*)',1,1),
                               regexp_substr(l_var_currencyFROM, '(\S*)',1,7),
                               l_var_exchangeRate,
                               TO_DATE(l_var_date1,'DD/MM/YYYY') 
                              );
                              commit; 
                   EXCEPTION
                    when others then
                       dbms_output.put_line('fail'||SQLERRM);
             END;
           ELSE 
             
               BEGIN
                    INSERT  
                        INTO fiori_exchange_rates (currency_from, currency_to,exchangeRate,date1) 
                     VALUES (l_var_currencyFROM,
                              L_var_currencyTO,
                             l_var_exchangeRate,
                             TO_DATE(l_var_date1,'DD/MM/YYYY') 
                            );  
                           commit;  
                           
                     EXCEPTION
                        when others then
                          dbms_output.put_line('fail'||SQLERRM);
                   
                END; 
        
        END IF;
      
     END LOOP;

     utl_file.fclose(l_file);
     
   exception
     when no_data_found then
       null;

END;
/
