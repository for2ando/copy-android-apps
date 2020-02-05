# Makefile for copy-android-apps

BINDIR=$(HOME)/bin
BINFILES=get-android-apps put-android-apps globmatch.sh in_args.sh run.sh adbwrappers.sh
ETCDIR=$(HOME)/etc
ETCFILES=devices.adb-backup-glitch

install: install-bin install-etc

install-bin: $(BINFILES)
	install --target-directory=$(BINDIR) $^

install-etc: $(ETCFILES)
	install --target-directory=$(ETCDIR) $^

diff: $(BINFILES)
	$(foreach i,$^,diff -u $(BINDIR)/$i $i;)
