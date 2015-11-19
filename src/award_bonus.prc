create or replace procedure award_bonus(emp_id number, sales_amt number)
is
   commission    real;
   comm_missing  EXCEPTION;
begin
   select commission_pct into commission
   from employees2
   where employee_id = emp_id;

   if commission is null then
      raise comm_missing;
   else
      update employees2
      set salary = nvl(salary, 0) + sales_amt * commission
      where employee_id = emp_id;
   end if;
end award_bonus;
