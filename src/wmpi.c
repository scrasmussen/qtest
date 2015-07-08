#include <stdio.h>
#include <mpi.h>
#include "wmpi_c.h"

/* This direct call to PMPI_Finalize is temporary, should call WMPI_Finalize_ctool? */
int WMPI_Init(int fflag)
{
  int ierror;

  printf(" WMPI_Init: Before PMPI_Init\n");
  ierror = PMPI_Init(0, NULL);
  printf(" WMPI_Init: After PMPI_Init\n");

  return ierror;
}

/* This direct call to PMPI_Finalize is temporary, should call WMPI_Finalize_ctool? */
int WMPI_Finalize(int fflag)
{
  int ierror;

  printf(" WMPI_Finalize: Before PMPI_Finalize\n");
  ierror = PMPI_Finalize();
  printf(" WMPI_Finalize: After PMPI_Finalize\n");

  return ierror;
}

/* This direct call to PMPI_Comm_rank is temporary, should call WMPI_Comm_rank_ctool? */
int WMPI_Comm_rank(MPI_Comm comm, int * rank, int fflag)
{
  int ierror;

  printf(" WMPI_Comm_rank: before PMPI_Comm_rank\n");

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
