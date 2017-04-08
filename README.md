ComputerInfo
============

Computer Hardware Information(电脑硬件信息的bat脚本),包括内存、主板、bios、硬盘、分区等主要信息，主要采用了wmic

实现语言：bat

主要技术：wmic知识

注意事项：
双击打开文件后，若没有出现运行结果，请在按一下 <kbd>ENTER</kbd> 键

运行效果如下：

```batch


                        +-------+--------+-------+------+-------+
                        |         -----XingLinTech-----         |
                        |                                       |
                        |           |_|_|   |_|_| |_|_|         |
                        |            /|\     _|_   _|_          |
                        |          / _|_ \  | | | | | |         |
                        |           |   |   | | | | | |         |
                        |           |___|   | | | | | |         |
                        |                                       |
                        +-------+--------+-------+------+-------+
.                Running Time:                   2017/04/08 周六 17:05:35.42
                                                 ===============================

                +********************************************************+
                |                     OperateSystemInfo                  |
                +****************************+***************************+
.               | OS_Name:                   | Microsoft Windows 10 专业版
                +----------------------------+----------------------------
.               | OS_Architecture:           | 64 位
                +----------------------------+----------------------------
.               | OS_CSName:                 | SZL
                +----------------------------+----------------------------
.               | OS_TotalVirtualMemorySize: | 33423068 KiB  ≈  31~33 G
                +----------------------------+----------------------------
.               | OS_FreeVirtualMemory:      | 5921220 KiB  ≈  5~5 G
                +----------------------------+----------------------------

                +********************************************************+
                |                         CPUInfo                        |
                +****************************+***************************+
.               | CPU_Name:                  | Intel(R) Core(TM) i3-4130 CPU @ 3.40GHz
                +----------------------------+----------------------------
.               | CPU_NumberOfCores:         | 2
                +----------------------------+----------------------------
.               | CPU_No.OfLogicalProcessors | 4
                +----------------------------+----------------------------

                +********************************************************+
                |                       BaseBoardInfo                    |
                +****************************+***************************+
.               | BaseBoard_Manufacturer:    | ASUSTeK COMPUTER INC.
                +----------------------------+----------------------------
.               | BaseBoard_Product:         | B85M-E
                +----------------------------+----------------------------
.               | BaseBoard_SerialNumber:    | 140424294505665
                +----------------------------+----------------------------

                +********************************************************+
                |                         MemoryInfo                     |
                +****************************+***************************+
.               | OS_FreePhysicalMemory:     | 9247752 KiB  ≈  8~9 G
                +----------------------------+----------------------------
.               | OS_TotalVisibleMemorySize: | 33423068 KiB  ≈  31~33 G
                +----------------------------+----------------------------

                +********************************************************+
                |                          BIOSInfo                      |
                +****************************+***************************+
.               | BIOS_BIOSVersion:          | {"ALASKA - 1072009","BIOS Date: 01/06/14 15:21:49 Ver: 08.05"}
                +----------------------------+----------------------------

                +********************************************************+
                |                     StorageSpace                       |
                +********************************************************+
_               +  StorageSpace_C:=119087820800 Bytes  ≈  119 G
_               +  StorageSpace_D:=371056439296 Bytes  ≈  371 G
_               +  StorageSpace_E:=157286395904 Bytes  ≈  157 G
_               +  StorageSpace_F:=314571747328 Bytes  ≈  314 G
_               +  StorageSpace_G:=157286395904 Bytes  ≈  157 G
_               +  StorageSpace_H:=59466838016 Bytes  ≈  59 G
                +---------------------------------------------------------

                +********************************************************+
                |                     HardDiskInfo                       |
                +********************************************************+
.               +  HardDisk_KINGSTON SV300S37A120G=120031511040 Bytes  ≈  120 G
.               +  HardDisk_KINGSTON SV300S37A60G=60019868160 Bytes  ≈  60 G
.               +  HardDisk_ST1000DM003-1CH162=1000202273280 Bytes  ≈  1000 G
                +---------------------------------------------------------

                +********************************************************+
                |                          IPInfo                        |
*********************************************+*************************************************************************
Description                                 IPAddress                                      IPSubnet                 MACAddress
VMware Virtual Ethernet Adapter for VMnet8  {"192.168.40.1", "fe80::3cba:84f8:9dd1:bc63"}  {"255.255.255.0", "64"}  00:50:56:C0:00:08
VMware Virtual Ethernet Adapter for VMnet1  {"192.168.227.1", "fe80::b002:2b14:d735:2bf"}  {"255.255.255.0", "64"}  00:50:56:C0:00:01
Realtek PCIe GBE Family Controller          {"10.0.2.7", "fe80::405b:b89:28fa:5fce"}       {"255.255.255.0", "64"}  40:16:7E:71:71:E3

***********************************************************************************************************************

                +--------------------------------------------------------+
                |------------------------finished------------------------|
                +--------------------------------------------------------+

请按任意键继续. . .
```
