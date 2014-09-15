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
mode con cols=150 lines=100 >nul 2>nul
title=XingLinTech  v=2.1  support:shaozl@xinglin-tech.com>nul 2>nul
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

    if !num! EQU 13 (
     set /a e1=!TEMP_Size:~0,4!/1
    )

    if !num! EQU 11 (
      set /a e1=!TEMP_Size:~0,2!/1
    )

    if !num! EQU 10 (
       set /a e1=!TEMP_Size:~0,1!/1
    )
    
    if !num! EQU 12 (
      set /a e1=!TEMP_Size:~0,3!/1
    )

    if !num! GTR 9 if not "!TEMP_Caption:~1,1!" == ":"   if defined TEMP_Size set .               +  HardDisk_!TEMP_Caption:~0,-1!=!TEMP_Size:~0,-1! Byte  ≈  !e1! G   &set TEMP_Caption=&set TEMP_Size=

)


for /f "delims=" %%l in ('wmic volume get DriveLetter^,Capacity /format:list') do (
    >nul 2>&1 set "TEMP_%%l"

    call :stringlenth "!TEMP_Capacity:~0,-1!" num2
    echo !num2! >nul 2>nul

    if !num2! EQU 13 (
     set /a e2=!TEMP_Capacity:~0,4!/1
    )

    if !num2! EQU 11 (
      set /a e2=!TEMP_Capacity:~0,2!/1
    )

    if !num2! EQU 10 (
       set /a e2=!TEMP_Capacity:~0,1!/1
    )
    
    if !num2! EQU 12 (
      set /a e2=!TEMP_Capacity:~0,3!/1
    )


    
    if !num2! GTR 9 if "!TEMP_DriveLetter:~1,1!"==":" if defined TEMP_Capacity  set _               +  StorageSpace_!TEMP_DriveLetter:~0,2!=!TEMP_Capacity:~0,-1! Byte  ≈  !e2! G  &set TEMP_DriveLetter=&set TEMP_Capacity=

)




::Change Kib to G 
set /a a2=%OS_FreeVirtualMemory%/1000/1000
set /a a1=%OS_FreeVirtualMemory%/1024/1024
set /a b2=%OS_TotalVirtualMemorySize%/1000/1000
set /a b1=%OS_TotalVirtualMemorySize%/1024/1024
set /a c2=%OS_FreePhysicalMemory%/1000/1000
set /a c1=%OS_FreePhysicalMemory%/1024/1024
set /a d2=%OS_TotalVisibleMemorySize%/1000/1000
set /a d1=%OS_TotalVisibleMemorySize%/1024/1024


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


::----------以下内容与实现无关--------------

:StringLenth
::---------字符串长度计算子程序
::---------参数%1为字符串(如有空格，请用引号括起来)
::---------参数%2为返回变量名称，不能含空格或特殊字符
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

::-------------------------------------------------------------

::-------------------------声明-------------------------------
::    此工具为杭州杏林信息科技有限公司原创，如若在此基础上进行修改，
::请说明参照来源：杭州杏林信息科技有限公司研发部。谢谢！
