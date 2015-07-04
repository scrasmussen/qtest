FC = mpifort
CC = mpicc

# must make in SRC_DIR first
#
SRC_DIR = ../src

FFLAGS = -I $(SRC_DIR)

OBJS = wmpi-f2c.o test-wmpi-types.o
SRC_OBJS = $(SRC_DIR)/wmpi-types.o $(SRC_DIR)/wmpi-f2c-interfaces.o

.SUFFIXES: .F90 .c .o

.F90.o:
	$(FC) -c $(FFLAGS) $(@:.o=.F90)

.c.o:
	$(CC) -c $(@:.o=.c)

all: $(OBJS) test-wmpi-types

test-wmpi-types: $(OBJS)
	$(FC) -o test-wmpi-types $(OBJS) $(SRC_OBJS)

check: test-wmpi-types
	@test-wmpi-types

clean:
	rm -f $(OBJS) test-wmpi-types
