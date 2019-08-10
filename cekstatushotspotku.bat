@echo off
title Cek Status :: HOTSPOTKU ::
netsh WLAN show hostednetwork
pause
echo ----------------------------------------------------------------------------
netsh WLAN show drivers
pause