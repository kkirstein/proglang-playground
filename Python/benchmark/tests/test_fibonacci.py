from benchmark.fibonacci import fib_naive, fib_rec, fib_iter

def test_naive():
    assert fib_naive(0) == 0
    assert fib_naive(1) == 1
    assert fib_naive(2) == 1
    assert fib_naive(3) == 2
    assert fib_naive(4) == 3
    assert fib_naive(10) == 55

def test_rec():
    assert fib_rec(0) == 0
    assert fib_rec(1) == 1
    assert fib_rec(2) == 1
    assert fib_rec(3) == 2
    assert fib_rec(4) == 3
    assert fib_rec(10) == 55

def test_iter():
    assert fib_iter(0) == 0
    assert fib_iter(1) == 1
    assert fib_iter(2) == 1
    assert fib_iter(3) == 2
    assert fib_iter(4) == 3
    assert fib_iter(10) == 55

