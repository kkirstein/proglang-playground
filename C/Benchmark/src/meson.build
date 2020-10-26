src = ['main.c', 'fib.c', 'perfect_number.c', 'primes.c', 'dynarr.c']
bench_exe = executable('bench', sources: src,
  dependencies: gmp_dep,
  c_args: '-fopenmp',
  link_args: ['-fopenmp', '-lm'])

