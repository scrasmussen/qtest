#include <mpi.h>
#include <stdio.h>

int main()
{
  FILE *f = fopen("wmpi-handle-size.h", "w");

  if (f == NULL)
    {
      printf("Error opening wmpi-handle-size.h\n");
      exit(1);
    }

  fprintf(f, "!\n");
  fprintf(f, "!  This file is being generated by create-wmpi-handle-size.c\n");
  fprintf(f, "!  and will calculate all of the sizes of the C handle types\n");
  fprintf(f, "!  for a particular library.\n");
  fprintf(f, "!\n");
  fprintf(f, "!  WARNING: This file is LIBRARY DEPEDENT\n");
  fprintf(f, "!\n\n");

  
  fprintf(f, "integer, parameter :: LEN_MPI_COMM = %i\n", \
          sizeof(MPI_COMM_NULL));

  fprintf(f, "integer, parameter :: LEN_MPI_DATATYPE = %i\n", \
          sizeof(MPI_DATATYPE_NULL));

  fprintf(f, "integer, parameter :: LEN_MPI_ERRHANDLER = %i\n", \
          sizeof(MPI_ERRORS_ARE_FATAL));

  fprintf(f, "integer, parameter :: LEN_MPI_FILE = %i\n", \
          sizeof(MPI_FILE_NULL));

  fprintf(f, "integer, parameter :: LEN_MPI_GROUP = %i\n", \
          sizeof(MPI_GROUP_NULL));

  fprintf(f, "integer, parameter :: LEN_MPI_INFO = %i\n", \
          sizeof(MPI_INFO_NULL));

  fprintf(f, "integer, parameter :: LEN_MPI_MESSAGE = %i\n", \
          sizeof(MPI_MESSAGE_NULL));

  fprintf(f, "integer, parameter :: LEN_MPI_OP = %i\n", \
          sizeof(MPI_OP_NULL));

  fprintf(f, "integer, parameter :: LEN_MPI_REQUEST = %i\n", \
          sizeof(MPI_REQUEST_NULL));

  fprintf(f, "integer, parameter :: LEN_MPI_WIN = %i\n", \
          sizeof(MPI_WIN_NULL));

  fprintf(f, "integer, parameter :: LEN_MPI_STATUS = %i\n", \
          sizeof(MPI_STATUS_IGNORE));


  return 0;
}