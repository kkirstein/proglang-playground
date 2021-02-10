from benchmark.perfect_number import is_perfect

def test_is_perfect():
    assert not is_perfect(1)
    assert not is_perfect(2)
    assert is_perfect(6)
    assert not is_perfect(7)
    assert not is_perfect(27)
    assert is_perfect(28)

