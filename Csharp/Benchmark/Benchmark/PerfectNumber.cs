using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Benchmark.Tasks
{
    public class PerfectNumber
    {


        /// <summary>
        /// Checks whetehr given number is perfect, meaning it is equal to the sum of its deviders.
        /// </summary>
        /// <param name="n">Number to be checked</param>
        /// <returns>true, if given number is equal to the sum of its dividers, false otherwise§</returns>
        public static bool IsPerfect(int n)
        {
            int sum = 0;

            foreach (int i in Enumerable.Range(1, n - 1))
            {
                if (n % i == 0) { sum += i; }
            }
            return sum == n;
        }


        public static IEnumerable<int> GetPerfectNumbersEnumerable()
        {
            return Enumerable.Range(1, int.MaxValue).Where(IsPerfect);
        }

        public static List<int> GetPerfectNumbersList(int limit)
        {
            return Enumerable.Range(1, limit).Where(IsPerfect).ToList();
        }
    }
}
