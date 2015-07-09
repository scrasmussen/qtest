#include <stdio.h>
#include <mpi.h>

#include "wmpi_f.h"


/* This is called from WMPI_Init C function */
int WMPI_Init_C(int fflag)
{
  int ierror;

  if (fflag == 1) {
    printf(" WMPI_Init_C: before calling WMPI_Init_F\n");
    WMPI_Init_F(&ierror);
  }
  else {
    // CONFIRM THAT THIS IS HOW WE WANT TO HANDLE THIS CASE
    printf(" WMPI_Init_C: before calling PMPI_Init\n");
    int argc; char **argv;
    ierror = PMPI_Init(&argc, &argv);
  }

  printf(" WMPI_Init_C: after\n");

  return ierror;
}

/* This is called from WMPI_Finalize C function */
int WMPI_Finalize_C(int fflag)
{
  int ierror;

  if (fflag == 1) {
    printf(" WMPI_Finalize_C: before calling WMPI_Finalize_F\n");
    WMPI_Finalize_F(&ierror);
  }
  else {
    printf(" WMPI_Finalize_C: before calling PMPI_Finalize\n");
    ierror = PMPI_Finalize();
  }

  printf(" WMPI_Finalize_C: after\n");

  return ierror;
}

/* This is called from WMPI_Comm_rank C function */
int WMPI_Comm_rank_C(MPI_Comm comm, int * rank, int fflag)
{
  int ierror;
  int f_comm;

  if (fflag == 1) {
    printf(" WMPI_Comm_rank_C: before calling WMPI_Comm_rank_F\n");
    f_comm = MPI_Comm_c2f(comm);
    WMPI_Comm_rank_F(f_comm, rank, &ierror);
  }
  else {
    printf(" WMPI_Comm_rank_C: before calling PMPI_Comm_rank\n");
    ierror = PMPI_Comm_rank(comm, rank);
  }

  printf(" WMPI_Comm_rank_C: after, rank==%d\n", *rank);
  return ierror;
}

/* This is called from WMPI_Comm_rank C function */
int WMPI_Send_C(void *buf, int count, MPI_Datatype datatype, int dest, int tag, MPI_Comm comm, int fflag)
{
  int ierror;
  int f_comm, f_datatype;

  if (fflag == 1) {
    printf(" WMPI_Send_C: before calling WMPI_Send_F\n");
    f_comm = MPI_Comm_c2f(comm);
    f_datatype = MPI_Type_c2f(datatype);
    WMPI_Send_F(buf, count, f_datatype, dest, tag, f_comm, &ierror);
    //ierror = PMPI_Send(buf, count, datatype, dest, tag, comm);
  }
  else {
    printf(" WMPI_Send_C: before calling PMPI_Send\n");
    ierror = PMPI_Send(buf, count, datatype, dest, tag, comm);
  }

  printf(" WMPI_Send_C: after\n");
  return ierror;
}
