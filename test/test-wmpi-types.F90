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

   integer :: f_group, call_group
   type(WMPI_Group) :: c_group

   integer :: f_info, call_info
   type(WMPI_Info) :: c_info

   integer :: f_message, call_message
   type(WMPI_Message) :: c_message

   call_comm = 0
   call_type = 0
   call_errhandler = 0
   call_group = 0
   call_info = 0
   call_message = 1


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
      c_errhandler = WMPI_Errhandler_f2c(MPI_ERRHANDLER_NULL%MPI_VAL)
      f_errhandler = WMPI_Errhandler_c2f(c_errhandler)
      print *, "(MPI_ERRHANDLER_NULL%MPI_VAL,f_errhandler)", &
           MPI_ERRHANDLER_NULL%MPI_VAL, f_errhandler
   end if

   ! check size of c_group
   if (call_group) then
      print *, c_group, c_sizeof(c_group)
      c_group = WMPI_Group_f2c(MPI_GROUP_NULL%MPI_VAL)
      f_group = WMPI_Group_c2f(c_group)
      print *, "(MPI_GROUP_NULL%MPI_VAL,f_group)", &
           MPI_GROUP_NULL%MPI_VAL, f_group
   end if

   ! check size of c_info
   if (call_info) then
      print *, c_info, c_sizeof(c_info)
      c_info = WMPI_Info_f2c(MPI_INFO_NULL%MPI_VAL)
      f_info = WMPI_Info_c2f(c_info)
      print *, "(MPI_INFO_NULL%MPI_VAL,f_info)", &
           MPI_INFO_NULL%MPI_VAL, f_info
   end if

   ! check size of c_message
   if (call_message) then
      print *, c_message, c_sizeof(c_message)
      c_message = WMPI_Message_f2c(MPI_MESSAGE_NULL%MPI_VAL)
      f_message = WMPI_Message_c2f(c_message)
      print *, "(MPI_MESSAGE_NULL%MPI_VAL,f_message)", &
           MPI_MESSAGE_NULL%MPI_VAL, f_message
   end if


   call MPI_Finalize()

end program
