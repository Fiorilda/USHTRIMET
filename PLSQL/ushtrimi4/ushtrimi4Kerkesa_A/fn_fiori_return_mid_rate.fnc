CREATE OR REPLACE FUNCTION fn_fiori_return_mid_rate(p_ccy1 varchar2,p_ccy2 varchar2,p_branch_code varchar2) RETURN NUMBER
AS  
                   /*Function: "fn_fiori_return_mid_rate" returns:
                     mid_rate when the  p_ccy1,p_ccy2 combiantion is found in the table.
                              in case that p_ccy1,p_ccy2 combiantion is not found in table but p_ccy2,p_ccy1 combiantion is found then 
                              mid_rate:=1/mid_rate is returned.
                              
                     -1      when there is not a mid_rate found.
                   */  
 l_mid_rate NUMBER;
 l_result1 NUMBER;
 l_result2 NUMBER;
 l_value1 varchar2(50); 
 l_value2 varchar2(50);

BEGIN   

  l_result1:=fn_fiori_is_Ccy1_Ccy2_inTable(p_ccy1,p_ccy2,p_branch_code); 
  
      IF  l_result1=1 THEN               
          l_value1:=p_ccy1;
          l_value2:=p_ccy2;
      ELSE 
          l_result2:=fn_fiori_is_Ccy1_Ccy2_inTable(p_ccy2,p_ccy1,p_branch_code);
          IF l_result2=1 THEN
            l_value1:=p_ccy2;
            l_value2:=p_ccy1;
          ELSE
            RETURN -1;
          END IF;
      END IF;  

  BEGIN 
        
    SELECT  MID_RATE
    INTO l_mid_rate 
    FROM CYTMS_RATES    
    WHERE BRANCH_CODE=p_branch_code AND CCY1=l_value1 AND CCY2=l_value2 AND rate_type='STANDARD';
    
     EXCEPTION 
           WHEN OTHERS THEN 
            dbms_output.put_line(sqlerrm);
            RETURN -1;
  END;

  IF l_result2=1 THEN
    l_mid_rate:=1/l_mid_rate;
  END IF;

  RETURN l_mid_rate;
  
      EXCEPTION 
           WHEN OTHERS THEN 
            dbms_output.put_line(sqlerrm);
            RETURN -1;

END  fn_fiori_return_mid_rate;
/
