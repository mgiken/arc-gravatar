prefix = ${shell arc --show-prefix}

libdir = $(DESTDIR)/$(prefix)/lib/arc/site

all:

install:
	mkdir -p $(libdir)
	cp gravatar.arc $(libdir)/gravatar.arc

uninstall:
	rm -rf $(libdir)/gravatar.arc
