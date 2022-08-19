CREATE OR REPLACE FUNCTION fn_fiori_is_Ccy1_Ccy2_inTable(p_ccy1 varchar2,p_ccy2 varchar2,p_branch_code varchar2 ) RETURN NUMBER
AS 
        /*
         Function :"fn_fiori_is_Ccy1_Ccy2_inTable" returns
         1 if mid-rate between p_ccy1 and p_ccy2 is found.
        -1 if mid_rate between p_ccy1 and p_ccy2 is  not found.*/
         
 l_count NUMBER; 
 
 BEGIN 
                              
  BEGIN
    SELECT  COUNT(*)  
    INTO l_count
    FROM   CYTMS_RATES
    WHERE BRANCH_CODE=p_branch_code  AND CCY1=p_ccy1 AND CCY2=p_ccy2 AND rate_type='STANDARD';
     
     --dbms_output.put_line(l_count);
    
      EXCEPTION  
      WHEN OTHERS THEN 
           dbms_output.put_line(sqlerrm);
           RETURN -1;

  END;
  
  IF l_count>0 THEN 
    return 1;
     else   
    return -1;

  END IF;
  
   EXCEPTION 

    WHEN OTHERS THEN 
         dbms_output.put_line(sqlerrm);
         return -1;
 
END  fn_fiori_is_Ccy1_Ccy2_inTable;
/
