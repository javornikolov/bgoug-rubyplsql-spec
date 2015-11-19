create or replace type t_employee force as object (
   employee_id   number(15),
   first_name    varchar2(50),
   last_name     varchar(50),
   hire_date     date
)
