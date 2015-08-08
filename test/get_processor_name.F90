#define VERBOSE

program test_get_processor_name
   use mpi_f08
   implicit none
   integer :: err
   character(len=MPI_MAX_PROCESSOR_NAME) :: name
   integer :: resultlen

   call MPI_Init(err)
   if (err != MPI_SUCCESS) stop "ERROR calling MPI_Init"

   call MPI_Get_processor_name(name, resultlen, err)
   if (err != MPI_SUCCESS) stop "ERROR calling MPI_Get_processor_name"

#ifdef VERBOSE
   print *, " len = ", resultlen, "name = ", name(1:resultlen)
#endif

   call MPI_Finalize()
   if (err != MPI_SUCCESS) stop "ERROR calling MPI_Finalize"

end program
