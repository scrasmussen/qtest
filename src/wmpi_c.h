/*
 * This file contains function prototypes for that the C tool wrapper
 * functions used to complete the call to the corresponding PMPI function
 * (in C or Fortran)
 */

#ifndef WMPI_F_H
#define WMPI_F_H

#include <mpi.h>

#if defined(c_plusplus) || defined(__cplusplus)
extern "C" {
#endif

int WMPI_Init_C(int fflag);
int WMPI_Finalize_C(int fflag);
int WMPI_Comm_rank_C(MPI_Comm comm, int * rank, int fflag);


#if defined(c_plusplus) || defined(__cplusplus)
}
#endif

#endif /* WMPI_F_H */
