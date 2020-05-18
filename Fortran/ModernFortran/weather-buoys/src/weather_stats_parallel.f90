! vim: set ft=fortran sw=4 ts=4:

program weather_stats

    ! parallel version, using coarrays

    use mod_array, only: denan, mean
    use mod_io, only: read_buoy
    use mod_parallel, only: tile_indices

    implicit none

    character(len=5), allocatable :: ids(:)
    character(len=20), allocatable :: time(:)
    real, allocatable  :: gather_max(:)[:], gather_mean(:)[:]
    real, allocatable :: wind_speed(:)
    real, allocatable :: max_wind(:), mean_wind(:)
    integer :: is, ie, indices(2)
    integer :: i

    ids = ['42001', '42002', '42003', '42020', '42035',&
        '42036', '42039', '42040', '42055']

    indices = tile_indices(size(ids))
    is = indices(1)
    ie = indices(2)

    allocate(gather_max(size(ids))[*], gather_mean(size(ids))[*])
    allocate(max_wind(is:ie), mean_wind(is:ie))

    do i = is, ie
        call read_buoy('data/buoy_' // ids(i) // '.csv', time, wind_speed)
        wind_speed = denan(wind_speed)
        max_wind(i) = maxval(wind_speed)
        mean_wind(i) = mean(wind_speed)
    end do

    gather_max(is:ie)[1] = max_wind
    gather_mean(is:ie)[1] = mean_wind

    sync all

    if (this_image() == 1) then
        print *, 'Maximum wind speed measured is ', maxval(gather_max),&
            'at station ', ids(maxloc(gather_max))
        print *, 'Highest mean wind speed is ', maxval(gather_mean),&
            'at station ', ids(maxloc(gather_mean))
        print *, 'Lowest mean wind speed is ', minval(gather_mean),&
            'at station ', ids(minloc(gather_mean))
    end if

end program weather_stats

