@echo off
set result=已就绪
:menu
echo 	菜单
echo 输入1→设置JAVA环境
echo 输入2→初始化数据库
echo 输入3→导入数据→务必在初始化之后方可执行
echo 输入4→导出数据
echo 退出请直接关闭本窗口
echo;
echo %result%
echo;
set /p operation=请输入：

cls
if /i "%operation%"=="1" goto setJava
if /i "%operation%"=="2" goto initialize
if /i "%operation%"=="3" goto impdp
if /i "%operation%"=="4" goto expdp_all
set result=输入错误，已就绪
cls
goto menu

:setJava
set /p path_jdk=请输入JDK的安装路径：
setx "JAVA_HOME" "%path_jdk%" /m
setx "JRE_HOME" "%path_jdk%\jre" /m
setx "CLASSPATH" ".;%%JAVA_HOME%%\lib;%%JAVA_HOME%%\lib\tools.jar;" /m
setx "PATH" "%%JAVA_HOME%%\bin;%%JAVA_HOME%%\jre\bin;%PATH%" /m
@set result=JAVA环境变量设置成功，已就绪：
goto menu

:initialize
set /p pw_is=请输入密码和实例名，中间用@隔开(例 password@instance):
set /p path_tableSpace=请输入表空间的存储路径：
md %path_tableSpace%
set temp=%date:~0,10%
set temp=%temp:/=.%
set temp=%temp%_%time::=.%
move .\bat\createTableSpace.sql .\bak\createTableSpace_%temp%.sql
for /f "delims=' tokens=1,2,*" %%i in (.\bak\createTableSpace_%temp%.sql) do if "%%j"=="" (echo %%i%%j%%k >>.\bat\createTableSpace.sql) else (echo %%i'%path_tableSpace%\%%~nxj'%%k >>.\bat\createTableSpace.sql)
echo exit >>.\bat\createTableSpace.sql
sqlplus sys/%pw_is% as sysdba @.\bat\createTableSpace.sql
sqlplus sys/%pw_is% as sysdba @.\bat\createUser.sql
set /p path_expdp=请输入导入数据所在的路径：
set /p file_name=请输入导入数据文件的文件名：
move .\bat\createDirectory.sql .\bak\createDirectory_%temp%.sql
echo create or replace directory expdp_dir as '%path_expdp%'; >.\bat\createDirectory.sql
echo grant read,write on directory expdp_dir to public; >>.\bat\createDirectory.sql
echo exit >>.\bat\createDirectory.sql
move .\bat\impdp.bat .\bak\impdp_%temp%.bat
echo impdp userid='sys/%pw_is% as sysdba' directory=expdp_dir dumpfile=%file_name% schemas=(DLSYS,DLMIS,MMS,UMSTAT,DLHIST,DLINIT,DLTRANS,ULOG) > .\bat\impdp.bat
call .\bat\impdp.bat
sqlplus sys/%pw_is% as sysdba @.\bat\createDirectory.sql
sqlplus sys/%pw_is% as sysdba @.\bat\createSynonyms.sql
@set result=初始化完毕，已就绪：
goto menu

:impdp
set /p pw_is=请输入密码和实例名，中间用@隔开(例 password@instance):
set temp=%pw_is:@=,%
for /f "delims=, tokens=2" %%i in ("%temp%") do set instance_name=%%i
set temp=%date:~0,10%
set temp=%temp:/=.%
set temp=%temp%_%time::=.%
set /p users=请输入需要导入的用户(schemas)：
set /p file_name=请输入导入数据文件的文件名：
move .\bat\impdp.bat .\bak\impdp_%temp%.bat
echo impdp userid='sys/%pw_is% as sysdba' directory=expdp_dir dumpfile=%file_name% schemas=(%users%) > .\bat\impdp.bat
move .\bat\createDirectory.sql .\bak\createDirectory_%temp%.sql
set /p path_expdp=请输入导入数据所在的路径：
echo create or replace directory expdp_dir as '%path_expdp%'; >.\bat\createDirectory.sql
echo grant read,write on directory expdp_dir to public; >>.\bat\createDirectory.sql
echo exit >>.\bat\createDirectory.sql
sqlplus sys/%pw_is% as sysdba @.\bat\createDirectory.sql
call .\bat\impdp.bat
@set result=数据导入成功，已就绪：
goto menu

:expdp_all
set /p pw_is=请输入密码和实例名，中间用@隔开(例 password@instance):
set temp=%pw_is:@=,%
for /f "delims=, tokens=2" %%i in ("%temp%") do set instance_name=%%i
set temp=%date:~0,10%
set temp=%temp:/=.%
set temp=%temp%_%time::=.%
move .\bat\expdp_all.bat .\bak\expdp_all_%temp%.bat
echo expdp userid='sys/%pw_is% as sysdba' directory=expdp_dir dumpfile=expdp_all_%temp%.dmp schemas=(DLSYS,DLMIS,MMS,UMSTAT,DLHIST,DLINIT,DLTRANS,ULOG,DLGIS,SDE) logfile=expdp_all_%temp%.log > .\bat\expdp_all.bat
move .\bat\createDirectory.sql .\bak\createDirectory_%temp%.sql
set /p path_expdp=请输入数据导出的路径：
echo create or replace directory expdp_dir as '%path_expdp%'; >.\bat\createDirectory.sql
echo grant read,write on directory expdp_dir to public; >>.\bat\createDirectory.sql
echo exit >>.\bat\createDirectory.sql
sqlplus sys/%pw_is% as sysdba @.\bat\createDirectory.sql
call .\bat\expdp_all.bat
@set result=数据导出成功，已就绪：
goto menu