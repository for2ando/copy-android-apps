# Makefile for copy-android-apps

INSTDIR=~/bin
INSTFILES=get-android-apps put-android-apps

install: $(INSTFILES)
	install --target-directory=$(INSTDIR) $^

diff: $(INSTFILES)
	$(foreach i,$^,diff -u $(INSTDIR)/$i $i;)
