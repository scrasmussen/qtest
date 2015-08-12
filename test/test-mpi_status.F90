#undef VERBOSE

program test_mpi_status
   use ISO_C_BINDING
   use wmpi_types, only : WMPI_Status
   use wmpi_f2c_interfaces, only : WMPI_Status_f2c, WMPI_Status_c2f, print_addr
   use mpi_f08
   implicit none

   integer :: ierr
   type(MPI_Status), target  :: f_status, f_status_new
   type(WMPI_Status), target :: c_status

   call MPI_Init(ierr)

   if (c_sizeof(f_status) /= c_sizeof(c_status)) then
      print *, "ERROR: test_mpi_status: sizeof(f_status) != sizeof(c_status)", &
               c_sizeof(c_status), c_sizeof(f_status)
      stop 1
   end if

   ! initialize f_status with known values
   !
   f_status%MPI_SOURCE = 13
   f_status%MPI_TAG    = 14
   f_status%MPI_ERROR  = 15
   f_status_new%MPI_SOURCE = 0
   f_status_new%MPI_TAG    = 0
   f_status_new%MPI_ERROR  = 0

   c_status%padding(1) = 16
   c_status%padding(2) = 17
   c_status%padding(3) = 18

!   call print_addr(C_LOC(f_status));
!   call print_addr(C_LOC(c_status));

#ifdef VERBOSE
   print *, "MPI_STATUS_SIZE=", MPI_STATUS_SIZE
   print *, "old=", f_status%MPI_SOURCE, f_status%MPI_TAG, f_status%MPI_ERROR
#endif

   ierr = WMPI_Status_f2c(f_status, c_status)
   if (ierr /= MPI_SUCCESS) then
      print *, "ERROR: test_mpi_status failure in WMPI_Status_f2c, ierr=", ierr
      stop 2
   end if

   ierr = WMPI_Status_c2f(c_status, f_status_new)
   if (ierr /= MPI_SUCCESS) then
      print *, "ERROR: test_mpi_status failure in WMPI_Status_c2f, ierr=", ierr
      stop 3
   end if

  if (      (f_status%MPI_SOURCE /= f_status_new%MPI_SOURCE)         &
       .OR. (f_status%MPI_TAG    /= f_status_new%MPI_TAG   )         &
       .OR. (f_status%MPI_ERROR  /= f_status_new%MPI_ERROR )) then
      print *, "ERROR: test_mpi_status failure in WMPI_Status_c2f, f_status /= f_status_new"
      print *, "new=", f_status_new%MPI_SOURCE, f_status_new%MPI_TAG, f_status_new%MPI_ERROR
      print *, "old=", f_status%MPI_SOURCE, f_status%MPI_TAG, f_status%MPI_ERROR
      stop 4
  end if

#ifdef VERBOSE
   print *, "new=", f_status_new%MPI_SOURCE, f_status_new%MPI_TAG, f_status_new%MPI_ERROR
#endif

   call MPI_Finalize(ierr)

end program
