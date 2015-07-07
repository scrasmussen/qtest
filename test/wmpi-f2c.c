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

   printf("\nf_datatype == %d, sizeof(MPI_Fint) == %ld\n", f_datatype, sizeof(MPI_Fint));
   printf("sizeof(MPI_Datatype) == %ld\n", sizeof(MPI_Datatype));

   if (c_datatype == MPI_DATATYPE_NULL) {
      printf("YEA!, MPI_DATATYPE_NULL==MPI_DATATYPE_NULL!\n");
   } else {
      printf("BOO!, MPI_DATATYPE_NULL!=MPI_DATATYPE_NULL!\n");
   }


   return c_datatype;
}

MPI_Errhandler WMPI_Errhandler_f2c(MPI_Fint f_errhandler)
{
   MPI_Errhandler c_errhandler;

   c_errhandler = MPI_Errhandler_f2c(f_errhandler);

   printf("\nf_errhandler == %d, sizeof(MPI_Fint) == %ld\n", f_errhandler, sizeof(MPI_Fint));
   printf("sizeof(MPI_Errhandler) == %ld\n", sizeof(MPI_Errhandler));

   if (c_errhandler == MPI_ERRHANDLER_NULL) {
      printf("YEA!, MPI_ERRHANDLER_NULL==MPI_ERRHANDLER_NULL!\n");
   } else {
      printf("BOO!, MPI_ERRHANDLER_NULL!=MPI_ERRHANDLER_NULL!\n");
   }


   return c_errhandler;
}

MPI_Group WMPI_Group_f2c(MPI_Fint f_group)
{
   MPI_Group c_group;

   c_group = MPI_Group_f2c(f_group);

   printf("\nf_group == %d, sizeof(MPI_Fint) == %ld\n", f_group, sizeof(MPI_Fint));
   printf("sizeof(MPI_Group) == %ld\n", sizeof(MPI_Group));

   if (c_group == MPI_GROUP_NULL) {
      printf("YEA!, MPI_GROUP_NULL==MPI_GROUP_NULL!\n");
   } else {
      printf("BOO!, MPI_GROUP_NULL!=MPI_GROUP_NULL!\n");
   }


   return c_group;
}
