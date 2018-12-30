@echo on
set db_bin_dir=C:\Program Files (x86)\MySQL\MySQL Workbench 6.1
set db_path=E:\DB_Backup\
set db_user=root
set db_pwd=~root!
set db_name=hehe

cd %db_bin_dir%
md %db_path%
set ymd=%date:~0,4%%date:~5,2%%date:~8,2%
set his=%time:~0,2%%time:~3,2%
set file_type=.sql

set file_name=%ymd%%file_type%

mysqldump.exe --opt -u%db_user% -p%db_pwd% %db_name%>%db_path%%file_name%

echo 数据已经成功备份到%db_path%%file_name%
@echo off
