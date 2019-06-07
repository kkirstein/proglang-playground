! image.f95
! vim: set ft=fortran sw=4 ts=4:
!
! Demonstrates multiple images, aka threads
!

program images

    integer, codimension[*] :: a
    integer :: i

    a = this_image()

    if (this_image() == 1) then
        do i = 1, num_images()
        write(*,*) 'Value in image', i, 'is', a[i]
        end do
    end if

end program images

