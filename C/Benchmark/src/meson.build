src = ['main.c', 'fib.c', 'perfect_number.c', 'primes.c', 'dynarr.c', 'image.c', 'mandelbrot.c']

conf_data = configuration_data()
conf_data.set('version', '0.0.1')
configure_file(input: 'benchmark_config.h.in',
  output: 'benchmark_config.h',
  configuration: conf_data)

bench_exe = executable('bench',
  sources: src,
  dependencies: gmp_dep,
  c_args: '-fopenmp',
  link_args: ['-fopenmp', '-lm'])

