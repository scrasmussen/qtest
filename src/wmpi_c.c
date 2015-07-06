#include <stdio.h>
#include <mpi.h>

/* This direct call to PMPI_Finalize is temporary, should call WMPI_Finalize_ctool? */
int WMPI_Finalize(int lflag)
{
  int ierror;

  printf(" C-wrapper Before PMPI_Finalize\n");
  ierror = PMPI_Finalize();
  printf(" C-wrapper After PMPI_Finalize\n");

  return ierror;
}

/* This direct call to PMPI_Comm_rank is temporary, should call WMPI_Comm_rank_ctool? */
int WMPI_Comm_rank(MPI_Comm comm, int * rank, int lflag)
{
  int ierror;

  printf(" WMPI_Comm_rank: before PMPI_Comm_rank\n");

  ierror = PMPI_Comm_rank(comm, rank);

  if (comm == MPI_COMM_WORLD) printf("HURRAY, comms equiv\n");

  printf(" WMPI_Comm_rank: after PMPI_Comm_rank, rank==%d\n", *rank);

  return ierror;
}
