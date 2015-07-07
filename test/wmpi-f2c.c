/*
 *  This file is for testing purposes.  The actual C MPI_X_f2c routines
 *  can be used (but must be named properly in ../src/wmpi-f2c-interfaces.F90)
 */

#include <mpi.h>
#include <stdio.h>

MPI_Comm WMPI_Comm_f2c(MPI_Fint f_comm)
{
   MPI_Comm c_comm;

   c_comm = MPI_Comm_f2c(f_comm);

   printf("f_comm == %d, sizeof(MPI_Fint) == %ld\n", f_comm, sizeof(MPI_Fint));
   printf("sizeof(MPI_Comm) == %ld\n", sizeof(MPI_Comm));

   if (c_comm == MPI_COMM_WORLD) {
      printf("YEA!, MPI_COMM_WORLD==MPI_COMM_WORLD!\n");
   } else {
      printf("BOO!, MPI_COMM_WORLD!=MPI_COMM_WORLD!\n");
   }

   return c_comm;
}

MPI_Datatype WMPI_Type_f2c(MPI_Fint f_datatype)
{
   MPI_Datatype c_datatype;

   c_datatype = MPI_Type_f2c(f_datatype);

   printf("f_datatype == %d, sizeof(MPI_Fint) == %ld\n", f_datatype, sizeof(MPI_Fint));
   printf("sizeof(MPI_Datatype) == %ld\n", sizeof(MPI_Datatype));

   if (c_datatype == f_datatype) {
      printf("YEA!, F_DATATYPE==C_DATATYPE!\n");
   } else {
      printf("BOO!, F_DATATYPE!=C_DATATYPE!\n");
   }

   return c_datatype;
}
