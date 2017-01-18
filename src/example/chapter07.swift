/* 07 제어문: 조건문 */
// 1. if, else if, else
var number = 10

if number % 3 == 0 {
	print("\(number) 는 3의 배수")
} else if number % 4 == 0 {
	print("\(number) 는 4의 배수")
} else if number % 5 == 0 {
	print("\(number) 는 5의 배수")
} else {
	print("\(number) 는 3, 4, 5의 배수가 아님")
}


// 2. gaurd - 조건식을 만족하지 않으면 block 내부 수행. return, break 등
var condition = false

gaurd condition else {
	print("Condition is \(condition)")
	return
}


// 3. switch
let num = 3

switch num {
case 0, 1, 2:
	print("0 ~ 2")
case 3...5:
	print("3 ~ 5")
	fallthrough
case 3:
	print("3");
default:
	print("Out of range")
}


let company = "Samsung"

switch company {
case "Apple":
	print("iPhone")
case "Microsoft":
	print("Window phone")
case "Samsung":
	print("Galaxy")
default:
	print("Something else")
}


// 4. break, continue
for index in 1...10 {
	if index % 2 == 0 {
		break
	}

	print("Index = \(index)")
}

for index in 1...10 {
	if index % 2 == 0 {
		continue
	}

	print("Index = \(index)")
}


// 5. Labeled Statements
OUTERLOOP:
for index in 0..<3 {
	for j in 0...10 {
		if j > 2 {
			break OUTERLOOP
		}

		print("Inner loop: \(j)")
	}

	print("OUTERLOOP \(index)")
}