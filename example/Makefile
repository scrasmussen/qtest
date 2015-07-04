#
# Makefile
# 2015 06 11
#
F08=mpifort
CC=mpiicc
FLAGS=

all: run

run: main.o mpi_f08_ctools.o mpi_interfaces.o ctool.o wmpi_c.o
	$(F08) -o run.out wmpi_c.o ctool.o mpi_f08_ctools.o mpi_interfaces.o main.o

wmpi_c.o: wmpi_c.c
	$(CC) -c wmpi_c.c

mpi_f08_ctools.o: mpi_f08_ctools.f90
	$(F08) -c mpi_f08_ctools.f90

mpi_init.o: mpi_init.f90
	$(F08) -c mpi_init.f90

mpi_interfaces.o: mpi_interfaces.f90
	$(F08) -c mpi_interfaces.f90

ctool.o: ctool.c
	$(CC) -c ctool.c

main.o: main.f90
	$(F08) -c main.f90

job: moabjob
	@msub -V moabjob

clean:
	@echo "Cleaning..."
	-@rm run.out
	-@rm output.moabjob
	-@rm *.mod
	-@rm *.o
	-@rm *~
