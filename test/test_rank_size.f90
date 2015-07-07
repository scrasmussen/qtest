! -*- f90 -*-
!
! Copyright (c) 2010-2012 Cisco Systems, Inc.  All rights reserved.
! Copyright (c) 2009-2012 Los Alamos National Security, LLC.
!                         All rights reserved.
! $COPYRIGHT$

program test_rank_size
    use mpi_f08
    implicit none

    integer :: rank, size, err
    integer, parameter :: tag = 201
    type(MPI_Comm) :: comm

    comm = MPI_COMM_WORLD

    call MPI_Init(err)

    call MPI_Comm_rank(comm, rank, err)
    call MPI_Comm_size(MPI_COMM_WORLD, size)

    print *, "rank =", rank, "size =", size

    call MPI_Finalize()

end program test_rank_size
