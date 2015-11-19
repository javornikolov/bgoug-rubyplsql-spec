create or replace package body str
is
   function up(ip_str varchar2) return varchar2
   is
   begin
      return upper(ip_str);
   end up;

   function split(ip_str varchar2) return strarray
   is
      C_CS_REGEX constant varchar2(10 char) := '[^,]+';
      v_entry varchar2(4000 char);
      v_cnt integer := nvl(regexp_count(ip_str, ',') + 1, 0);
      v_res strarray := strarray();
   begin
      for i in 1..v_cnt loop
         v_res.extend;
         v_res(v_res.count) := regexp_substr(ip_str, C_CS_REGEX, 1, i);
      end loop;

      return v_res;
   end split;

   function join(ip_arr strarray, ip_sep varchar2 := ',') return varchar2
   is
      v_res varchar2(32000 byte);
      v_sep varchar2(100 char);
   begin
      for i in 1..ip_arr.count loop
         v_res := v_res || v_sep || ip_arr(i);
         v_sep := ip_sep;
      end loop;
   end join;
end str;
