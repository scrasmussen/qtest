#include <stdio.h>
#include <string.h>
#include <mpi.h>
#include "wmpi_c.h"
#undef VERBOSE
#undef STATUSVERBOSE

int WMPI_Init(int fflag)
{
  int ierror;

  #ifdef VERBOSE
  printf(" WMPI_Init: before WMPI_Init_C\n");
  #endif
  ierror = WMPI_Init_C(fflag);

  #ifdef VERBOSE
  printf(" WMPI_Init: after WMPI_Init_C\n");
  #endif
  return ierror;
}

int WMPI_Finalize(int fflag)
{
  int ierror;

  #ifdef VERBOSE
  printf(" WMPI_Finalize: before WMPI_Finalize_C\n");
  #endif
  ierror = WMPI_Finalize_C(fflag);
  #ifdef VERBOSE
  printf(" WMPI_Finalize: after WMPI_Finalize_C\n");
  #endif
  return ierror;
}

int WMPI_Comm_rank(MPI_Comm comm, int * rank, int fflag)
{
  int ierror;

  #ifdef VERBOSE
  printf(" WMPI_Comm_rank: before WMPI_Comm_rank_C\n");
  #endif

  ierror = WMPI_Comm_rank_C(comm, rank, fflag);

  if (comm != MPI_COMM_WORLD) printf("ERROR, comms not equiv (MPI_COMM_WORLD)\n");
  
  #ifdef VERBOSE
  printf(" WMPI_Comm_rank: after WMPI_Comm_rank_C, rank==%d\n", *rank);
  #endif

  return ierror;
}

int WMPI_Send(void *buf, int count, MPI_Datatype datatype, int dest, int tag, MPI_Comm comm, int fflag)
{
  int ierror;

  #ifdef VERBOSE
  printf(" WMPI_Send: before WMPI_Send_C\n");
  #endif

  ierror = WMPI_Send_C(buf, count, datatype, dest, tag, comm, fflag);

  #ifdef VERBOSE
  printf(" WMPI_Send: after WMPI_Send_C, count==%d dest==%d tag==%d fflag==%d\n", count, dest, tag, fflag);
  #endif

  return ierror;
}

int WMPI_Recv(void *buf, int count, MPI_Datatype datatype, int source, int tag, MPI_Comm comm, MPI_Status *status, int fflag)
{
  int ierror;

#ifdef STATUSVERBOSE
  printf(" WMPI_Recv: before WMPI_Recv_C\n");
#endif

  //REMOVING THIS STATEMENT WILL CAUSE FATAL CRASHING
  //  printf(" status address 0x%p \n",&status);

  ierror = WMPI_Recv_C(buf, count, datatype, source, tag, comm, status, fflag);

#ifdef STATUSVERBOSE
  printf(" WMPI_Recv: after WMPI_Recv_C\n");
#endif

  return ierror;
}

/*
 * A test for passing character strings
 */
int WMPI_Get_processor_name(char * name, int * resultlen, int fflag)
{
  int ierror;

#ifdef STATUSVERBOSE
  printf(" WMPI_Get_processor_name: before WMPI_Get_processor_name_C\n");
#endif

  ierror = WMPI_Get_processor_name_C(name, resultlen, fflag);

#ifdef STATUSVERBOSE
  printf(" WMPI_Get_processor_name: len==%d, name==%s\n", *resultlen, name);
#endif

  return MPI_SUCCESS;
}
