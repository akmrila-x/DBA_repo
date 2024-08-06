set linesize 500
col "ORA USER" for a7
col "OS USER" for a7
col MACHINE for a10
col REQUEST for a9
col LMODE for a9
SELECT /*+ RULE */
s.sid,
s.serial#,
s.username "ORA USER",
s.status,
s.osuser "OS USER",
s.machine,
s.last_call_et,
s.sql_id,
decode(l.block,0,'WAITING',1,'BLOCKING') block,
decode(
l.LMODE,1,'No Lock',
2,'Row Share',
3,'Row Exclusive',
4,'Share',
5,'Share Row Exclusive',
6,'Exclusive',null) lmode,
decode(
l.REQUEST,1,'No Lock',
2,'Row Share',
3,'Row Exclusive',
4,'Share',
5,'Share Row Exclusive',
6,'Exclusive',null) request ,
round(l.ctime/60,2) "MIN WAITING",
l.type
FROM v$process p, v$session s, v$Lock l
where p.addr = s.paddr
and s.sid=l.sid
and
(l.id1,l.id2,l.type) in
(SELECT l2.id1, l2.id2, l2.type
  FROM V$LOCK l2
  WHERE l2.request<>0)
order by l.id1,l.id2,l.block desc;
