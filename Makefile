# Makefile for copy-android-apps

INSTDIR=~/bin

install: get-android-apps put-android-apps
	tar -cf - $^ | (cd $(INSTDIR); tar -xvf -)

diff: get-android-apps put-android-apps
	$(foreach i,$^,diff -u $(INSTDIR)/$i $i;)
