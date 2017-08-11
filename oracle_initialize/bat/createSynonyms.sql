--导入数据库后创建同义词
grant execute on dlsys.pkWF to public;
drop public synonym pkWF;
create or replace public synonym pkWF for dlsys.pkWF;

grant execute on dlsys.egovaLog to public;
drop public synonym egovaLog;
create public synonym egovaLog for dlsys.egovaLog;

GRANT EXECUTE ON ULOG.PLOG TO PUBLIC;
DROP PUBLIC SYNONYM PLOG;
CREATE  PUBLIC SYNONYM PLOG FOR ULOG.PLOG;

grant select on ULOG.tlog to public;
DROP PUBLIC SYNONYM tlog;
CREATE  PUBLIC SYNONYM tlog FOR ULOG.tlog;

grant select on ULOG.vlog to public;
DROP PUBLIC SYNONYM vlog;
CREATE  PUBLIC SYNONYM vlog FOR ULOG.vlog;

--在创建DLSYS.TCSYSINIT表之后执行
GRANT ALTER ON DLSYS.TCSYSINIT TO DLINIT;
GRANT INSERT ON DLSYS.TCSYSINIT TO DLINIT;
GRANT SELECT ON DLSYS.TCSYSINIT TO DLINIT;
GRANT UPDATE ON DLSYS.TCSYSINIT TO DLINIT;

exit