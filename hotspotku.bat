@echo off
:disclaimer
rem This mini tool was created by Richad Avianto - @aviantorichad
title @aviantorichad - HotspotKu
mode 65,8
echo Pastikan tool ini berjalan sebagai Administrator!
echo.
pause
goto setup

:setup
cls
echo Silahkan masukkan nama SSID dan Password sesuai keinginan anda.
echo ------- x = Exit
set "ssid=99"
set "pass=99"
set "aktif=99"
set/p "ssid=SSID        : "
if %ssid%==99 ( goto setup )
if %ssid%==x ( goto exit )
if %ssid%==X ( goto exit )
set/p "pass=Password[8] : "
if %pass%==99 ( goto setup )
if %pass%==x ( goto exit )
if %pass%==X ( goto exit )
set "mode=allow"
echo.
set/p "aktif=Aktifkan hotspot sekarang ?[y/n] "
if %aktif%==99 ( goto setup )
if %aktif%==x ( goto exit )
if %aktif%==X ( goto exit )
if %aktif%==n ( goto exit )
if %aktif%==N ( goto exit )
if %aktif%==y ( goto apply )
if %aktif%==Y ( goto exit )
goto setup

:apply
netsh wlan set hostednetwork mode=allow ssid=%ssid% key=%pass%
if %errorlevel% equ 0 ( goto start ) else ( goto msgno )
goto start

:start
netsh wlan start hostednetwork
goto finish

:finish
pause
if %errorlevel% equ 0 ( goto msgok ) else ( goto msgno )
goto exit

:msgok
msg * [SUKSES] Hotspot is ready to use with SSID : %ssid% and Password : %pass%
goto exit

:msgno
msg * [GAGAL] Password minimal 8 karakter dan ingat! Tool ini harus dijalankan sebagai Administrator

:exit
set ssid=
set pass=
set aktif=
exit