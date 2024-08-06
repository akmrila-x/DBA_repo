begin
rdsadmin.rdsadmin_util.kill(
sid => &SID,
serial => &SERIAL,
method => 'IMMEDIATE');
end;
/
