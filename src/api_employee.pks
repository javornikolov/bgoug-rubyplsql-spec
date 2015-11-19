create or replace package api_employee
is
   procedure get_employee(
      op_cursor out sys_refcursor,
      emp_id in number
   );
end api_employee;
