/* 17 맵, 필터, 리듀스 */
// 0. Map, Filter, Reduce
// swift는 함수를 1급 객체로 취급
// 고차함수: 매개변수로 함수를 가지는 함수
// 대표적 고차함수: Map, Filter, Reduce
// Sequence, Collection 프로토콜을 따르는 타입과 옵셔널에 사용 가능


// 1. Map
// 배열, set, dectionary, optional 등
// container가 담고 있던 값을 매개변수 함수에 적용한 후 다시 container에 포장하여 반환
// 주의: 기존 container가 변하는 것이 아니라 새로운 container가 생성, 반환
// 기존 data를 변형하는데 많이 사용됨
// 호출 방법 및 결과
// container.map(f(x)) // container의 map 메소드 호출
// return f(container의 각 요소)를 한 새로운 container
// for-in 구문과 같은 역할 but, 다중 thread 환경에서 container 값이 동시에 변경되려고 할 때 예측지 못한 결과 방지

// for-in 구문과 map 메소드 비교
// for-in 구문 사용
let numbers: [Int] = [0, 1, 2, 3, 4]

var doubledNumbers: [Int] = [Int]()
var strings: [String] = [String]()

for number in numbers {
	doubledNumbers.append(number * 2)
	strings.append("\(number)")
}

print(doubledNumbers)
print(strings)

// map 메소드 사용
doubledNumbers = numbers.map({(number: Int)->Int in
	return number * 2
})

strings = numbers.map({(number: Int)->String in
	return "\(number)"
})

print(doubledNumbers)
print(strings)

// closure 표현식을 사용하여 간략화
let numbers: [Int] = [0, 1, 2, 3, 4]

// 기본 closure 표현식
var doubledNumbers = numbers.map({ (number: Int)->Int in
	return number * 2
})
print(doubledNumbers)

// 매개변수, 반환 타입 생략
doubledNumbers = numbers.map({ return $0 * 2 })
print(doubledNumbers)

// return 키워드 생략
doubledNumbers = numbers.map( { $0 * 2} )
print(doubledNumbers)

// 후행 closure 사용
doubledNumbers = numbers.map { $0 * 2 }
print(doubledNumbers)

// code 재사용 측면에서 closure를 상수에 저장해두고 사용하면 편리하다


// 2. Filter
// container 내부의 값을 걸러서 추출
// map과 같이 새 container에 값을 담아 반환
// Return type: Bool
// True면 포함, False면 걸러냄
let numbers: [Int] = [0, 1, 2, 3, 4, 5]

let evenNumbers: [Int] = numbers.filter { (number: Int)->Bool in
	return number % 2 == 0
}
print(evenNumbers)

let oddNumbers: [Int] = numbers.filter { $0 % 2 != 0 }
print(oddNumbers)

// map + filter 연계 사용
let numbers: [Int] = [0, 1, 2, 3, 4, 5]

let mappedNumbers: [Int] = numbers.map { $0 + 3 }
let evenNumbers: [Int] = mappedNumbers.filter { (number: Int)->Bool in
	return number % 2 == 0
}
print(evenNumbers)

// map method의 반환 값을 따로 사용할 것이 아니라면 method를 연속으로 연결하여 사용 가능
let oddNumbers: [Int] = numbers.map{ $0 + 3 }.filter{ $0 % 2 != 0 }
print(oddNumbers)


// 3. Reduce
// 사실상 Combine 이라고 불려야 한다고 필자는 말함
// Container 내부 내용을 합쳐준다.
// 정수 배열 -> 배열의 값을 전달 받은 함수의 결과로 합쳐준다.
// 문자열 배열 -> 문자열을 하나로 합쳐준다.
let numbers: [Int] = [1, 2, 3]

// 초깃값이 0이고 정수 배열의 모든 값을 더한다.
var sum: Int = numbers.reduce(0, { (first: Int, second: Int)->Int in
	print("\(first) + \(second)")
	// 0 + 1
	// 1 + 2
	// 3 + 3
	// 이 차례대로 수행
	return first + second
})
print(sum)

// 초깃값이 3이고 정수 배열의 모든 값을 뺀다.
var subtract: Int = numbers.reduce(3, { (first: Int, second: Int)->Int in
	print("\(first) - \(second)")
	// 3 - 1
	// 2 - 2
	// 0 - 3
	// 이 차례대로 수행
	return first - second
})
print(subtract)

// 문자열 배열을 reduce(_:_:) 메소드를 통해 연결
let names: [String] = ["Chope", "Jay", "Joker", "Nova"]

let reducedNames: String = names.reduce("My friend : ") {
	return $0 + ", " + $1
}

print(reducedNames)