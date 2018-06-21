# Makefile for copy-android-apps

install: get-android-apps put-android-apps adb-sendkey adb_echo_result adb_return_result adb_shell
	tar -cf - $^ | (cd ~/bin; tar -xvf -)
