# Makefile for copy-android-apps

BINDIR=$(HOME)/bin
BINFILES=get-android-apps put-android-apps globmatch.sh in_args.sh run.sh adbwrappers.sh glitch.sh
ETCDIR=$(HOME)/etc
ETCFILES=adb-backup-glitch.list
IMPORTDIR1=../adbtools
IMPORTFILES1=adb_shell adb-sendkey adb-parsedev

install: install-bin install-etc

install-bin: $(BINFILES)
	install --target-directory=$(BINDIR) $^

install-etc: $(ETCFILES)
	install --target-directory=$(ETCDIR) $^

diff: $(BINFILES)
	$(foreach i,$^,diff -u $(BINDIR)/$i $i;)

prepare: $(IMPORTFILES1)

clean:
	rm -f $(IMPORTFILES1)

$(IMPORTFILES1): $(IMPORTDIR1)
	ln -sf $(addprefix $^/,$@) .

$(IMPORTDIR1):
	cd $(dir $@) && git clone git@github.com:for2ando/copy-android-apps.git $(notdir $@)
