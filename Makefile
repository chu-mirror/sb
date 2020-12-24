
PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
INCLUDE = $(PREFIX)/include

SB_INCLUDE = $(INCLUDE)/sb
SB_CONFS = \$$HOME/.sbs

SB_CONFS_EXAMPLE = chu-sbs

DEBUG = NO

ALL = sb sbv ssb 
SCRIPTS = conf-macro1.sed conf-macro2.sed \
	macro-ex.m4 ex.m4

.POSIX:
.SUFFIXES:

.SUFFIXES: .sh .m4
.sh:
	cp $< $@
	chmod +x $@
.m4.sh:
	m4	-DSB_INCLUDE=$(SB_INCLUDE) \
		-DSB_CONFS=$(SB_CONFS) \
		-DDEBUG=$(DEBUG) \
		$< > $@

all: $(ALL)

install: 
	cp -P $(ALL) $(BINDIR)
	[ -d $(SB_INCLUDE) ] || mkdir -p $(SB_INCLUDE)
	cp $(SCRIPTS) $(SB_INCLUDE)

install-example-confs:
	cp -r $(SB_CONFS_EXAMPLE) $(SB_CONFS)

clean:
	rm -f $(ALL)

uninstall:
	cd $(BINDIR) && rm -f $(ALL)
	rm -rf $(SB_INCLUDE)

sbv: sb
	ln -s sb sbv

