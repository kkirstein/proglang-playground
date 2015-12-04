// vim: ft=swift sw=4 ts=4
//

if Process.arguments.count != 2 {
	print("Usage: Hello NAME")
} else {
	let name = Process.arguments[1]
	sayHello(name)
}

