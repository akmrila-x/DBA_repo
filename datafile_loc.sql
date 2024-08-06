set pagesize 500
set linesize 500
col file_name for a70
select TABLESPACE_NAME,FILE_NAME,bytes/1024/1024 "SIZE in MB",maxbytes/1024/1024/1024 "MAX in GB", AUTOEXTENSIBLE from dba_data_files where TABLESPACE_NAME='&TBS_NAME';
