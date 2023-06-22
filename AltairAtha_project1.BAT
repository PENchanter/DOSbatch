@ECHO OFF
:: I would also use MS-Windows' DEFRAG program to defrag the C: drive.  
:: "A" and "B" are reserved exclusively as floppy disk drive letters, unless otherwise configured.  
:: CD /D "%~dp0"		{-- this line should not be necessary --}

FOR %%B IN (A B C D E F G H I J K L M N O P Q R S T U V Y Z X W) DO (
	IF EXIST %%B:\ (CALL :DoDefrag %%B) ELSE (CALL :ErrorNotExist %%B)
)

:AllDone
ECHO ALL (AVAILABLE) DRIVES - PROCESS COMPLETED!>>DefragLog.txt
EXIT

:DoDefrag
DEFRAG %~1: /U /V
IF %ERRORLEVEL% NEQ 0 (CALL :ErrorDefrag  %~1) ELSE (CALL :Success %~1)
EXIT /B

:ErrorDefrag
ECHO %~1: DRIVE does -NOT- exist!>>DefragLog.txt
ECHO.>>DefragLog.txt
EXIT /B

:ErrorNotExist
ECHO %~1: DRIVE does -NOT- exist!>>DefragLog.txt
ECHO.>>DefragLog.txt
EXIT /B

:Success
ECHO %~1: DRIVE = Defragmentation Successful.>>DefragLog.txt
ECHO.>>DefragLog.txt
EXIT /B
