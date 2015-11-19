create or replace package body api_employee
is
   procedure get_employee(
      op_cursor out sys_refcursor,
      emp_id in number
   )
   is
   begin
      open op_cursor for
         select
            t_employee(
               t.employee_id,
               t.first_name,
               t.last_name,
               t.hire_date) as complex_type
         from
            employees2 t
         where
            t.employee_id = t.employee_id;
   end get_employee;
end api_employee;
