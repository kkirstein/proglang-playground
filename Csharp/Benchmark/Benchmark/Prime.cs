using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Benchmark.Tasks
{
    public class Prime
    {
        public static bool IsPrime<T>(T n)
            where T : System.Numerics.IComparisonOperators<T, int, bool>, System.Numerics.IModulusOperators<T, T, T>
        {
            if (n < 2) {
                return false;
            }
            else
            {
                var limit = Math.Sqrt(n);
                for (var i = 0; i < limit; i++)
                {
                    if (n % i == 0) return false;
                }
            }
            return true;
        }
    }
}
