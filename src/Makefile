FC = mpifort
CC = mpicc

OBJS = wmpi-types.o wmpi-f2c-interfaces.o wmpi-ctool-interfaces.o mpi-f08-ctools.o wmpi_c.o

.SUFFIXES: .F90 .c .o

.F90.o:
	$(FC) -c $(@:.o=.F90)

.c.o:
	$(CC) -c $(@:.o=.c)

all: $(OBJS)

clean:
	rm -f $(OBJS) *.mod
