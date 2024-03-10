GCC_LIB_DIRS = $(wildcard /usr/lib/gcc/$(shell uname -m)-linux-gnu/*)

build: src/*.cc
	g++ -c src/*.cc
	ar -crv libmocutils.a *.o

install: build
	@-mkdir /usr/include/mocutils
	@-mkdir /usr/lib/mocutils
	@-mkdir /usr/lib/gcc/$(shell uname -m)-linux-gnu/mocutils
	cp src/*.h /usr/include/mocutils/
	cp libmocutils.a /usr/lib/mocutils/
	$(foreach dir, $(GCC_LIB_DIRS), cp libmocutils.a $(dir)/)

clean:
	rm -rf *.o
	rm -rf *.a
