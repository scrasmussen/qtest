FC = mpifort
CC = mpicc

# must make in SRC_DIR first
#
SRC_DIR = ../src

FFLAGS = -I $(SRC_DIR)

TESTS = test-mpi_status test-send_recv get_processor_name
EXES = test-wmpi-types test-wmpi
OBJS = wmpi-f2c.o
SRC_OBJS = $(SRC_DIR)/wmpi-types.o $(SRC_DIR)/wmpi-f2c-interfaces.o \
           $(SRC_DIR)/mpi-f08-ctools.o \
           $(SRC_DIR)/wmpi.o $(SRC_DIR)/wmpi_c.o \
           $(SRC_DIR)/wmpi-ctools.o

.SUFFIXES: .F90 .c .o

.F90.o:
	$(FC) -c $(FFLAGS) $(@:.o=.F90)

.c.o:
	$(CC) -c $(@:.o=.c)

all: $(OBJS) $(EXES) $(TESTS)

test-wmpi-types: test-wmpi-types.o $(OBJS)
	$(FC) -o test-wmpi-types test-wmpi-types.o $(OBJS) $(SRC_OBJS)

test-wmpi: test-wmpi.o $(OBJS)
	$(FC) -o test-wmpi test-wmpi.o $(OBJS) $(SRC_OBJS)

test-mpi_status: test-mpi_status.F90
	$(FC) -o test-mpi_status $(FFLAGS) test-mpi_status.F90

test-send_recv: test-send_recv.F90
	$(FC) -o test-send_recv test-send_recv.F90

get_processor_name: get_processor_name.F90
	$(FC) -o $@ $<

check: $(TESTS)
	@echo "\nRunning test-mpi_status ..."
	@test-mpi_status
	@echo "\nRunning test-send_recv ...\n"
	@mpirun -np 1 test-send_recv

job: moabjob
	@msub -V moabjob

clean:
	rm -f $(OBJS) $(EXES) $(TESTS) *.o output.moabjob
