/*
 * This file contains function prototypes for the final Fortran C tool wrapper
 * functions that call the corresponding PMPI Fortran procedures.  It also contains
 * the constant MPI_FORTRAN_STATUS_SIZE (WARNING, the value of this macro variable is
 * dependent on the MPI library.
 */

#ifndef WMPI_F_H
#define WMPI_F_H

#define MPI_FORTRAN_STATUS_SIZE 6

#if defined(c_plusplus) || defined(__cplusplus)
extern "C" {
#endif

void WMPI_Init_F(int * ierror);
void WMPI_Finalize_F(int * ierror);
void WMPI_Comm_rank_F(int comm, int * rank, int * ierror); //is this * right?
void WMPI_Send_F(int * buf, int count, int datatype, int dest, int tag, int comm, int *ierror);
void WMPI_Recv_F(int * buf, int count, int datatype, int source, int tag, int comm, int *status, int *ierror);
int WMPI_Get_processor_name_F(char * name, int * resultlen, int * ierror);

#if defined(c_plusplus) || defined(__cplusplus)
}
#endif

#endif /* WMPI_F_H */
