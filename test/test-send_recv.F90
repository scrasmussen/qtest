program test_send_recv
   use mpi_f08
   implicit none

   !
   ! Integer kinds are specified below.  There is still a debate on
   ! whether to specify the integer size or to use default integers.
   !
   integer :: rank, size, err
   integer :: next, prev

   !
   ! The status and comm variables are derived types.
   ! The compiler will give an error message if integers
   ! are mistakenly used.
   !
   type(MPI_Status) :: status
   type(MPI_Comm)   :: comm

   double precision :: dbl_scalar            ! test using a scalar
   double precision :: message(2)

   real             :: real_array(2)

   character        :: char_scalar
   character        :: char_send(3), char_recv(3)

   ! test scalar interface
   equivalence(char_scalar, char_send(1))

   character(len=4) :: str_send, str_recv

   integer, parameter :: tag = 201
   logical, parameter :: verbose = .false.   ! flag controlling output

   comm = MPI_COMM_WORLD

   !
   ! Note the presence of the optional error return argument
   ! here, but mostly not used elsewhere.
   !
   call MPI_Init(err)

   call MPI_Comm_rank(MPI_COMM_WORLD, rank)
   call MPI_Comm_size(MPI_COMM_WORLD, size, err)

   if (.true. .eqv. MPI_SUBARRAYS_SUPPORTED) then
      print *, "WARNING (OK), testing of double prec arrays not yet supported with subarrays"
      goto 99  ! test should be modified to work with subarrays
   end if

   ! Calculate the rank of the next process in the ring.  Use the                     
   !  modulus operator so that the last process "wraps around" to                  
   !  rank zero.

   next = modulo(rank + 1, size)
   prev = modulo(rank + size - 1, size)

   message(1) = rank

   if (verbose) then
      print *, "rank=", rank, "sending to    ", next
      print *, "rank=", rank, "receiving from", prev
      print *, "status=", status%MPI_SOURCE, status%MPI_TAG, status%MPI_ERROR
   end if

   if (rank == 0) then
      call MPI_Send(message(1), 1, MPI_DOUBLE_PRECISION, next, tag, comm)
      call MPI_Recv(dbl_scalar, 1, MPI_DOUBLE_PRECISION, prev, tag, comm, status)
   else
      call MPI_Recv(dbl_scalar, 1, MPI_DOUBLE_PRECISION, prev, tag, comm, status)
      call MPI_Send(message   , 1, MPI_DOUBLE_PRECISION, next, tag, comm)
   end if

   if (dbl_scalar .ne. prev) then
      print *, "ERROR test_send_recv: rank=", rank, "received", dbl_scalar, " from", prev
      call MPI_Finalize()
      stop 13
   end if

   ! Wait for everyone to complete the exchange.
   !
   call MPI_Barrier(MPI_COMM_WORLD)

   if (verbose) then
      print *, "rank=", rank, "received", dbl_scalar, " from", prev
      print *, "status=", status%MPI_SOURCE, status%MPI_TAG, status%MPI_ERROR
   end if

   call MPI_Barrier(MPI_COMM_WORLD)

   ! test sending other data types
   !

   char_send(1) = 'M'
   char_send(2) = 'P'
   char_send(3) = 'I'
   char_recv(1:3) = 'X'

   if (verbose) then
      print *, "char_send==", char_send(1:3)
      print *, "char_recv==", char_recv(1:3)
   end if

   if (rank == 0) then
      call MPI_Send(char_scalar,  3, MPI_CHARACTER, next, tag, comm)
      call MPI_Recv(char_recv,    3, MPI_CHARACTER, prev, tag, comm, status)
   else
      call MPI_Recv(char_recv(1), 3, MPI_CHARACTER, prev, tag, comm, status)
      call MPI_Send(char_send,    3, MPI_CHARACTER, next, tag, comm)
   end if

   if (char_recv(1) /= 'M' .or. char_recv(2) /= 'P' .or. char_recv(3) /= 'I') then
      print *, "ERROR test_send_recv: rank=", rank, "received: ", char_recv(1:3), " from", prev
      call MPI_Finalize()
      stop 13
   end if

   call MPI_Barrier(MPI_COMM_WORLD)

   if (verbose) then
      print *, "char_recv (after recv)==", char_recv(1:3)
   end if

   call MPI_Barrier(MPI_COMM_WORLD)

   str_send = "OMPI"
   str_recv = "XXXX"

   if (verbose) then
      print *, "str_send==", str_send
      print *, "str_recv==", str_recv
   end if

   if (rank == 0) then
      call MPI_Send(str_send, 4, MPI_CHARACTER, next, tag, comm)
      call MPI_Recv(str_recv, 4, MPI_CHARACTER, prev, tag, comm, status)
   else
      call MPI_Recv(str_recv, 4, MPI_CHARACTER, prev, tag, comm, status)
      call MPI_Send(str_send, 4, MPI_CHARACTER, next, tag, comm)
   end if

   if (str_recv /= "OMPI") then
      print *, "ERROR test_send_recv: rank=", rank, "received: ", str_recv, " from", prev
      call MPI_Finalize()
      stop 13
   end if

   call MPI_Barrier(MPI_COMM_WORLD)

   if (verbose) then
      print *, "str_recv (after recv)==", str_recv
   end if

! THIS NEEDS TO BE FIXED (check results).
! Currently just to make sure sendrecv compiles and links
!
   call MPI_Sendrecv(real_array, 1, MPI_REAL, next, tag, &
                     real_array, 1, MPI_REAL, prev, tag, comm, status)

99 call MPI_Finalize(err)

end program
