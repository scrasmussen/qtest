program test_wmpi_types
   use ISO_C_BINDING
   use wmpi_types
   use wmpi_f2c_interfaces
   use mpi_f08
   implicit none

   integer :: f_comm, call_comm
   type(WMPI_Comm) :: c_comm

   integer :: f_type, call_type
   type(WMPI_Datatype) :: c_type

   integer :: f_errhandler, call_errhandler
   type(WMPI_Errhandler) :: c_errhandler

   call_comm = 0
   call_type = 0
   call_errhandler = 1


   call MPI_Init()

   ! check size of c_comm
   if (call_comm) then
      print *, c_comm, c_sizeof(c_comm)
      c_comm = WMPI_Comm_f2c(MPI_COMM_WORLD%MPI_VAL)
      f_comm = WMPI_Comm_c2f(c_comm)
      print *, "(MPI_COMM_WORLD%MPI_VAL,f_comm)", MPI_COMM_WORLD%MPI_VAL, f_comm
   end if

   ! check size of c_datatype
   if (call_type) then
      print *, c_type, c_sizeof(c_type)
      c_type = WMPI_Type_f2c(MPI_DATATYPE_NULL%MPI_VAL)
      f_type = WMPI_Type_c2f(c_type)
      print *, "(MPI_DATATYPE_NULL%MPI_VAL,f_type)", MPI_DATATYPE_NULL%MPI_VAL, &
           f_type
   end if

   ! check size of c_errhandler
   if (call_errhandler) then
      print *, c_errhandler, c_sizeof(c_errhandler)
      c_errhandler = WMPI_Errhandler_f2c(MPI_ERRORS_ARE_FATAL%MPI_VAL)
      f_errhandler = WMPI_Errhandler_c2f(c_errhandler)
      print *, "(MPI_ERRORS_ARE_FATAL%MPI_VAL,f_errhandler)", &
           MPI_ERRORS_ARE_FATAL%MPI_VAL, f_errhandler
   end if





   call MPI_Finalize()

end program
