--createTableSpace V11  dlsys、dlmis、dlgis、sde、mms、umstat
--DROP TABLESPACE DLSYS INCLUDING CONTENTS AND DATAFILES;
--DROP TABLESPACE DLMIS INCLUDING CONTENTS AND DATAFILES;
--DROP TABLESPACE DLGIS INCLUDING CONTENTS AND DATAFILES;
--DROP TABLESPACE SDE INCLUDING CONTENTS AND DATAFILES;
--DROP TABLESPACE MMS INCLUDING CONTENTS AND DATAFILES;
--DROP TABLESPACE UMSTAT INCLUDING CONTENTS AND DATAFILES;

CREATE TABLESPACE "DLSYS" 
    LOGGING 
    DATAFILE 'D:\app\Administrator\oradata\CGDB\DLSYS.DBF' SIZE 200M 
    AUTOEXTEND 
    ON NEXT  10240K MAXSIZE UNLIMITED EXTENT MANAGEMENT LOCAL SEGMENT
    SPACE MANAGEMENT  AUTO ;

CREATE TABLESPACE "DLMIS" 
    LOGGING 
    DATAFILE 'D:\app\Administrator\oradata\CGDB\DLMIS.DBF' SIZE 1000M 
    AUTOEXTEND 
    ON NEXT  102400K MAXSIZE UNLIMITED EXTENT MANAGEMENT LOCAL SEGMENT
    SPACE MANAGEMENT  AUTO ;

CREATE TABLESPACE "DLGIS" 
    LOGGING 
    DATAFILE 'D:\app\Administrator\oradata\CGDB\DLGIS.DBF' SIZE 500M 
    AUTOEXTEND 
    ON NEXT  102400K MAXSIZE UNLIMITED EXTENT MANAGEMENT LOCAL SEGMENT
    SPACE MANAGEMENT  AUTO ; 

CREATE TABLESPACE "SDE" 
    LOGGING 
    DATAFILE 'D:\app\Administrator\oradata\CGDB\SDE.DBF' SIZE 400M 
    AUTOEXTEND 
    ON NEXT  102400K MAXSIZE UNLIMITED EXTENT MANAGEMENT LOCAL SEGMENT
    SPACE MANAGEMENT  AUTO ;

CREATE TABLESPACE "MMS" 
    LOGGING 
    DATAFILE 'D:\app\Administrator\oradata\CGDB\MMS.DBF' SIZE 200M 
    AUTOEXTEND 
    ON NEXT  102400K MAXSIZE UNLIMITED EXTENT MANAGEMENT LOCAL SEGMENT
    SPACE MANAGEMENT  AUTO ;

CREATE TABLESPACE "UMSTAT" 
    LOGGING 
    DATAFILE 'D:\app\Administrator\oradata\CGDB\UMSTAT.DBF' SIZE 1000M 
    AUTOEXTEND 
    ON NEXT  102400K MAXSIZE UNLIMITED EXTENT MANAGEMENT LOCAL SEGMENT
    SPACE MANAGEMENT  AUTO ;

CREATE TABLESPACE "DLHIST" 
    LOGGING 
    DATAFILE 'D:\app\Administrator\oradata\CGDB\DLHIST.DBF' SIZE 1000M 
    AUTOEXTEND 
    ON NEXT  102400K MAXSIZE UNLIMITED EXTENT MANAGEMENT LOCAL SEGMENT
    SPACE MANAGEMENT  AUTO ;

CREATE TABLESPACE "DLINIT" 
    LOGGING 
    DATAFILE 'D:\app\Administrator\oradata\CGDB\DLINIT.DBF' SIZE 1000M 
    AUTOEXTEND 
    ON NEXT  102400K MAXSIZE UNLIMITED EXTENT MANAGEMENT LOCAL SEGMENT
    SPACE MANAGEMENT  AUTO ;

CREATE TABLESPACE "DLTRANS" 
    LOGGING 
    DATAFILE 'D:\app\Administrator\oradata\CGDB\DLTRANS.DBF' SIZE 1000M 
    AUTOEXTEND 
    ON NEXT  102400K MAXSIZE UNLIMITED EXTENT MANAGEMENT LOCAL SEGMENT
    SPACE MANAGEMENT  AUTO ;

CREATE TABLESPACE "ULOG" 
	LOGGING 
	DATAFILE 'D:\app\Administrator\oradata\CGDB\ULOG.DBF' SIZE 1000M 
	AUTOEXTEND 
	ON NEXT  102400K MAXSIZE UNLIMITED EXTENT MANAGEMENT LOCAL SEGMENT
	SPACE MANAGEMENT  AUTO ;