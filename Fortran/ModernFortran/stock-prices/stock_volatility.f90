! vim: set ft=fortran sw=4 ts=4 :

program stock_volatility

    use mod_arrays, only: reverse, average, std, moving_average, moving_std
    use mod_io, only: read_stock, write_stock

    implicit none

    character(len=4), allocatable :: symbols(:)
    character(len=:), allocatable :: time(:)
    real, allocatable :: open(:), high(:), low(:),&
          close(:), adjclose(:), volume(:)
    real, allocatable :: mvavg(:), mvstd(:)
    integer :: n, im
    real :: gain, mean, stddev

    symbols = ['AAPL', 'AMZN', 'CRAY', 'CSCO', 'HPQ ',&
          'IBM ', 'INTC', 'MSFT', 'NVDA', 'ORCL']

    do n = 1, size(symbols)
        call read_stock('data/' // trim(symbols(n)) // '.csv', time,&
              open, high, low, close, adjclose, volume)

        im = size(time)

        adjclose = reverse(adjclose)
        time = time(size(time):1:-1)

        gain = (adjclose(size(adjclose)) - adjclose(1))
        mean = average(adjclose)
        stddev = std(adjclose)

        mvavg = moving_average(adjclose, 30)
        mvstd = moving_std(adjclose, 30)

        if (n == 1) then
              print *, time(size(time)) // ' through ' // time(1)
              print *, 'Symbol, Gain (USD), Relative gain (%), Mean (USD), Standard deviation (USD)'
              print *, '---------------------------------------------------------------------------'
        end if
        print *, symbols(n), gain, nint(gain / adjclose(1) * 100), mean, stddev

        call write_stock('results/' // trim(symbols(n)) // '_volatility',&
            time, adjclose, mvavg, mvstd)
    end do
end program stock_volatility


