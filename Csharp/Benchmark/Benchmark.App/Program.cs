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

            sw.Restart();
            var res_3 = PerfectNumber.GetPerfectNumbersLazy().Take(4).ToList();
            elapsed = sw.ElapsedMilliseconds;
            Console.WriteLine($"GetPerfectNumbersEnumarable().Take(4) = [{String.Join(", ", res_3)}] (Elapsed: {elapsed} ms)");

            sw.Restart();
            res_3 = PerfectNumber.GetPerfectNumbersList(10000);
            elapsed = sw.ElapsedMilliseconds;
            Console.WriteLine($"GetPerfectNumbersList(10000) = [{String.Join(", ", res_3)}] (Elapsed: {elapsed} ms)");

            Console.WriteLine();

            Console.WriteLine("Prime Numbers");
            Console.WriteLine("-------------");

            sw.Restart();
            var res_4 = Prime.GetPrimes(1_000_000);
            elapsed = sw.ElapsedMilliseconds;
            Console.WriteLine($"GetPrimes(1_000_000) = <{res_4.Count}> (Elapsed: {elapsed} ms)");

            sw.Restart();
            res_4 = Prime.GetPrimesPar(1_000_000);
            elapsed = sw.ElapsedMilliseconds;
            Console.WriteLine($"GetPrimesPar(1_000_000) = <{res_4.Count}> (Elapsed: {elapsed} ms)");

            Console.WriteLine();

            Console.WriteLine("Mandelbrot Set");
            Console.WriteLine("--------------");

            sw.Restart();
            var mandelbrot = new Mandelbrot(1920, 1600, -0.5, 0.0, 4.0 / 1920,
                MandelbrotMethod.Sequential);
            elapsed = sw.ElapsedMilliseconds;
            Console.WriteLine($"Mandelbrot(1920, 1600, Seq) = <> (Elapsed: {elapsed} ms)");
            sw.Restart();
            mandelbrot = new Mandelbrot(1920, 1600, -0.5, 0.0, 4.0 / 1920,
                MandelbrotMethod.Parallel);
            elapsed = sw.ElapsedMilliseconds;
            Console.WriteLine($"Mandelbrot(1920, 1600, Par) = <> (Elapsed: {elapsed} ms)");

            Console.WriteLine();

            sw.Restart();
            string filename = @"mandelbrot_1920x1600.png";
            mandelbrot.Save(filename);
            elapsed = sw.ElapsedMilliseconds;
            Console.WriteLine($"Manelbrot(1920, 1600) written to {filename} (Elapsed: {elapsed} ms)");
        }
    }
}