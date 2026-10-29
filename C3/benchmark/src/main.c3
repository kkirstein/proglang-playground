module benchmark;
import std::io;

fn int main(String[] args)
{
	io::printn("C3 Benchmarks");
	io::printn("=============");

	io::printn("Fibonacci Numbers");
	io::printn("-----------------");


	io::printf("fib(35) = %d\n", fibonacci::fib(35));


	return 0;
}
