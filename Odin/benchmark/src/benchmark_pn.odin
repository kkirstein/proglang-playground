package benchmark
import "core:fmt"
import "core:time"
import "tasks"

benchmark_pn :: proc() {
	sw := time.Stopwatch{}

	fmt.println("Perfect Numbers")
	fmt.println("---------------")
	time.stopwatch_start(&sw)
	perfects := tasks.perfect_numbers(10000)
	defer delete(perfects)
	time.stopwatch_stop(&sw)
	fmt.printfln(
		"perfect_numbers(10000) = %v, elapsed time: %v",
		perfects,
		time.stopwatch_duration(sw),
	)
	time.stopwatch_reset(&sw)

	fmt.println()
}
