# Makefile for copy-android-apps

install: get-android-apps put-android-apps adb-sendkey
	cp -p $^ ~/bin
