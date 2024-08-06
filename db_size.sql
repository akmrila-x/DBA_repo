select sum(bytes/1024/1024/1024) "Database Size(GB)" from dba_data_files;
select sum(bytes/1024/1024/1024) "Database Used Space(GB)" from dba_segments;
select sum(bytes/1024/1024/1024) "Database Free space(GB)" from dba_free_space;
