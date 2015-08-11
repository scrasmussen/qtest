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
   integer :: f_errhandler
   type(WMPI_Errhandler) :: c_errhandler
   integer :: f_group
   type(WMPI_Group) :: c_group
   integer :: f_info
   type(WMPI_Info) :: c_info
   integer :: f_message
   type(WMPI_Message) :: c_message
   integer :: f_op
   type(WMPI_Op) :: c_op
   integer :: f_request
   type(WMPI_Request) :: c_request
   integer :: f_win
   type(WMPI_Win) :: c_win
   integer :: f_file
   type(WMPI_File) :: c_file

   logical :: call_comm, call_type, call_errhandler, call_group,  &
              call_info, call_message, call_op, call_request,     &
              call_win, call_file

   call_comm = .FALSE.
   call_type = .FALSE.
   call_errhandler = .FALSE.
   call_group = .FALSE.
   call_info = .FALSE.
   call_message = .FALSE.
   call_op = .FALSE.
   call_request = .FALSE.
   call_win = .FALSE.
   call_file = .TRUE.

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

   ! check size of c_op
   if (call_op) then
      print *, c_op, c_sizeof(c_op)
      c_op = WMPI_Op_f2c(MPI_OP_NULL%MPI_VAL)
      f_op = WMPI_Op_c2f(c_op)
      print *, "(MPI_OP_NULL%MPI_VAL,f_op)", &
           MPI_OP_NULL%MPI_VAL, f_op
   end if

   ! check size of c_request
   if (call_request) then
      print *, c_request, c_sizeof(c_request)
      c_request = WMPI_Request_f2c(MPI_REQUEST_NULL%MPI_VAL)
      f_request = WMPI_Request_c2f(c_request)
      print *, "(MPI_REQUEST_NULL%MPI_VAL,f_request)", &
           MPI_REQUEST_NULL%MPI_VAL, f_request
   end if

   ! check size of c_win
   if (call_win) then
      print *, c_win, c_sizeof(c_win)
      c_win = WMPI_Win_f2c(MPI_WIN_NULL%MPI_VAL)
      f_win = WMPI_Win_c2f(c_win)
      print *, "(MPI_WIN_NULL%MPI_VAL,f_win)", &
           MPI_WIN_NULL%MPI_VAL, f_win
   end if

   ! check size of c_file
   if (call_file) then
      print *, c_file, c_sizeof(c_file)
      c_file = WMPI_File_f2c(MPI_FILE_NULL%MPI_VAL)
      f_file = WMPI_File_c2f(c_file)
      print *, "(MPI_FILE_NULL%MPI_VAL,f_file)", &
           MPI_FILE_NULL%MPI_VAL, f_file
   end if

   ! removed WMPI_Status check because we now have a unit test for WMPI_Status_f2c and WMPI_Status_c2f

   call MPI_Finalize()

end program
