/*
 * This file contains function prototypes for the final Fortran C tool wrapper
 * functions that call the corresponding PMPI Fortran procedures.
 */

#ifndef WMPI_F_H
#define WMPI_F_H

#if defined(c_plusplus) || defined(__cplusplus)
extern "C" {
#endif

void WMPI_Init_F(int * ierror);
void WMPI_Comm_rank_F(int comm, int * rank, int * ierror);


#if defined(c_plusplus) || defined(__cplusplus)
}
#endif

#endif /* WMPI_F_H */
