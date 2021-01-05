
PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
INCLUDE = $(PREFIX)/include
MANDIR = $(PREFIX)/share/man

SB_INCLUDE = $(INCLUDE)/sb
SB_CONFS = .sbs # path relative to $HOME

SB_CONFS_EXAMPLE = chu-sbs

DEBUG = NO

ALL = sb sbv ssb 
SCRIPTS = conf-macro1.sed conf-macro2.sed infile-conf.sed \
	macro-ex.m4 

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

install: install-man
	cp -P $(ALL) $(BINDIR)
	[ -d $(SB_INCLUDE) ] || mkdir -p $(SB_INCLUDE)
	cp $(SCRIPTS) $(SB_INCLUDE)

install-man:
	[ -d $(MANDIR)/man1 ] || mkdir -p $(MANDIR)/man1
	cp sb.1 $(MANDIR)/man1

install-example-confs:
	cp -r $(SB_CONFS_EXAMPLE) $(HOME)/$(SB_CONFS)

clean:
	rm -f $(ALL)

uninstall:
	cd $(BINDIR) && rm -f $(ALL)
	rm -rf $(SB_INCLUDE)

distribution:
	rm -rf $(SB_CONFS_EXAMPLE)
	cp -r ~/$(SB_CONFS) $(SB_CONFS_EXAMPLE)

sbv: sb
	ln -s sb sbv


