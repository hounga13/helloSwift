/* 06 제어문: 반복문 */
// 1. for-in
let list = ["one", "two", "three"]

for str in list {
	print(str)
}

for str in list.reversed() {
	print(str)
}

for index in 1...3 {
	print(index)
}

for index in 1..<3 {
	print(index)
}

for ch in "str".characters {
	print(ch)
}


// 2. while
var i = 0
while i < 3 {
	print(i)
	i += 1
}


// 2-1. repeat while
var j = 0
repeat {
	print(j)
	j += 1
} while j < 3