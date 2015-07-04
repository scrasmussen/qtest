FC = mpifort
CC = mpicc

OBJS = wmpi-types.o wmpi-f2c-interfaces.o wmpi-f2c.o test-wmpi-types.o

.SUFFIXES: .F90 .c .o

.F90.o:
	$(FC) -c $(@:.o=.F90)

.c.o:
	$(CC) -c $(@:.o=.c)


all: $(OBJS) test-wmpi-types

test-wmpi-types: $(OBJS)
	$(FC) -o test-wmpi-types $(OBJS)

check: test-wmpi-types
	@test-wmpi-types

clean:
	rm -f $(OBJS) test-wmpi-types
