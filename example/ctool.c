#include <stdio.h>
#include <mpi.h>

int WMPI_Finalize_Ctool(int lflag)
{
  int ierror;

  printf(" C-tool Before WMPI_Finalize_C\n");
  ierror = WMPI_Finalize_C(lflag);
  printf(" C-tool After WMPI_Finalize_C\n");

  return ierror;
}



