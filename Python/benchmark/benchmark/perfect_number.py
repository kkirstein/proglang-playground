# vim: set ft=python sw=4 ts=4:

# perfect_number.py
# Calculate perfect numbers in Python (V3)

from typing import List
from multiprocessing import Pool

NUM_PROCESSES = 8
CHUNK_SIZE = 1

# predicate to check for perfect numbers


def is_perfect(n: int) -> bool:
    sum = 0
    for i in range(1, n):
        if (n % i) == 0:
            sum += i

    return sum == n


# generates a list of perfect numbers for given
# upper bound
def perfect_numbers(limit: int) -> List[int]:
    pn = []
    for i in range(1, limit):
        if is_perfect(i):
            pn.append(i)

    return pn

# coroutine generator for perfect numbers


def perfect_numbers_coroutine():
    counter = 1
    while True:
        if is_perfect(counter):
            yield counter
        counter += 1


def perfect_numbers_async(count: int) -> List[int]:
    pn = []
    gen = perfect_numbers_coroutine()
    # pn.append(next(gen))
    for _ in range(count):
        # pn.append(gen.send(None))
        pn.append(next(gen))

    gen.close()
    return pn


def perfect_numbers_mp(limit: int) -> List[int]:
    with Pool(processes=NUM_PROCESSES) as pool:
        pn_idx = pool.map(is_perfect, range(1, limit), chunksize=CHUNK_SIZE)
    pn = []
    for i, p in enumerate(pn_idx):
        if p:
            pn.append(i + 1)
    return pn
