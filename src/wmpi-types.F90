!
! This file is used to define Fortran handles that have
! equivalent size as the C MPI handles.  This allows the
! C MPI handles to be declared in Fortran and then call
! a Fortran MPI_Comm_f2c (for example) function.
!

module WMPI_types
   use :: ISO_C_BINDING
   use :: mpi_f08, only : MPI_STATUS_SIZE
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

   type, BIND(C) :: WMPI_Datatype
      integer(kind=C_SIGNED_CHAR) :: padding(LEN_MPI_DATATYPE)
   end type WMPI_Datatype

   type, BIND(C) :: WMPI_Errhandler
      integer(kind=C_SIGNED_CHAR) :: padding(LEN_MPI_ERRHANDLER)
   end type WMPI_Errhandler

   type, BIND(C) :: WMPI_File
      integer(kind=C_SIGNED_CHAR) :: padding(LEN_MPI_FILE)
   end type WMPI_File

   type, BIND(C) :: WMPI_Group
      integer(kind=C_SIGNED_CHAR) :: padding(LEN_MPI_GROUP)
   end type WMPI_Group

   type, BIND(C) :: WMPI_Info
      integer(kind=C_SIGNED_CHAR) :: padding(LEN_MPI_INFO)
   end type WMPI_Info

   type, BIND(C) :: WMPI_Message
      integer(kind=C_SIGNED_CHAR) :: padding(LEN_MPI_MESSAGE)
   end type WMPI_Message

   type, BIND(C) :: WMPI_Op
      integer(kind=C_SIGNED_CHAR) :: padding(LEN_MPI_OP)
   end type WMPI_Op

   type, BIND(C) :: WMPI_Request
      integer(kind=C_SIGNED_CHAR) :: padding(LEN_MPI_REQUEST)
   end type WMPI_Request

   type, BIND(C) :: WMPI_Win
      integer(kind=C_SIGNED_CHAR) :: padding(LEN_MPI_WIN)
   end type WMPI_Win

   type, BIND(C) :: WMPI_Status
      integer :: padding(MPI_STATUS_SIZE)
   end type WMPI_Status

   ! Should all be filled in: *check* TODO - fill in the rest

end module WMPI_types
