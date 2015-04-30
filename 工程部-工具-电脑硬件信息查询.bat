::comments
::use wmic command
::usually used:
::wmic computersystem get *
::wmic cpu get * 
::wmic os get *
::>more...
::win + R > wmic > /? > backspace
::last modified:2014/2/6


@echo off
runas /savecred /user:administrator "C:\Windows\system32\cmd.exe" >nul 2>nul
mode con cols=200 lines=100 >nul 2>nul
title=XingLinTech  v=2.2  support:shaozl@xinglin-tech.com>nul 2>nul
color 02


::code
setlocal enableextensions enabledelayedexpansion

for /f "delims=" %%l in ('wmic os get Caption^,OSArchitecture^,CSName^,TotalVirtualMemorySize^,FreeVirtualMemory^,FreePhysicalMemory^,TotalVisibleMemorySize^  /format:list') do >nul 2>&1 set "OS_%%l"
set /a OS_UsedPhysicalMemory=OS_TotalVisibleMemorySize-OS_FreePhysicalMemory
for /f "delims=" %%l in ('wmic cpu get Name^,NumberOfCores^,NumberOfLogicalProcessors^ /format:list') do >nul 2>&1 set "CPU_%%l"
for /f "delims=" %%l in ('wmic baseboard get Manufacturer^,Product^,SerialNumber^ /format:list') do >nul 2>&1 set "BaseBoard_%%l"
for /f "delims=" %%l in ('wmic bios get BIOSVersion^ /format:list') do >nul 2>&1 set "BIOS_%%l"


for /f "delims=" %%l in ('wmic diskdrive get Caption^,Size /format:list') do (
    >nul 2>&1 set "TEMP_%%l"

    call :stringlenth "!TEMP_Size:~0,-1!" num
    echo !num! >nul 2>nul

    if !num! GEQ 9 (
        call :jian !num! 9 numok   
        call :fixsize !numok!  exp
        set /a e1= exp
    )

    if !num! GTR 9 if not "!TEMP_Caption:~1,1!" == ":"   if defined TEMP_Size set .               +  HardDisk_!TEMP_Caption:~0,-1!=!TEMP_Size:~0,-1! Bytes  ≈  !e1! G   &set TEMP_Caption=&set TEMP_Size=
    
)


for /f "delims=" %%l in ('wmic volume get DriveLetter^,Capacity /format:list') do (
    >nul 2>&1 set "TEMP_%%l"

    call :stringlenth "!TEMP_Capacity:~0,-1!" num2
    echo !num2! >nul 2>nul

    if !num2! GEQ 9 (
        call :jian !num2! 9 ok   
        call :fix !ok!  express
        set /a e2= express
    )

    
    if !num2! GTR 9 if "!TEMP_DriveLetter:~1,1!"==":" if defined TEMP_Capacity  set _               +  StorageSpace_!TEMP_DriveLetter:~0,2!=!TEMP_Capacity:~0,-1! Bytes  ≈  !e2! G  &set TEMP_DriveLetter=&set TEMP_Capacity=
    
)




::Change Kib to G 
::IEC Standard -> 1 GiB = 1,024 MiB = 1,048,576 KiB = 1,073,741,824 bytes
::SI Standard  -> 1 GB = 1,000 MB = 1,000,000 kB = 1,000,000,000 bytes

call:division %OS_FreeVirtualMemory% 1000000 a2 0
call:division %OS_FreeVirtualMemory% 1048576 a1 0
call:division %OS_TotalVirtualMemorySize% 1000000 b2 0
call:division %OS_TotalVirtualMemorySize% 1048576 b1 0
call:division %OS_FreePhysicalMemory% 1000000 c2 0
call:division %OS_FreePhysicalMemory% 1048576 c1 0
call:division %OS_TotalVisibleMemorySize% 1000000 d2 0
call:division %OS_TotalVisibleMemorySize% 1048576 d1 0


::empty line
echo. 

::empty line
echo. 

::corporation name
echo 			+-------+--------+-------+------+-------+
echo 			^|         -----XingLinTech-----         ^|

::corporation name
echo 			^|                                       ^| 
echo 			^|           ^|_^|_^|   ^|_^|_^| ^|_^|_^|         ^|
echo 			^|            /^|\     _^|_   _^|_          ^|
echo 			^|          / _^|_ \  ^| ^| ^| ^| ^| ^|         ^|
echo 			^|           ^|   ^|   ^| ^| ^| ^| ^| ^|         ^|
echo 			^|           ^|___^|   ^| ^| ^| ^| ^| ^|         ^|

echo 			^|                                       ^| 
echo 			+-------+--------+-------+------+-------+


::time of running
set /p=".                Running Time: "<nul
echo                   %date% %time%
echo                                                  ===============================



echo.

echo                 +********************************************************+
echo                 ^|                     OperateSystemInfo                  ^|
echo                 +****************************+***************************+
set /p=     ".               | OS_Name:                   | "<nul 
echo %OS_Caption%
echo                 +----------------------------+----------------------------
set /p=     ".               | OS_Architecture:           | "<nul 
echo %OS_OSArchitecture%
echo                 +----------------------------+----------------------------
set /p=     ".               | OS_CSName:                 | "<nul 
echo %OS_CSName%
echo                 +----------------------------+----------------------------
set /p=     ".               | OS_TotalVirtualMemorySize: | "<nul 
echo %OS_TotalVirtualMemorySize% KiB  ≈  !b1!~!b2! G
echo                 +----------------------------+----------------------------
set /p=     ".               | OS_FreeVirtualMemory:      | "<nul 
echo %OS_FreeVirtualMemory% KiB  ≈  !a1!~!a2! G
echo                 +----------------------------+----------------------------



echo.

echo                 +********************************************************+
echo                 ^|                         CPUInfo                        ^|
echo                 +****************************+***************************+
set /p=     ".               | CPU_Name:                  | "<nul 
echo %CPU_Name%
echo                 +----------------------------+----------------------------
set /p=     ".               | CPU_NumberOfCores:         | "<nul 
echo %CPU_NumberOfCores%
echo                 +----------------------------+----------------------------
set /p=     ".               | CPU_No.OfLogicalProcessors | "<nul 
echo %CPU_NumberOfLogicalProcessors%
echo                 +----------------------------+----------------------------



echo.

echo                 +********************************************************+
echo                 ^|                       BaseBoardInfo                    ^|
echo                 +****************************+***************************+
set /p=     ".               | BaseBoard_Manufacturer:    | "<nul 
echo %BaseBoard_Manufacturer%
echo                 +----------------------------+----------------------------
set /p=     ".               | BaseBoard_Product:         | "<nul 
echo %BaseBoard_Product%
echo                 +----------------------------+----------------------------
set /p=     ".               | BaseBoard_SerialNumber:    | "<nul 
echo %BaseBoard_SerialNumber%
echo                 +----------------------------+----------------------------



echo.

echo                 +********************************************************+
echo                 ^|                         MemoryInfo                     ^|
echo                 +****************************+***************************+
set /p=     ".               | OS_FreePhysicalMemory:     | "<nul 
echo %OS_FreePhysicalMemory% KiB  ≈  !c1!~!c2! G
echo                 +----------------------------+----------------------------
set /p=     ".               | OS_TotalVisibleMemorySize: | "<nul 
echo %OS_TotalVisibleMemorySize% KiB  ≈  !d1!~!d2! G
echo                 +----------------------------+----------------------------


echo.

echo                 +********************************************************+
echo                 ^|                          BIOSInfo                      ^|
echo                 +****************************+***************************+
set /p=     ".               | BIOS_BIOSVersion:          | "<nul 
echo %BIOS_BIOSVersion%
echo                 +----------------------------+----------------------------




echo.


echo                 +********************************************************+
echo                 ^|                     StorageSpace                       ^|
echo                 +********************************************************+
set _               +  StorageSpace_
echo                 +---------------------------------------------------------


echo.

echo                 +********************************************************+
echo                 ^|                     HardDiskInfo                       ^|
echo                 +********************************************************+
set .               +  HardDisk_
echo                 +---------------------------------------------------------




echo.

echo                 +********************************************************+
echo                 ^|                          IPInfo                        ^|
echo *********************************************+*************************************************************************
wmic nicconfig where IPEnabled=TRUE get Description,IPAddress,IPSubnet,MacAddress 
echo ***********************************************************************************************************************



echo.
echo                 +--------------------------------------------------------+ 
echo                 ^|------------------------finished------------------------^|
echo                 +--------------------------------------------------------+ 
echo. 



pause


::end
pause

::version histort
::v1.0->v1.1
::1、美化了输出格式,用“ ” 代替了 “.”；
::2、将磁盘分区和硬盘信息分开显示
::
::v1.1->v1.2
::1、修正了磁盘单位错误（原来写的是Kib，实际是Byte）
::2、采用了非向后兼容的方式了kib到G的近似转换
::3、基本满足要求，适用一段时间后，打算清理成v2.0版本
::
::v1.2->v2.0 
::1、修改了一些基本信息，没有太大的改变
::
::v2.0->v2.1
::1、修复了存在多个硬盘时格式显示错乱的问题
::2、使用标准的约等于号表示约等于关系
::3、添加IP地址查询
::
::v2.1->v2.2
::1、更新了KB转GB的算法
::2、修复当硬盘容量达到T级别时，容量显示错误的问题
::3、完善了部分注释，便于维护


::----------以下内容为函数--------------

:StringLenth
::---------字符串长度计算子程序
::---------参数%1为字符串(如有空格，请用引号括起来)
::---------参数%2为返回变量名称，不能含空格或特殊字符
::---------调用：call :stringlenth "123456" num2
::@echo off
set theString=%~1
if not defined theString goto :eof
set Return=0
:StringLenth_continue
set /a Return+=1
set thestring=%thestring:~0,-1%
if defined thestring goto StringLenth_continue
if not "%2"=="" set %2=%Return%
goto :eof


:division
::---------除法计算子程序
::---------参数%1为被除数
::---------参数%2为除数
::---------参数%3为计算结果
::---------参数%4为精确度（小数点后保留几位）
::---------调用：call:division 9985559470080000000000000000 1000 quot 0
::@echo off
setlocal
set str1=%1
set str2=%2
if "%~4" neq "" set u=%4
for %%i in (str1 str2) do if "!%%i:~,1!" == "-" set /a d+=1
if "%d%" == "1" (set d=-) else set "d="
set l=00000000&for /l %%i in (1 1 7) do set "l=!l!!l!"
set "var=4096 2048 1024 512 256 128 64 32 16 8 4 2 1"
for /l %%i in (1 1 2) do (
    set "str%%i=!str%%i:-=!"
    set /a "n=str%%i_2=0"
    for %%a in (!str%%i:.^= !) do (
        set /a n+=1
        set s=s%%a&set str%%i_!n!=0
        for %%b in (%var%) do if "!S:~%%b!" neq "" set/a str%%i_!n!+=%%b&set "S=!S:~%%b!"
        set /a len%%i+=str%%i_!n!
    )
        set str%%i=!str%%i:.=!
)
if !str1_2! gtr !str2_2! (set /a len2+=str1_2-str2_2) else set /a len1+=str2_2-str1_2
for /l %%i in (1 1 2) do (
    set str%%i=!str%%i!!l!
    for %%j in (!len%%i!) do set " str%%i=!str%%i:~,%%j!"
)
for /f "tokens=* delims=0" %%i in ("!str2!") do set s=%%i&set "str2=0%%i"
set len2=1
for %%j in (%var%) do if "!S:~%%j!" neq "" set/a len2+=%%j&set "S=!S:~%%j!"
set /a len=len2+1
if !len1! lss !len2! set len1=!len2!&set "str1=!l:~-%len2%,-%len1%!!str1!"
set /a len1+=u&set str1=0!str1!!l:~,%u%!
set str=!str1:~,%len2%!
set "i=0000000!str2!"&set /a Len_i=Len2+7
for /l %%i in (1 1 9) do (
    set "T=0"
    for /l %%j in (8 8 !Len_i!) do (
        set /a "T=1!i:~-%%j,8!*%%i+T"
        set Num%%i=!T:~-8!!Num%%i!&set /a "T=!T:~,-8!-%%i"
    )
    set Num%%i=!T!!Num%%i!
    set "Num%%i=0000000!Num%%i:~-%Len%!"
)
for /L %%a in (!len2! 1 !Len1!) do (
    set "str=!L!!str!!str1:~%%a,1!"
    set "str=!str:~-%Len%!"
    if "!str!" geq "!str2!" (
       set M=1&set i=0000000!str!
       for /l %%i in (2 1 9) do if "!i!" geq "!Num%%i!" set "M=%%i"
           set sun=!sun!!M!&set str=&set T=0
           for %%i in (!M!) do (
               for /l %%j in (8 8 !Len_i!) do (
                   set /a "T=3!i:~-%%j,8!-1!Num%%i:~-%%j,8!-!T:~,1!%%2"
                   set "str=!T:~1!!str!"
               )
           )
    ) else set sun=!sun!0
)
if defined u if "%u%" gtr "0" set sun=!sun:~,-%u%!.!sun:~-%u%!
endlocal&set %3=%d%%sun%
goto :eof



:jian 
::---------减法计算子程序
::---------参数%1为被减数
::---------参数%2为减数
::---------参数%3为计算结果
::---------调用：call :jian 354687654165435 35486456 ok
::@echo off
setlocal enabledelayedexpansion&&set t=&set f=&set "lin="
for /l %%a in (1 1 10) do set "lin=0000000000!lin!"
set lin=!lin!!lin!!lin!!lin!!lin!&set "lin=!lin!!lin!"
set var1=!lin!%~1&set var2=!lin!%~2&set vard1=&set/a j=0
set var1=!var1:~-1000!&set "var2=!var2:~-1000!"
if "!var1!" lss "!var2!" (set var1=%~2&set "var2=%~1"
set "f=-") else set var1=%~1&set "var2=%~2"
for /l %%a in (0 1 9) do set "var1=!var1:%%a= %%a !"
for %%a in (!var1!) do set "vard1=%%a !vard1!"
for %%a in (!vard1!) do (if "!var2!"=="" set/a var2=0
set /a a=%%a-j,b=!var2:~-1!
if !a! lss !b! (set /a a+=10,j=1)else set /a j=0
set /a w=a-b&set t=!w!!t!&set var2=!var2:~0,-1!)
for /f "tokens=* delims=0" %%a in ("!t!") do (
if "%%a"=="" (set t=0) else set "t=%%a")
Endlocal&set %~3=%f%%t%&goto :EOF


:fix
::---------提供对!TEMP_Capacity:~0,!y!!语法的支持
::---------调用：call :fix !ok!  express
set "y=%~1"
set ret=!TEMP_Capacity:~0,%y%!
if not "%2"=="" set %2=%ret%
goto :eof

:fixsize
set "y=%~1"
set ret=!TEMP_Size:~0,%y%!
if not "%2"=="" set %2=%ret%
goto :eof
::-------------------------------------------------------------

::-------------------------声明-------------------------------
::    此工具为杭州杏林信息科技有限公司原创，如若在此基础上进行修改，
::请说明参照来源：杭州杏林信息科技有限公司研发部。谢谢！
