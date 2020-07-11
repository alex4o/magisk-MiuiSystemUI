pull:
	adb shell "su -c cat /system/priv-app/MiuiSystemUI/MiuiSystemUI.apk" > MiuiSystemUI.apk

update:
	java -jar ../smali-2.4.0.jar a out -o classes.dex
	zip MiuiSystemUI.apk classes.dex

push:
	adb shell "su -c mount -o remount,rw /"
	adb push MiuiSystemUI.apk /data/local/tmp
	adb shell "su -c mv /data/local/tmp/MiuiSystemUI.apk /system/priv-app/MiuiSystemUI"

module.zip:
	cd magisk && zip -r ../module.zip ./*
	adb push module.zip /sdcard
	
