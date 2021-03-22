ALL = s-h s-mk s-wc

all: ${ALL}

s-h: s-c
	ln -sf $< $@

s-mk: f-Makefile
	ln -sf $< $@

s-wc: s-w
	ln -sf $< $@

clean:
	${RM} ${ALL}
	
