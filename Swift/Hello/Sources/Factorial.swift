// Factorial.swift
//

func factorial(n: Int) -> Int {
    if n <= 1 { return n }
    return n * factorial(n - 1)
}

let number = 4
print("\(number)! is equal to \(factorial(number))")

