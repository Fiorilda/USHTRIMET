CREATE OR REPLACE FUNCTION fn_fiori_isHolliday(p_myDay IN DATE,
                                            p_n   NUMBER,
                                            p_HorW   OUT  VARCHAR2,
                                            p_error_message OUT  VARCHAR2 
                                           )
RETURN BOOLEAN AS 
       
                             /*
                             Function: fn_fiori_isHolliday returns 
                               true   if the p_myDay  is holiday
                               false  if the p_myDay is work
                             */
l_day NUMBER;
l_year NUMBER;
l_month NUMBER;
l_holidayList VARCHAR2(50); 

l_newDate DATE; 
 

BEGIN 

   l_newDate:=p_myDay+p_n;   
    
    
  IF fn_fiori_isDate_Correct(l_newDate)  THEN 

   SELECT EXTRACT (DAY FROM  l_newDate) into l_day FROM DUAL;    --Put the day month and year of the new date into variables.   
   SELECT EXTRACT (YEAR  FROM l_newDate) into l_year FROM DUAL;
   SELECT EXTRACT (month  FROM l_newDate) into l_month FROM DUAL;
        

    --dbms_output.put_line(L_DAY);
   -- dbms_output.put_line(L_YEAR);
    --dbms_output.put_line(L_MONTH);
     

     BEGIN 
        SELECT HOLIDAY_LIST INTO l_holidayList     --the whole month, where each day is H OR W is selected
        FROM STTMS_LCL_HOLIDAY
        WHERE YEAR=l_year AND MONTH=l_month;
        
         -- dbms_output.put_line(l_holidayList);
        
         EXCEPTION 
           WHEN OTHERS THEN 
             dbms_output.put_line('fail'||SQLERRM);
             RETURN false;

     END;

     IF SUBSTR(l_holidayList,l_day,1)='H' THEN       -- we get olny the day that we want to see if it is a holiday day or work day 
         p_HorW:='H';
         return true;
        else
          P_HorW:='W'; 
          return false;
     END IF;

         -- dbms_output.put_line(p_HorW);

  ELSE 
    p_error_message:='THE DATE IS NOT IN THE TABLE';
    return false;
  END IF; 

  EXCEPTION 
   WHEN OTHERS THEN 
   dbms_output.put_line('fail'||SQLERRM);
   dbms_output.put_line(dbms_utility.format_error_backtrace);
   RETURN FALSE;

END fn_fiori_isHolliday;
/
