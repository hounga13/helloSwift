/* 09 함수 */
// 1. 함수의 정의
func sayHello(myName: String, yourName: String) -> String {
	return "Hello \(yourName)! I'm \(myName)."
}

print(sayHello(myName: "Kyoungho", yourName: "Jason"))


// 2. 매개변수 이름과 전달인자 레이블
func sayHello (from myName: String, to yourName: String) -> String {
	return "Hello \(yourName)! I'm \(myName)"
}

print (sayHello (from: "Kyoungho", to: "Jason"))


// 3. 와일드카드 매개변수 이름 사용
func sayHello (_ myName: String, _ yourName: String) -> String {
	return "Hello \(yourName)! I'm \(myName)"
}

print (sayHello ("Kyoungho", "Jason"))


// 4. 매개변수의 기본값
func repeatName (name: String, times: Int = 3) -> String {
	var result: String = ""
	for _ in 0..<times {
		result += "\(name) "
	}
	return result
}

print (repeatName(name: "Kyoungho"))


// 5. 가변 매개변수
func callFriends (friends names: String...) -> String {
	var result: String = ""
	for  friend in names {
		result += "Hello \(friend)!" + " "
	}
	return result
}
print (callFriends(friends: "Amy", "Bob", "Charles"))


// 6. 입출력 매개변수
var numbers: [Int] = [1, 2, 3]

func referenceParameter(_ arr: inout [Int]) {
	arr[1] = 1
}

referenceParameter(&numbers)
print(numbers)


// 7. 함수의 데이터 타입 표현
typealias CalculateTwoInts = (Int, Int) -> Int

func addTwoInts(_ a: Int, _ b: Int) -> Int {
	return a + b
}

var addFunc: CalculateTwoInts = addTwoInts
print(addFunc(3, 4))


// 8. 중접 함수
// | -3 | -2 | -1 |  0 |  1 |  2 |  3 |
typealias MoveFunc = (Int) -> Int

func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc {
	func goRight(_ currentPosition: Int) -> Int {
		return currentPosition + 1
	}

	func goLeft(_ currentPosition: Int) -> Int {
		return currentPosition - 1
	}

	return shouldGoLeft ? goLeft : goRight
}

var position: Int = -4

let moveToZero: MoveFunc = functionForMove(position > 0)

while position != 0 {
	print("Current Position: \(position)")
	position = moveToZero(position)
}

print("원점 도착")