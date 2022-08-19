CREATE OR REPLACE FUNCTION fn_fiori_mid_rate (p_ccy1 varchar2,p_ccy2 varchar2,p_branch_code varchar2) RETURN NUMBER
AS 

  l_mid_rate NUMBER;
  l_mid_rate1 NUMBER;
  l_mid_rate2 NUMBER;
  
  CURSOR c_getCCy2 IS    --c_getCCy2 selects all the currencis that hava a mid_rate with p_ccy1 when some conditions are true;
    SELECT  ccy2         
    from CYTMS_RATES
    where ccy1=p_ccy1 AND BRANCH_CODE=p_branch_code AND RATE_TYPE='STANDARD';       

BEGIN 
  
 IF p_ccy1=p_ccy2 THEN    -- mid_rate is the two currencies are the same.
   RETURN 1;
 END IF; 
  
   /*Function: "fn_fiori_return_mid_rate" returns :
                     mid_rate when the  p_ccy1,p_ccy2 combiantion is found in the table.
                              in case that p_ccy1,p_ccy2 combiantion is not found in table but p_ccy2,p_ccy1 combiantion is found 
                              mid_rate:=1/mid_rate found for  p_ccy2,p_ccy1 combination
                     -1 when there is not a mid_rate found.
                   */  
l_mid_rate:=fn_fiori_return_mid_rate(p_ccy1,p_ccy2,p_branch_code);  
--dbms_output.put_line(l_mid_rate);

IF l_mid_rate !=-1 THEN
   RETURN l_mid_rate;       
END IF;                                   


  --If function  "fn_fiori_return_mid_rate"  returns -1 then we find  rerivated cases.
  
FOR c_getCCy2_var IN c_getCCy2  LOOP  -- takes all the currencies that have a mid_rate with  p_ccy1.        
   l_mid_rate1:=fn_fiori_is_Ccy1_Ccy2_inTable(p_ccy1,c_getCCy2_var.Ccy2,p_branch_code);  --kthen mid_rate  e p_ccy1 me ccy2(e ndermjetem)  nqs ekziston/merren, parasysh te dy rastet.
   l_mid_rate2:=fn_fiori_is_Ccy1_Ccy2_inTable(c_getCCy2_var.Ccy2,p_ccy2,p_branch_code); --kthen mid_rate  e ccy2(e ndermjetem) me p_ccy2  nqs ekziston/merren, parasysh te dy rastet. 
            --dbms_output.put_line(l_mid_rate1);

             --dbms_output.put_line(l_mid_rate2);
   IF l_mid_rate1!=-1 AND l_mid_rate2!=-1  THEN     
      return l_mid_rate1*l_mid_rate2;    
   END IF;
END LOOP;
 
   RETURN -1;
   
      EXCEPTION 
        WHEN OTHERS THEN 
         dbms_output.put_line('There was a mistake');
         RETURN -1;


END fn_fiori_mid_rate;
/
