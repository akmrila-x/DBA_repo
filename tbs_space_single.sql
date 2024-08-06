set pagesize 500
set linesize 500
col "TABLESPACE" for a20
select t.tablespace,  t.totalspace as " Totalspace(MB)",
     round((t.totalspace-nvl(fs.freespace,0)),2) as "Used Space(MB)",
     nvl(fs.freespace,0) as "Freespace(MB)",
     round(((t.totalspace-nvl(fs.freespace,0))/t.totalspace)*100,2) as "%Used",
     round((nvl(fs.freespace,0)/t.totalspace)*100,2) as "% Free"
     from
     (select round(sum(d.bytes)/(1024*1024)) as totalspace,d.tablespace_name tablespace
     from dba_data_files d
     group by d.tablespace_name) t,
     (select round(sum(f.bytes)/(1024*1024)) as freespace,f.tablespace_name tablespace
     from dba_free_space f
     group by f.tablespace_name) fs
     where t.tablespace=fs.tablespace and t.tablespace='&TBS_NAME';

set pagesize 500
set linesize 500
col file_name for a70
select TABLESPACE_NAME,FILE_NAME,bytes/1024/1024 "SIZE in MB",maxbytes/1024/1024/1024 "MAX in GB", AUTOEXTENSIBLE from dba_data_files where TABLESPACE_NAME='&TBS_NAME';
