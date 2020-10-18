project('benchmark', 'c')

src = ['main.c', 'fib.c']

gmp_dep = dependency('gmp')

executable('bench', sources: src, dependencies: gmp_dep)

