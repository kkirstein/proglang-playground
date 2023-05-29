using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Benchmark.Tasks
{
    /// <summary>
    ///  A collection of various implementations to calculate Fibonacci numbers
    /// </summary>
    public class Fibonacci
    {
        public static int NaiveFib(int n)
        {
            if (n < 2) return n;
            else
                return NaiveFib(n - 1) + NaiveFib(n - 2);
        }


        private static int LoopFib(int n, int a, int b)
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
        public static int RecFib(int n)
        {
            return LoopFib(n, 0, 1);
        }
    }

}
