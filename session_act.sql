set linesize 500
set pagesize 500
col OSUSER for a7
col TERMINAL for a10
col USERNAME for a20
select
INST_ID
,SID
,SERIAL#
,USERNAME
,TERMINAL
,LAST_CALL_ET/60 "in Mins"
,SQL_ID
,OSUSER
,to_char (LOGON_TIME,'DD-MON-YYYY HH24:MI') "LOGON_TIME"
,status
from
gv$session
where
username like upper ('%') and status='ACTIVE';
