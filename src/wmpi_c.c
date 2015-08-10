#include <stdio.h>
#include <mpi.h>

#include "wmpi_f.h"
#undef VERBOSE
#undef STATUSVERBOSE

/* This is called from WMPI_Init C function */
int WMPI_Init_C(int fflag)
{
  int ierror;

  if (fflag == 1) {
    #ifdef VERBOSE
    printf(" WMPI_Init_C: before calling WMPI_Init_F\n");
    #endif
    WMPI_Init_F(&ierror);
  }
  else {
    // CONFIRM THAT THIS IS HOW WE WANT TO HANDLE THIS CASE
    #ifdef VERBOSE
    printf(" WMPI_Init_C: before calling PMPI_Init\n");
    #endif
    int argc; char **argv;
    ierror = PMPI_Init(&argc, &argv);
  }

  #ifdef VERBOSE
  printf(" WMPI_Init_C: after\n");
  #endif
  return ierror;
}

/* This is called from WMPI_Finalize C function */
int WMPI_Finalize_C(int fflag)
{
  int ierror;

  if (fflag == 1) {
    #ifdef VERBOSE
    printf(" WMPI_Finalize_C: before calling WMPI_Finalize_F\n");
    #endif
    WMPI_Finalize_F(&ierror);
  }
  else {
    #ifdef VERBOSE
    printf(" WMPI_Finalize_C: before calling PMPI_Finalize\n");
    #endif
    ierror = PMPI_Finalize();
  }
  #ifdef VERBOSE
  printf(" WMPI_Finalize_C: after\n");
  #endif
  return ierror;
}

/* This is called from WMPI_Comm_rank C function */
int WMPI_Comm_rank_C(MPI_Comm comm, int * rank, int fflag)
{
  int ierror;
  int f_comm;

  if (fflag == 1) {
    #ifdef VERBOSE
    printf(" WMPI_Comm_rank_C: before calling WMPI_Comm_rank_F\n");
    #endif
    f_comm = MPI_Comm_c2f(comm);
    WMPI_Comm_rank_F(f_comm, rank, &ierror);
  }
  else {
    #ifdef VERBOSE
    printf(" WMPI_Comm_rank_C: before calling PMPI_Comm_rank\n");
    #endif
    ierror = PMPI_Comm_rank(comm, rank);
  }
  #ifdef VERBOSE
  printf(" WMPI_Comm_rank_C: after, rank==%d\n", *rank);
  #endif
  return ierror;
}

/* This is called from WMPI_Recv C function */
int WMPI_Send_C(void *buf, int count, MPI_Datatype datatype, int dest, int tag, MPI_Comm comm, int fflag)
{
  int ierror;
  int f_comm, f_datatype;

  if (fflag == 1) {
    #ifdef VERBOSE
    printf(" WMPI_Send_C: before calling WMPI_Send_F\n");
    #endif
    f_comm = MPI_Comm_c2f(comm);
    f_datatype = MPI_Type_c2f(datatype);
    WMPI_Send_F(buf, count, f_datatype, dest, tag, f_comm, &ierror);
  }
  else {
    #ifdef VERBOSE
    printf(" WMPI_Send_C: before calling PMPI_Send\n");
    #endif
    ierror = PMPI_Send(buf, count, datatype, dest, tag, comm);
  }
  #ifdef VERBOSE
  printf(" WMPI_Send_C: after\n");
  #endif
  return ierror;
}

/* This is called from WMPI_Recv C function */
int WMPI_Recv_C(void *buf, int count, MPI_Datatype datatype, int source, int tag, MPI_Comm comm, MPI_Status *status, int fflag)
{
  int ierror, status_error;
  /* Fortran status (use mpi version) must be an array to have proper size */
  int f_comm, f_datatype, f_status[MPI_FORTRAN_STATUS_SIZE];

  if (fflag == 1) {
    #ifdef STATUSVERBOSE
    printf(" WMPI_Recv_C: before calling WMPI_Recv_F\n");
    #endif
    printf("      fflag==%d\n", fflag);
    f_comm = MPI_Comm_c2f(comm);
    printf("      fflag==%d\n", fflag);
    f_datatype = MPI_Type_c2f(datatype);
    printf("      fflag==%d\n", fflag);
    // WARNING!!! :: NEED TO MAKE SURE THIS WORKS CORRECTLY
    // This call seems to be correct by returned status should be checked
    status_error = MPI_Status_c2f(status, f_status);
    if (status_error != MPI_SUCCESS) printf("ERROR: MPI_Status_c2f returned error value %d\n", status_error);
    printf("      fflag==%d\n", fflag);

    WMPI_Recv_F(buf, count, f_datatype, source, tag, f_comm, f_status, &ierror);
    printf("      fflag==%d\n", fflag);
  }
  else {
#ifdef STATUSVERBOSE
    printf(" WMPI_Recv_C: before calling PMPI_Recv\n");
#endif
    ierror = PMPI_Recv(buf, count, datatype, source, tag, comm, status);
  }

#ifdef STATUSVERBOSE
  printf(" WMPI_Recv_C: after\n");
#endif

  return ierror;
}

int WMPI_Get_processor_name_C(char * name, int * resultlen, int fflag)
{
  int ierror;

  if (fflag == 1) {
#ifdef STATUSVERBOSE
    printf(" WMPI_Get_processor_name_C: before calling WMPI_Get_processor_name_F\n");
#endif
    WMPI_Get_processor_name_F(name, resultlen, &ierror);
  }
  else {
#ifdef STATUSVERBOSE
    printf(" WMPI_Get_processor_name_C: before calling PMPI_Get_processor_name\n");
#endif
    ierror = PMPI_Get_processor_name(name, resultlen);
  }

#ifdef STATUSVERBOSE
  printf(" WMPI_Get_processor_name_C: after\n");
#endif

  return ierror;
}
