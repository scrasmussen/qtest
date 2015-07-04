program test_wmpi_types
   use ISO_C_BINDING
   use wmpi_types
   use wmpi_f2c_interfaces
   use mpi_f08
   implicit none

   integer :: f_comm
   type(WMPI_Comm) :: c_comm

   call MPI_Init()

   c_comm%padding = "12345678"

   ! looks like using character(len= ) will work
   !
   print *, c_comm, c_sizeof(c_comm)

   c_comm = WMPI_Comm_f2c(MPI_COMM_WORLD%MPI_VAL)
   f_comm = WMPI_Comm_c2f(c_comm)

   print *, "(MPI_COMM_WORLD%MPI_VAL,f_comm)", MPI_COMM_WORLD%MPI_VAL, f_comm

   call MPI_Finalize()

end program
