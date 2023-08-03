using System.Numerics;

namespace Benchmark.Tasks
{
    public class Prime
    {
        /// <summary>
        /// Predicate whether given number is prime
        /// </summary>
        /// <typeparam name="T">ecked typeparam>
        /// <param name="n"></param>
        /// <returns>True, if n is prime number</returns>
        /// <exception cref="Exception">Throws exception, if unsupported numeric type is given</exception>
        public static bool IsPrime<T>(T n)
            where T : System.Numerics.IComparisonOperators<T, int, bool>, System.Numerics.IModulusOperators<T, int, T>
        {
            if (n < 2)
            {
                return false;
            }
            else
            {
                var limit = n switch
                {
                    int i => (int)Math.Sqrt(i),
                    float f => (int)Math.Sqrt(f),
                    double d => (int)Math.Sqrt(d),
                    BigInteger b => (int)Math.Exp(BigInteger.Log(b) / 2),
                    _ => throw new Exception($"Unsupported data type {n.GetType()}")
                };

                for (var i = 2; i < limit + 1; i++)
                {
                    if (n % i == 0) return false;
                }
            }
            return true;
        }


        /// <summary>
        /// Get a list of prime numbers up to given limit
        /// </summary>
        /// <param name="limit">Upper limit for prime numbers</param>
        /// <returns>A list of prime numbers</returns>
        public static List<int> GetPrimes(int limit)
        {
            var primes = Enumerable.Range(0, limit).Where(IsPrime);

            return primes.ToList();
        }


        /// <summary>
        /// Get a list of prime numbers up to given limit
        /// </summary>
        /// <param name="limit">Upper limit for prime numbers</param>
        /// <returns>A list of prime numbers</returns>
        public static List<int> GetPrimesPar(int limit)
        {
            var primes = Enumerable.Range(0, limit).AsParallel().Where(IsPrime);

            return primes.ToList();
        }
    }
}
