program main
    implicit none
    integer :: ierr, nparameter
    character :: dims, darg

    nparameter=iargc()
    if ( nparameter.ge.1 ) then
        call getarg(1, darg)
        if ( darg.eq.'-d2' ) dims='d2'
        write(*,*) "**************** Set system dim to 2D *******************"
        write(*,*) "I assume your system lay in AB plane! POSCAR lattice looks like"
        write(*,*) "A(1) A(2) 0"
        write(*,*) "B(1) B(2) 0"
        write(*,*) "0    0    C"
    else
        dims='d3'
        write(*,*) "**************** Set system dim to 3D *******************"
    end if
    ierr=0
    open(unit=19, file='GCOEFF.txt', status='old', action='read', iostat=ierr)
    close(unit=19)
    if ( ierr.eq.0 ) then
        write(*,*) "Datafile 'GCOEFF.txt' exits, now calc parity."
        call parity(dims)
        write(*,*) "**************End of parity calculation!*********************"
    else
        write(*,*) "'GCOEFF.txt' file dosn't exit, now read WAVECAR."
        call wavetrans
        call parity(dims)
        write(*,*) "**************End of parity calculation!*********************"
    end if
end program main
