program test_wmpi_types
   use ISO_C_BINDING
   use wmpi_types
   use wmpi_f2c_interfaces
   use mpi_f08
   implicit none

   integer :: rank, ierror

   call MPI_Init(ierror)

   call MPI_Comm_rank(MPI_COMM_WORLD, rank, ierror)
   print *, "(rank,ierror)==", rank, ierror

   call MPI_Finalize(ierror)

end program
