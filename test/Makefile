FC = mpifort
CC = mpicc

# must make in SRC_DIR first
#
SRC_DIR = ../src

FFLAGS = -I $(SRC_DIR)

OBJS = wmpi-f2c.o
SRC_OBJS = $(SRC_DIR)/wmpi-types.o $(SRC_DIR)/wmpi-f2c-interfaces.o \
           $(SRC_DIR)/mpi-f08-ctools.o $(SRC_DIR)/wmpi_c.o

.SUFFIXES: .F90 .c .o

.F90.o:
	$(FC) -c $(FFLAGS) $(@:.o=.F90)

.c.o:
	$(CC) -c $(@:.o=.c)

all: $(OBJS) test-wmpi-types test-wmpi

test-wmpi-types: test-wmpi-types.o $(OBJS)
	$(FC) -o test-wmpi-types test-wmpi-types.o $(OBJS) $(SRC_OBJS)

test-wmpi: test-wmpi.o $(OBJS)
	$(FC) -o test-wmpi test-wmpi.o $(OBJS) $(SRC_OBJS)

check: test-wmpi-types test-wmpi
	@mpirun -np 2 test-wmpi

clean:
	rm -f $(OBJS) test-wmpi-types
