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

MPI_Info WMPI_Info_f2c(MPI_Fint f_info)
{
   MPI_Info c_info;

   c_info = MPI_Info_f2c(f_info);

   printf("\nf_info == %d, sizeof(MPI_Fint) == %ld\n", f_info, sizeof(MPI_Fint));
   printf("sizeof(MPI_Info) == %ld\n", sizeof(MPI_Info));

   if (c_info == MPI_INFO_NULL) {
      printf("YEA!, MPI_INFO_NULL==MPI_INFO_NULL!\n");
   } else {
      printf("BOO!, MPI_INFO_NULL!=MPI_INFO_NULL!\n");
   }

   return c_info;
}

MPI_Message WMPI_Message_f2c(MPI_Fint f_message)
{
   MPI_Message c_message;

   c_message = MPI_Message_f2c(f_message);

   printf("\nf_message == %d, sizeof(MPI_Fint) == %ld\n", f_message, sizeof(MPI_Fint));
   printf("sizeof(MPI_Message) == %ld\n", sizeof(MPI_Message));

   if (c_message == MPI_MESSAGE_NULL) {
      printf("YEA!, MPI_MESSAGE_NULL==MPI_MESSAGE_NULL!\n");
   } else {
      printf("BOO!, MPI_MESSAGE_NULL!=MPI_MESSAGE_NULL!\n");
   }

   return c_message;
}

MPI_Op WMPI_Op_f2c(MPI_Fint f_op)
{
   MPI_Op c_op;

   c_op = MPI_Op_f2c(f_op);

   printf("\nf_op == %d, sizeof(MPI_Fint) == %ld\n", f_op, sizeof(MPI_Fint));
   printf("sizeof(MPI_Op) == %ld\n", sizeof(MPI_Op));

   if (c_op == MPI_OP_NULL) {
      printf("YEA!, MPI_OP_NULL==MPI_OP_NULL!\n");
   } else {
      printf("BOO!, MPI_OP_NULL!=MPI_OP_NULL!\n");
   }

   return c_op;
}

MPI_Request WMPI_Request_f2c(MPI_Fint f_request)
{
   MPI_Request c_request;

   c_request = MPI_Request_f2c(f_request);

   printf("\nf_request == %d, sizeof(MPI_Fint) == %ld\n", f_request, sizeof(MPI_Fint));
   printf("sizeof(MPI_Request) == %ld\n", sizeof(MPI_Request));

   if (c_request == MPI_REQUEST_NULL) {
      printf("YEA!, MPI_REQUEST_NULL==MPI_REQUEST_NULL!\n");
   } else {
      printf("BOO!, MPI_REQUEST_NULL!=MPI_REQUEST_NULL!\n");
   }

   return c_request;
}
