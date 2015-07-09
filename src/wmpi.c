#include <stdio.h>
#include <mpi.h>
#include "wmpi_c.h"

/* This direct call to PMPI_Finalize is temporary, should call WMPI_Finalize_ctool? */
int WMPI_Init(int fflag)
{
  int ierror;

  printf(" WMPI_Init: before WMPI_Init_C\n");

  ierror = WMPI_Init_C(fflag);

  printf(" WMPI_Init: after WMPI_Init_C\n");

  return ierror;
}

/* This direct call to PMPI_Finalize is temporary, should call WMPI_Finalize_ctool? */
int WMPI_Finalize(int fflag)
{
  int ierror;

  printf(" WMPI_Finalize: before WMPI_Finalize_C\n");
  ierror = WMPI_Finalize_C(fflag);
  printf(" WMPI_Finalize: after WMPI_Finalize_C\n");

  return ierror;
}

/* This direct call to PMPI_Comm_rank is temporary, should call WMPI_Comm_rank_ctool? */
int WMPI_Comm_rank(MPI_Comm comm, int * rank, int fflag)
{
  int ierror;

  printf(" WMPI_Comm_rank: before WMPI_Comm_rank_C\n");

  ierror = WMPI_Comm_rank_C(comm, rank, fflag);

  if (comm == MPI_COMM_WORLD) printf("HURRAY, comms equiv\n");

  printf(" WMPI_Comm_rank: after WMPI_Comm_rank_C, rank==%d\n", *rank);

  return ierror;
}

/* This direct call to PMPI_Send is temporary, should call WMPI_Send_ctool? */
int WMPI_Send(void * buf, int count, MPI_Datatype datatype, int dest, int tag, MPI_Comm comm, int fflag)
{
  int ierror;

  printf(" WMPI_Send: before PMPI_Send\n");

  ierror = PMPI_Send(buf, count, datatype, dest, tag, comm);

  printf(" WMPI_Send: after PMPI_Send, count==%d dest==%d tag==%d fflag==%d\n", count, dest, tag, fflag);

  return ierror;
}
