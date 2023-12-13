alter session set "_ORACLE_SCRIPT"=true;

create user tr identified by 1234
default tablespace users quota unlimited on users;

grant connect, resource to tr;
