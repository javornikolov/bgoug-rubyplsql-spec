create or replace package str
is
   function up(ip_str varchar2) return varchar2;

   function split(ip_str varchar2) return strarray;
end str;
