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
int WMPI_Send_C(void *buf, int count, MPI_Datatype datatype, int dest, int tag, MPI_Comm comm, int fflag);
int WMPI_Recv_C(void *buf, int count, MPI_Datatype datatype, int source, int tag, MPI_Comm comm, MPI_Status *status, int fflag);
int WMPI_Get_processor_name_C(char * name, int * resultlen, int fflag);

#if defined(c_plusplus) || defined(__cplusplus)
}
#endif

#endif /* WMPI_F_H */
