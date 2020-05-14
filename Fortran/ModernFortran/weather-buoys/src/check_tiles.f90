! vim: set ft=fortran sw=4 ts=4:

program check_tiles

    use mod_parallel, only: tile_indices

    implicit none

    integer :: tiles(2)

    tiles = tile_indices(9)

    print *, 'Image: ', this_image(), 'of', num_images(), 'tiles: ', tiles

end program check_tiles


