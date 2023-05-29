using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Benchmark.Tasks;

namespace BenchmarkTests
{
    [TestClass]
    public class FibonacciTests
    {
        [TestMethod]
        public void TestNaiveFib()
        {
            Assert.AreEqual(0, Fibonacci.NaiveFib(0));
            Assert.AreEqual(1, Fibonacci.NaiveFib(1));
            Assert.AreEqual(1, Fibonacci.NaiveFib(2));
            Assert.AreEqual(2, Fibonacci.NaiveFib(3));
            Assert.AreEqual(3, Fibonacci.NaiveFib(4));
            Assert.AreEqual(55, Fibonacci.NaiveFib(10));
            Assert.AreEqual(6765, Fibonacci.NaiveFib(20));
        }

        [TestMethod]
        public void TestRecFib()
        {
            Assert.AreEqual(0, Fibonacci.NaiveFib(0));
            Assert.AreEqual(1, Fibonacci.NaiveFib(1));
            Assert.AreEqual(1, Fibonacci.NaiveFib(2));
            Assert.AreEqual(2, Fibonacci.NaiveFib(3));
            Assert.AreEqual(3, Fibonacci.NaiveFib(4));
            Assert.AreEqual(55, Fibonacci.NaiveFib(10));
            Assert.AreEqual(6765, Fibonacci.NaiveFib(20));
        }
    }
}
