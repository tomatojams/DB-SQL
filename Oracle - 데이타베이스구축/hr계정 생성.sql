alter session set "_ORACLE_SCRIPT"=true;

create user hr identified by 1234
default tablespace users quota unlimited on users;

grant connect, resource to hr;