CREATE OR REPLACE FUNCTION fn_fiori_isDate_Correct(p_myDay IN DATE)
                          /* 
                              This function returns:
                                'TRUE' if the DATE p_myDay does exist
                                'N' if the contract does not exist
                           */                                                              
RETURN BOOLEAN AS 

start_year number;
end_year number;
l_year   number;

BEGIN 

 SELECT min(year)     -- fetch the minimum year into strat_year variable  
 INTO start_year
 FROM STTMS_LCL_HOLIDAY;
 
 --dbms_output.put_line(start_year);


 SELECT max(year)    --- fetch the minimum year into end_year variable  
 INTO end_year
 FROM STTMS_LCL_HOLIDAY;
 
  --dbms_output.put_line(start_year);

  SELECT EXTRACT (YEAR  FROM p_myDay) into l_year FROM DUAL;
  
   --dbms_output.put_line(l_year);
   
  IF(l_year>=start_year and l_year<=end_year) THEN
     return true;
   else 
    return false;  
  
  END IF;
  
  EXCEPTION 
    WHEN Others then 
        dbms_output.put_line(SQLERRM);
        return false;

END fn_fiori_isDate_Correct;
/
