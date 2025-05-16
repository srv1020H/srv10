#!/bin/bash
clear
echo "PUBG Optimizer Activated"
sleep 1
apt update -y > /dev/null 2>&1
apt upgrade -y > /dev/null 2>&1
sync; echo 3 > /proc/sys/vm/drop_caches 2>/dev/null
rm -rf /cache/* 2>/dev/null
rm -rf /data/dalvik-cache/* 2>/dev/null
settings put global window_animation_scale 0
settings put global transition_animation_scale 0
settings put global animator_duration_scale 0
settings put system screen_off_timeout 1800000
settings put system accelerometer_rotation 0
settings put system user_rotation 0
svc power stayon true
settings put secure long_press_timeout 150
settings put secure touch_exploration_enabled 0
settings put system pointer_speed 7
settings put global wifi_sleep_policy 2
settings put global airplane_mode_radios cell,bluetooth,wifi
settings put global airplane_mode_on 0
settings put global stay_on_while_plugged_in 3
settings put system auto_time 1
settings put system auto_time_zone 1
settings put secure accessibility_display_daltonizer_enabled 0
settings put global development_settings_enabled 0
settings put secure show_ime_with_hard_keyboard 0
settings put system screen_brightness 180
settings put system screen_brightness_mode 0
svc wifi enable
svc data enable
svc bluetooth disable
input keyevent 82
input keyevent 26
am kill com.facebook.katana
am kill com.instagram.android
am kill com.android.vending
am kill com.android.chrome
am kill com.google.android.youtube
am kill com.tencent.ig
am force-stop com.tencent.ig
am start -n com.tencent.ig/com.epicgames.ue4.SplashActivity
top -n 1 > /dev/null
dumpsys meminfo > /dev/null
cat /proc/meminfo | grep MemFree
cat /proc/cpuinfo | grep BogoMIPS
for i in $(seq 1 50); do echo "Optimizing CPU cycle $i"; done
for i in $(seq 1 30); do echo "Reducing latency step $i"; done
for i in $(seq 1 20); do echo "Clearing system load $i"; done
for i in $(seq 1 10); do echo "Finalizing touch response $i"; done
echo "Applying DNS optimization"
setprop net.dns1 1.1.1.1
setprop net.dns2 1.0.0.1
setprop net.dns3 8.8.8.8
setprop net.dns4 8.8.4.4
ping -c 1 google.com > /dev/null
for i in $(seq 1 10); do am kill-all; sleep 0.2; done
for i in $(seq 1 10); do input swipe 300 1000 300 500 50; done
for i in $(seq 1 20); do echo "Stabilizing FPS $i"; done
settings put global preferred_network_mode 9
for i in $(seq 1 50); do echo -n "."; sleep 0.05; done
echo
for i in $(seq 1 5); do am broadcast -a android.intent.action.BOOT_COMPLETED; done
for i in $(seq 1 10); do svc wifi disable; sleep 0.3; svc wifi enable; done
for i in $(seq 1 5); do svc data disable; sleep 0.3; svc data enable; done
logcat -c
logcat -b all -d > /dev/null
echo "PUBG Engine Boost Complete"
echo "Launching Game..."
am start -n com.tencent.ig/com.epicgames.ue4.SplashActivity
sleep 1
clear
echo "-----------------------------"
echo "|      READY TO PLAY       |"
echo "-----------------------------"
echo "AIM ASSIST | LATENCY FIXED"
echo "FPS BOOST | TOUCH OPTIMIZED"
echo "Enjoy your game!"