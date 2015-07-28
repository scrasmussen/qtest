program test_wmpi_types
   use ISO_C_BINDING
   use wmpi_types
   use wmpi_f2c_interfaces
   use mpi_f08
   implicit none

   integer :: rank, size, ierror, data
   type(MPI_STATUS) :: stat

   call MPI_Init(ierror)

   call MPI_Comm_rank(MPI_COMM_WORLD, rank)
   call MPI_Comm_size(MPI_COMM_WORLD, size, ierror)

   print *, "(rank,ierror)==", rank, ierror
   call MPI_Barrier(MPI_COMM_WORLD)

   if (size .ne. 2) then
      print *, "ERROR: test_wmpi must be run with exactly 2 MPI processes"
      go to 99
   end if

   if (rank == 0) then
      print *, "MPI_STATUS_SIZE==", MPI_STATUS_SIZE
      print *
   end if

   if (rank .eq. 1) then
      data = 11
      call PMPI_Send(data,1,MPI_INTEGER,0,7,MPI_COMM_WORLD,ierror)
   else if (rank .eq. 0) then
      data = 2
      call PMPI_Recv(data,1,MPI_INTEGER,1,7,MPI_COMM_WORLD,stat,ierror)
      ! TODO - WARNING status return value is currently INCORRECT
      !      - should be (1, 7, 0)
      print *, rank, "........", stat%mpi_source, stat%mpi_tag, stat%mpi_error
   else
      print *, 'ERROR: must run with exactly two MPI processes'
   end if

   if (rank .eq. 0) then
      if (data .ne. 11) then
         print *, 'ERROR: data .ne. 11, data =', data
      else
         print *, 'SUCCESS: data .eq. 11'
      end if
   end if

99 call MPI_Finalize(ierror)

end program
