using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Benchmark.Tasks;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace BenchmarkTests
{
    [TestClass]
    public class PerfectNumberTests
    {

        [TestMethod]
        public void TestIsPerfect()
        {
            Assert.IsFalse(PerfectNumber.IsPerfect(1));
            Assert.IsFalse(PerfectNumber.IsPerfect(2));
            Assert.IsTrue(PerfectNumber.IsPerfect(6));
            Assert.IsFalse(PerfectNumber.IsPerfect(7));
            Assert.IsFalse(PerfectNumber.IsPerfect(27));
            Assert.IsTrue(PerfectNumber.IsPerfect(28));
        }

        [TestMethod]
        public void TestPerfectNumbersEnumerable()
        {
            CollectionAssert.AreEqual(new List<int>() { 6, 28 },
                PerfectNumber.GetPerfectNumbersLazy().Take(2).ToList());
        }

        [TestMethod]
        public void TestPerfectNumbersList()
        {
            CollectionAssert.AreEqual(new List<int>() { 6, 28 },
                PerfectNumber.GetPerfectNumbersList(100));
        }
    }
}
