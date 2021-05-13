// perfectnumber_test.go
//
// vim: ft=go sw=4 ts=4
//

package perfectnumber_test

import (
	. "benchmark/perfectnumber"

	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
)

var _ = Describe("perfectnumber", func() {

	Context("IsPerfect", func() {

		It("should confirm perfect numbers", func() {
			Expect(IsPerfect(6)).To(BeTrue())
			Expect(IsPerfect(28)).To(BeTrue())
		})

		It("should deny invalid perfect numbers", func() {
			Expect(IsPerfect(1)).To(BeFalse())
			Expect(IsPerfect(2)).To(BeFalse())
			Expect(IsPerfect(3)).To(BeFalse())
			Expect(IsPerfect(4)).To(BeFalse())
			Expect(IsPerfect(5)).To(BeFalse())
			Expect(IsPerfect(7)).To(BeFalse())
		})
	})

	Context("IsPerfectAsync", func() {

		It("should confirm perfect numbers", func() {
			var res bool
			pn := IsPerfectAsync(6)
			Eventually(pn).Should(Receive(&res))
			Eventually(pn).Should(BeClosed())
			Expect(res).To(BeTrue())
		})

		It("should deny invalid perfect numbers", func() {
			var res bool
			pn := IsPerfectAsync(5)
			Eventually(pn).Should(Receive(&res))
			Eventually(pn).Should(BeClosed())
			Expect(res).To(BeFalse())
		})
	})

	Context("PerfectNumbers", func() {

		It("should return a list of valid perfect numbers", func() {
			pn := PerfectNumbers(1000)
			Expect(pn).To(HaveLen(3))
			Expect(pn).To(Equal([]int{6, 28, 496}))
		})
	})

	Context("PerfectNumbersAsync", func() {

		It("should return a channel of valid perfect numbers", func() {
			pn := PerfectNumbersAsync(1000)
			expected := []int{6, 28, 496}
			for _, exp := range expected {
				var act int
				Eventually(pn).Should(Receive(&act))
				Expect(act).To(Equal(exp))
			}
			Eventually(pn).Should(BeClosed())
		})
	})
})
