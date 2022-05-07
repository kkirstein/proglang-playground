from benchmark.perfect_number import is_perfect, perfect_numbers, perfect_numbers_async, perfect_numbers_mp


def test_is_perfect():
    assert not is_perfect(1)
    assert not is_perfect(2)
    assert is_perfect(6)
    assert not is_perfect(7)
    assert not is_perfect(27)
    assert is_perfect(28)


def test_perfect_numbers():
    assert perfect_numbers(1000) == [6, 28, 496]


def test_perfect_numbers_async():
    assert perfect_numbers_async(3) == [6, 28, 496]


def test_perfect_numbers_mp():
    assert perfect_numbers_mp(1000) == [6, 28, 496]
