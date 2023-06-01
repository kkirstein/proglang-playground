using Benchmark.Tasks;

namespace Benchmark
{
    internal class Program
    {
        static void Main(string[] _args)
        {
            Console.WriteLine("Benchmark");
            Console.WriteLine("=========");
            Console.WriteLine();

            System.Diagnostics.Stopwatch sw = new System.Diagnostics.Stopwatch();

            Console.WriteLine("Fibonacci Numbers");
            Console.WriteLine("-----------------");

            sw.Restart();
            var res_1 = Fibonacci.NaiveFib(35);
            var elapsed = sw.ElapsedMilliseconds;
            Console.WriteLine($"NaiveFib(35) = {res_1} (Elapsed: {elapsed} ms)");

            sw.Restart();
            res_1 = Fibonacci.RecFib(35);
            elapsed = sw.ElapsedMilliseconds;
            Console.WriteLine($"RecFib(35) = {res_1} (Elapsed: {elapsed} ms)");

            sw.Restart();
            var res_2 = Fibonacci.RecFibBigInt(35);
            elapsed = sw.ElapsedMilliseconds;
            Console.WriteLine($"RecFibBigInt(35) = {res_2} (Elapsed: {elapsed} ms)");

            sw.Restart();
            res_2 = Fibonacci.RecFibBigInt(1000);
            elapsed = sw.ElapsedMilliseconds;
            Console.WriteLine($"RecFibBigInt(1000) = {res_2} (Elapsed: {elapsed} ms)");

            Console.WriteLine();

            Console.WriteLine("Perfect Numbers");
            Console.WriteLine("---------------");

            Console.WriteLine();

            Console.WriteLine("Prime Numbers");
            Console.WriteLine("-------------");

            Console.WriteLine();

            Console.WriteLine("Mandelbrot Set");
            Console.WriteLine("--------------");
        }
    }
}