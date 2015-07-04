module wmpi_f08_ctools

interface WMPI_Finalize
function WMPI_Finalize(lflag) result(ierror) BIND (c, name='WMPI_Finalize_Ctool')
    use iso_c_binding, only : c_int
    implicit none
    INTEGER(c_int), OPTIONAL, INTENT(OUT) :: lflag
    INTEGER(c_int) :: ierror
end function WMPI_Finalize
end interface WMPI_Finalize

end module wmpi_f08_ctools
