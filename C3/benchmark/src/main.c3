module benchmark;
import std::io;

fn int main(String[] args)
{
	io::printn("C3 Benchmarks");
	io::printn("=============");
	io::printn("");

	io::printn("Fibonacci Numbers");
	io::printn("-----------------");


	io::printfn("fib_naive(35) = %d", fibonacci::fib_naive(35));
	io::printfn("fib(35) = %d", fibonacci::fib(35));
	io::printfn("fib_big(35) = %s", fibonacci::fib_big(35));
	io::printfn("fib_big(1000) = %s", fibonacci::fib_big(1000));
	io::printn("");


	return 0;
}
