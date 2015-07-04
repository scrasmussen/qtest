!
! Program to Test MPI_Send
! 5/17/2015
!

program main
  use mpi_f08 
  implicit none
  integer :: ierr, rank, size
  call MPI_INIT( ierr )

  print *,'MAIN: before MPI_Finalize'
  call MPI_FINALIZE( ierr )
  print *,'MAIN: after MPI_Finalize'
end program main
