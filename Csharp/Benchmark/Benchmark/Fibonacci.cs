using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Threading.Tasks;

namespace Benchmark.Tasks
{
    /// <summary>
    ///  A collection of various implementations to calculate Fibonacci numbers
    /// </summary>
    public class Fibonacci
    {
        /// <summary>
        /// Naive recursive implementation
        /// </summary>
        /// <param name="n">nth Fibonacci number to be calculated</param>
        /// <returns>Calculated nth Fibonacci number</returns>
        public static int NaiveFib(int n)
        {
            if (n < 2) return n;
            else
                return NaiveFib(n - 1) + NaiveFib(n - 2);
        }

        /// <summary>
        /// Internal recursive loop fro FIbonacci number calculation
        /// </summary>
        /// <typeparam name="T">Numeric result type for calculated Fibonacci number</typeparam>
        /// <param name="n">nth Fibonacci number to be calculated</param>
        /// <param name="a">First intermediate sum variable</param>
        /// <param name="b">Second intermediate sum variable</param>
        /// <returns></returns>
        private static T LoopFib<T>(int n, T a, T b)
            where T : System.Numerics.IAdditionOperators<T, T, T>
        {
            if (n == 0)
            {
                return a;
            }
            else
            {
                return LoopFib(n - 1, b, a + b);
            }

        }

        /// <summary>
        /// Tail-call optimized recursive implementation
        /// </summary>
        /// <param name="n">nth Fibonacci number to be calculated</param>
        /// <returns>Calculated nth Fibonacci number</returns>
        public static int RecFib(int n)
        {
            return LoopFib(n, 0, 1);
        }

        /// <summary>
        /// Tail-call optimized recursive implementation, using BigInteger for result
        /// </summary>
        /// <param name="n">nth Fibonacci number to be calculated</param>
        /// <returns>Calculated nth Fibonacci number</returns>
        public static BigInteger RecFibBigInt(int n)
        {
            return LoopFib(n, BigInteger.Zero, BigInteger.One);
        }

    }

}
