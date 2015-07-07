program test_wmpi_types
   use ISO_C_BINDING
   use wmpi_types
   use wmpi_f2c_interfaces
   use mpi_f08
   implicit none

   integer :: f_comm
   type(WMPI_Comm) :: c_comm

   integer :: f_type
   type(WMPI_Datatype) :: c_type

   call MPI_Init()

   ! check size of c_comm
   !
   print *, c_comm, c_sizeof(c_comm)

   c_comm = WMPI_Comm_f2c(MPI_COMM_WORLD%MPI_VAL)
   f_comm = WMPI_Comm_c2f(c_comm)

   print *, "(MPI_COMM_WORLD%MPI_VAL,f_comm)", MPI_COMM_WORLD%MPI_VAL, f_comm

   ! check size of c_datatype
   !
   print *, c_type, c_sizeof(c_type)

   c_type = WMPI_Type_f2c(MPI_DATATYPE_NULL%MPI_VAL)
   f_type = WMPI_Type_c2f(c_type)

   print *, "(MPI_DATATYPE_NULL%MPI_VAL,f_type)", MPI_DATATYPE_NULL%MPI_VAL, f_type


   call MPI_Finalize()

end program
