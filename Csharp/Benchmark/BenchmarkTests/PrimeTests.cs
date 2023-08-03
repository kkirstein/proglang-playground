using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Benchmark.Tasks;

namespace BenchmarkTests
{
    [TestClass]
    public class PrimeTests
    {

        [TestMethod]
        public void TestIsPrime()
        {
            Assert.IsFalse(Prime.IsPrime(0));
            Assert.IsFalse(Prime.IsPrime(1));
            Assert.IsTrue(Prime.IsPrime(2));
            Assert.IsTrue(Prime.IsPrime(3));
            Assert.IsFalse(Prime.IsPrime(4));
            Assert.IsTrue(Prime.IsPrime(5));
            Assert.IsFalse(Prime.IsPrime(6));
            Assert.IsTrue(Prime.IsPrime(7));
        }

        [TestMethod]
        public void TestGetPrimes()
        {
            CollectionAssert.AreEqual(new int[] { 2, 3, 5, 7, 11, 13, 17 }, Prime.GetPrimes(19));
            CollectionAssert.AreEqual(new int[] { 2, 3, 5, 7, 11, 13, 17, 19 }, Prime.GetPrimes(20));
        }

        [TestMethod]
        public void TestGetPrimesPar()
        {
            CollectionAssert.AreEqual(new int[] { 2, 3, 5, 7, 11, 13, 17 }, Prime.GetPrimesPar(19));
            CollectionAssert.AreEqual(new int[] { 2, 3, 5, 7, 11, 13, 17, 19 }, Prime.GetPrimesPar(20));
        }
    }
}
