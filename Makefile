test-signals-genmarshal: test-signals.c test-marshal.h test-marshal.c Makefile
	gcc -Wall `pkg-config --cflags --libs gobject-2.0` -o $@ test-marshal.c test-signals.c

test-signals-generic: test-signals.c test-marshal.h test-marshal.c Makefile
	gcc -DUSE_GENERIC_MARSHALLER=1 -Wall `pkg-config --cflags --libs gobject-2.0` -o $@ test-marshal.c test-signals.c


test-marshal.h: test-marshal.list Makefile
	glib-genmarshal --prefix=_test_marshal --header >$@.tmp $< && mv $@.tmp $@

test-marshal.c: test-marshal.list Makefile
	glib-genmarshal --prefix=_test_marshal --body >$@.tmp $< && mv $@.tmp $@
