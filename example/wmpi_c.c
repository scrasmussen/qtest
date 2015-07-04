#include <stdio.h>
#include <mpi.h>
#include "wmpi_c.h"

int WMPI_Finalize_C(int lflag)//(int *flag)
{
  int ierror;

  printf(" C-wrapper Before PMPI_Finalize\n");
  ierror = PMPI_Finalize();
  printf(" C-wrapper After PMPI_Finalize\n");

  return ierror;
}



