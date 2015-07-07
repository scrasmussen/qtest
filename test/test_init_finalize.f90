! -*- f90 -*-
!
! Copyright (c) 2010-2012 Cisco Systems, Inc.  All rights reserved.
! Copyright (c) 2009-2012 Los Alamos National Security, LLC.
!                         All rights reserved.
! $COPYRIGHT$

program test_init_finalize
    use mpi_f08
    implicit none
    integer :: err

    ! Start up MPI
    call MPI_Init()

    ! Shut down MPI
    call MPI_Finalize(err)

end program test_init_finalize
