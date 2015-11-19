set echo on serveroutput on feedback on verify on

define MY_USER=&&1.
define MY_PASS=&&2.

create tablespace tbs_test;

create user &&MY_USER. identified by &&MY_PASS. default tablespace tbs_test temporary tablespace temp;

alter user &&MY_USER. quota 200M on tbs_test;

grant connect, resource to &&MY_USER.;

grant select any table to &&MY_USER.;
grant select any dictionary to &&MY_USER.;
grant create view, create table, create procedure, create synonym, create database link, create materialized view, create sequence, create type to &&MY_USER.;

