@echo off
SETLOCAL DisableDelayedExpansion
SET "r=%__CD__%"
SETLOCAL EnableDelayedExpansion enableextensions
FOR /R . %%F IN (target\cashout-grid-package\lib\*.jar) DO (
  SET "p=%%F"
  set "q=!p:%r%=!"
  rem ECHO !p:%r%=!
  SET CLASSPATH=!q!;!CLASSPATH!
  rem echo %CLASSPATH%
)
ENDLOCAL&SET "CLASSPATH=%CLASSPATH%"
rem @echo on
echo %CLASSPATH%
%JAVA_HOME%\bin\java -cp "%CLASSPATH%;target/cashout-grid-package/config" com.tangosol.net.DefaultCacheServer

