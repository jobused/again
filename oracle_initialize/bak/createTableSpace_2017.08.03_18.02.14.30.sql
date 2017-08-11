--createTableSpace V11  dlsys、dlmis、dlgis、sde、mms、umstat   
--drop tablespace DLSYS including contents and datafiles;  
--drop tablespace DLMIS including contents and datafiles;  
--drop tablespace DLGIS including contents and datafiles;  
--drop tablespace SDE including contents and datafiles;  
--drop tablespace MMS including contents and datafiles;  
--drop tablespace UMSTAT including contents and datafiles;  
--drop tablespace DLHIST including contents and datafiles;  
--drop tablespace DLINIT including contents and datafiles;  
--drop tablespace DLTRANS including contents and datafiles;  
--drop tablespace ULOG including contents and datafiles;  
CREATE TABLESPACE "DLSYS"    
    LOGGING    
    DATAFILE 'D:\app\oradata\test\DLSYS.DBF' SIZE 200M    
    AUTOEXTEND    
    ON NEXT  10240K MAXSIZE UNLIMITED EXTENT MANAGEMENT LOCAL SEGMENT   
    SPACE MANAGEMENT  AUTO ;   
CREATE TABLESPACE "DLMIS"    
    LOGGING    
    DATAFILE 'D:\app\oradata\test\DLMIS.DBF' SIZE 1000M    
    AUTOEXTEND    
    ON NEXT  102400K MAXSIZE UNLIMITED EXTENT MANAGEMENT LOCAL SEGMENT   
    SPACE MANAGEMENT  AUTO ;   
CREATE TABLESPACE "DLGIS"    
    LOGGING    
    DATAFILE 'D:\app\oradata\test\DLGIS.DBF' SIZE 500M    
    AUTOEXTEND    
    ON NEXT  102400K MAXSIZE UNLIMITED EXTENT MANAGEMENT LOCAL SEGMENT   
    SPACE MANAGEMENT  AUTO ;    
CREATE TABLESPACE "SDE"    
    LOGGING    
    DATAFILE 'D:\app\oradata\test\SDE.DBF' SIZE 400M    
    AUTOEXTEND    
    ON NEXT  102400K MAXSIZE UNLIMITED EXTENT MANAGEMENT LOCAL SEGMENT   
    SPACE MANAGEMENT  AUTO ;   
CREATE TABLESPACE "MMS"    
    LOGGING    
    DATAFILE 'D:\app\oradata\test\MMS.DBF' SIZE 200M    
    AUTOEXTEND    
    ON NEXT  102400K MAXSIZE UNLIMITED EXTENT MANAGEMENT LOCAL SEGMENT   
    SPACE MANAGEMENT  AUTO ;   
CREATE TABLESPACE "UMSTAT"    
    LOGGING    
    DATAFILE 'D:\app\oradata\test\UMSTAT.DBF' SIZE 1000M    
    AUTOEXTEND    
    ON NEXT  102400K MAXSIZE UNLIMITED EXTENT MANAGEMENT LOCAL SEGMENT   
    SPACE MANAGEMENT  AUTO ;   
CREATE TABLESPACE "DLHIST"    
    LOGGING    
    DATAFILE 'D:\app\oradata\test\DLHIST.DBF' SIZE 1000M    
    AUTOEXTEND    
    ON NEXT  102400K MAXSIZE UNLIMITED EXTENT MANAGEMENT LOCAL SEGMENT   
    SPACE MANAGEMENT  AUTO ;   
CREATE TABLESPACE "DLINIT"    
    LOGGING    
    DATAFILE 'D:\app\oradata\test\DLINIT.DBF' SIZE 1000M    
    AUTOEXTEND    
    ON NEXT  102400K MAXSIZE UNLIMITED EXTENT MANAGEMENT LOCAL SEGMENT   
    SPACE MANAGEMENT  AUTO ;   
CREATE TABLESPACE "DLTRANS"    
    LOGGING    
    DATAFILE 'D:\app\oradata\test\DLTRANS.DBF' SIZE 1000M    
    AUTOEXTEND    
    ON NEXT  102400K MAXSIZE UNLIMITED EXTENT MANAGEMENT LOCAL SEGMENT   
    SPACE MANAGEMENT  AUTO ;   
CREATE TABLESPACE "ULOG"    
	LOGGING    
	DATAFILE 'D:\app\oradata\test\ULOG.DBF' SIZE 1000M    
	AUTOEXTEND    
	ON NEXT  102400K MAXSIZE UNLIMITED EXTENT MANAGEMENT LOCAL SEGMENT   
	SPACE MANAGEMENT  AUTO ;   
exit  
exit 
