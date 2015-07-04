FC = mpifort

OBJS = wmpi-types.o wmpi-f2c-interfaces.o

.SUFFIXES: .F90 .o

.F90.o:
	$(FC) -c $(@:.o=.F90)

all: $(OBJS)

clean:
	rm -f $(OBJS) *.mod
