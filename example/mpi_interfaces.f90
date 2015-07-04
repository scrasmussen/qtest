!===== WRAPPER 1 =====
subroutine MPI_Finalize_f08(ierror)
  use, intrinsic :: ISO_C_BINDING, only : C_INT
  use wmpi_f08_ctools, only : WMPI_Finalize
  implicit none
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
  INTEGER(C_INT) :: lflag, c_ierr

  lflag = 1_C_INT
  print *,'F-wrapper before c call'
  c_ierr = WMPI_Finalize(lflag)
  print *, 'F-wrapper after c call'
end subroutine MPI_Finalize_f08
