@echo off
set result=�Ѿ���
:menu
echo 	�˵�
echo ����1������JAVA����
echo ����2����ʼ�����ݿ�
echo ����3���������ݡ�����ڳ�ʼ��֮�󷽿�ִ��
echo ����4����������
echo �˳���ֱ�ӹرձ�����
echo;
echo %result%
echo;
set /p operation=�����룺

cls
if /i "%operation%"=="1" goto setJava
if /i "%operation%"=="2" goto initialize
if /i "%operation%"=="3" goto impdp
if /i "%operation%"=="4" goto expdp_all
set result=��������Ѿ���
cls
goto menu

:setJava
set /p path_jdk=������JDK�İ�װ·����
setx "JAVA_HOME" "%path_jdk%" /m
setx "JRE_HOME" "%path_jdk%\jre" /m
setx "CLASSPATH" ".;%%JAVA_HOME%%\lib;%%JAVA_HOME%%\lib\tools.jar;" /m
setx "PATH" "%%JAVA_HOME%%\bin;%%JAVA_HOME%%\jre\bin;%PATH%" /m
@set result=JAVA�����������óɹ����Ѿ�����
goto menu

:initialize
set /p pw_is=�����������ʵ�������м���@����(�� password@instance):
set /p path_tableSpace=�������ռ�Ĵ洢·����
md %path_tableSpace%
set temp=%date:~0,10%
set temp=%temp:/=.%
set temp=%temp%_%time::=.%
move .\bat\createTableSpace.sql .\bak\createTableSpace_%temp%.sql
for /f "delims=' tokens=1,2,*" %%i in (.\bak\createTableSpace_%temp%.sql) do if "%%j"=="" (echo %%i%%j%%k >>.\bat\createTableSpace.sql) else (echo %%i'%path_tableSpace%\%%~nxj'%%k >>.\bat\createTableSpace.sql)
echo exit >>.\bat\createTableSpace.sql
sqlplus sys/%pw_is% as sysdba @.\bat\createTableSpace.sql
sqlplus sys/%pw_is% as sysdba @.\bat\createUser.sql
set /p path_expdp=�����뵼���������ڵ�·����
set /p file_name=�����뵼�������ļ����ļ�����
move .\bat\createDirectory.sql .\bak\createDirectory_%temp%.sql
echo create or replace directory expdp_dir as '%path_expdp%'; >.\bat\createDirectory.sql
echo grant read,write on directory expdp_dir to public; >>.\bat\createDirectory.sql
echo exit >>.\bat\createDirectory.sql
move .\bat\impdp.bat .\bak\impdp_%temp%.bat
echo impdp userid='sys/%pw_is% as sysdba' directory=expdp_dir dumpfile=%file_name% schemas=(DLSYS,DLMIS,MMS,UMSTAT,DLHIST,DLINIT,DLTRANS,ULOG) > .\bat\impdp.bat
call .\bat\impdp.bat
sqlplus sys/%pw_is% as sysdba @.\bat\createDirectory.sql
sqlplus sys/%pw_is% as sysdba @.\bat\createSynonyms.sql
@set result=��ʼ����ϣ��Ѿ�����
goto menu

:impdp
set /p pw_is=�����������ʵ�������м���@����(�� password@instance):
set temp=%pw_is:@=,%
for /f "delims=, tokens=2" %%i in ("%temp%") do set instance_name=%%i
set temp=%date:~0,10%
set temp=%temp:/=.%
set temp=%temp%_%time::=.%
set /p users=��������Ҫ������û�(schemas)��
set /p file_name=�����뵼�������ļ����ļ�����
move .\bat\impdp.bat .\bak\impdp_%temp%.bat
echo impdp userid='sys/%pw_is% as sysdba' directory=expdp_dir dumpfile=%file_name% schemas=(%users%) > .\bat\impdp.bat
move .\bat\createDirectory.sql .\bak\createDirectory_%temp%.sql
set /p path_expdp=�����뵼���������ڵ�·����
echo create or replace directory expdp_dir as '%path_expdp%'; >.\bat\createDirectory.sql
echo grant read,write on directory expdp_dir to public; >>.\bat\createDirectory.sql
echo exit >>.\bat\createDirectory.sql
sqlplus sys/%pw_is% as sysdba @.\bat\createDirectory.sql
call .\bat\impdp.bat
@set result=���ݵ���ɹ����Ѿ�����
goto menu

:expdp_all
set /p pw_is=�����������ʵ�������м���@����(�� password@instance):
set temp=%pw_is:@=,%
for /f "delims=, tokens=2" %%i in ("%temp%") do set instance_name=%%i
set temp=%date:~0,10%
set temp=%temp:/=.%
set temp=%temp%_%time::=.%
move .\bat\expdp_all.bat .\bak\expdp_all_%temp%.bat
echo expdp userid='sys/%pw_is% as sysdba' directory=expdp_dir dumpfile=expdp_all_%temp%.dmp schemas=(DLSYS,DLMIS,MMS,UMSTAT,DLHIST,DLINIT,DLTRANS,ULOG,DLGIS,SDE) logfile=expdp_all_%temp%.log > .\bat\expdp_all.bat
move .\bat\createDirectory.sql .\bak\createDirectory_%temp%.sql
set /p path_expdp=���������ݵ�����·����
echo create or replace directory expdp_dir as '%path_expdp%'; >.\bat\createDirectory.sql
echo grant read,write on directory expdp_dir to public; >>.\bat\createDirectory.sql
echo exit >>.\bat\createDirectory.sql
sqlplus sys/%pw_is% as sysdba @.\bat\createDirectory.sql
call .\bat\expdp_all.bat
@set result=���ݵ����ɹ����Ѿ�����
goto menu