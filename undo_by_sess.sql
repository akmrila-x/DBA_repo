set pagesize 500
set linesize 500
col ORAUSER for a15
col Undo for a15
select
s.sid,s.serial#,
NVL(s.username, 'NA') orauser,
s.program,r.name undoseg,
t.used_ublk * TO_NUMBER(x.value)/1024||'K' "Undo"
from
sys.v_$rollname r,
sys.v_$session s,
sys.v_$transaction t,
sys.v_$parameter x
where s.taddr = t.addr
AND r.usn = t.xidusn(+)
AND x.name = 'db_block_size';
