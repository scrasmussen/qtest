#include <stdio.h>
#include <mpi.h>

#include "wmpi_f.h"


/* This is called from WMPI_Init C function */
int WMPI_Init_C(int fflag)
{
  int ierror;

  printf(" WMPI_Init_C: before calling WMPI_Init_F\n");

  if (fflag == 1) {
    WMPI_Init_F(&ierror);
  }
  else {
    int argc; char **argv;
    ierror = PMPI_Init(&argc, &argv);
  }

  printf(" WMPI_Init_C: after WMPI_Init_F");

  return ierror;
}

/* This is called from WMPI_Comm_rank C function */
int WMPI_Comm_rank_C(MPI_Comm comm, int * rank, int fflag)
{
  int ierror;
  int f_comm;

  printf(" WMPI_Comm_rank_C: before calling WMPI_Comm_rank_F\n");

  if (fflag == 1) {
    f_comm = MPI_Comm_c2f(comm);
    WMPI_Comm_rank_F(f_comm, rank, &ierror);
  }
  else {
    ierror = PMPI_Comm_rank(comm, rank);
  }

  printf(" WMPI_Comm_rank_C: after WMPI_Comm_rank_F, rank==%d\n", *rank);

  return ierror;
}
