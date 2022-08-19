create or replace function fn_fiori_does_contract_exist_no(udf_name  VARCHAR2, p_udf_value VARCHAR2, p_fc_module varchar2) return varchar2
as
                           /* 
                              This function returns:
                                'Y' if the contract exist
                                'N' if the contract does not exist
                           */

  l_flag number;            
  l_result  varchar2(1);                                                                   
  l_field_num number;
  l_field_val_name VARCHAR2(50);
  l_product_code varchar(50);
  --l_error  varchar2(50) default 'execeptionError';

BEGIN 
  
BEGIN
  select field_num,product_code into l_field_num,l_product_code from cstm_product_udf_fields_map  where field_name=udf_name;

  exception
     when others then 
       dbms_output.put_line('A mistake happened when trying to fecth data from table ');
       dbms_output.put_line(SQLERRM);
       return 'GABIM';

END;


l_field_val_name:='FIELD_VAL_'||l_field_num;

--dbms_output.put_line(l_field_val_name);
--dbms_output.put_line(p_udf_value);


EXECUTE IMMEDIATE 'select count(*)  from cstm_contract_userdef_fields where '||l_field_val_name||'='''||p_udf_value||'''  and module =''' || p_fc_module ||'''   and product_code =''' || l_product_code ||'''    ' into l_flag;
 
 --dbms_output.put_line(l_flag);


  if l_flag >0 then
   l_result:='Y';
    
  else
    l_result:='N';
  end if;

 --dbms_output.put_line(L_FLAG);

  return l_result;

 exception 
  when others then
     dbms_output.put_line(sqlerrm);
     return 'GABIM';
 
end fn_fiori_does_contract_exist_no;
/
