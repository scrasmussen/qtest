!
! This file is used to define Fortran handles that have
! equivalent size as the C MPI handles.  This allows the
! C MPI handles to be declared in Fortran and then call
! a Fortran MPI_Comm_f2c (for example) function.
!

module WMPI_types
   use :: ISO_C_BINDING
   implicit none

   include "wmpi-handle-size.h"

   !!
   ! Need to worry about extra padding and alignment
   !   - may be better to use INTEGER(C_INT) or TYPE(C_PTR) and
   !     divide by the number by bytes/4 (or something)
   !
   !   - the length should be the sizeof(MPI_Comm) in bytes
   !
   !   - NOTE: CER-2015.7.4 - it appears that character with
   !           len=sizeof_C_handle_type should work.  Still
   !           need to worry about alignment?
   !   - NOTE: CER-2015.7.6 - switched to array of integer(kind=C_SIGNED_CHAR)
   !
   type, BIND(C) :: WMPI_Comm
      integer(kind=C_SIGNED_CHAR) :: padding(LEN_MPI_COMM)
   end type WMPI_Comm

   ! TODO - fill in the rest

end module WMPI_types
