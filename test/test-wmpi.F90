program test_wmpi_types
   use ISO_C_BINDING
   use wmpi_types
   use wmpi_f2c_interfaces
   use mpi_f08
   implicit none

   integer :: rank, ierror, data
   type(MPI_STATUS) :: stat

   call MPI_Init(ierror)

   call MPI_Comm_rank(MPI_COMM_WORLD, rank, ierror)
   print *, "(rank,ierror)==", rank, ierror



   if (rank .eq. 1) then
      data = 11
      call MPI_Send(data,1,MPI_INTEGER,0,7,MPI_COMM_WORLD,ierror)
   else
      print *, 'BEFORE MPI_RECV'
      call MPI_Recv(data,1,MPI_INTEGER,1,7,MPI_COMM_WORLD,MPI_STATUS_IGNORE,&
           ierror)
      print *, 'AFTER MPI_RECV'
   end if

   if (rank .eq. 0) then
      if (data .ne. 11) then
         print *, 'ERROR: data .ne. 11, data =', data
      end if
   end if

   call MPI_Finalize(ierror)

end program
