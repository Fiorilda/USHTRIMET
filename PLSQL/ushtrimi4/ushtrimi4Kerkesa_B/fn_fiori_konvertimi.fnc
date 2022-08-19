CREATE OR REPLACE FUNCTION fn_fiori_konvertimi(p_ccy1 VARCHAR2,p_ccy2 VARCHAR2,p_branch_code VARCHAR2, p_value NUMBER ) RETURN NUMBER
AS 

           /*
           Function fn_fiori_konvertimi returns:
                     l_result (the amount converted)   if the conversion is made successfully
                      -1      if the conversion can not be made, or when there is a problem with the code.
         */


    l_mid_rate NUMBER;                   
    l_decimal NUMBER;
    l_sumCoverted NUMBER;   
    l_result NUMBER;
                                        
BEGIN 
    
    l_mid_rate:=fn_fiori_mid_rate(p_ccy1,p_ccy2,p_branch_code);
    
    -- dbms_output.put_line(l_mid_rate);


   IF l_mid_rate!=-1 THEN

      BEGIN 
          SELECT DISTINCT CCY_DECIMALS
          INTO l_decimal 
          FROM CYTMS_CCY_DEFN_MASTER    
          WHERE CCY_CODE=p_ccy2;
 
       -- dbms_output.put_line(l_decimal);

          EXCEPTION 
            WHEN OTHERS THEN 
             dbms_output.put_line('NO DATA FOUND EXCEPTION OR NOT RIGHT TYPE ');
             RETURN -1;
      END;
         
        l_sumCoverted:=l_mid_rate*p_value;   
        -- dbms_output.put_line(l_sumCoverted);
        l_result:=ROUND(l_sumCoverted,l_decimal);      
   ELSE
      dbms_output.put_line('can not make the conversion');
      l_result:=-1;
      
   END IF;   
      
  RETURN l_result;
         -- dbms_output.put_line(l_decimal);

  
       EXCEPTION 
            WHEN OTHERS THEN 
             dbms_output.put_line('NO DATA FOUND EXCEPTION OR NOT RIGHT TYPE ');
             RETURN -1;
    
    
        
END fn_fiori_konvertimi; 
/
