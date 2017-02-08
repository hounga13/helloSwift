/* 15 클로저 */
// 0. Closure
// 일정 기능을 하나의 block으로 모아놓음
// 함수도 closure의 일종
// Closure의 형태
// - 이름을 갖고 어떤 값도 획득하지 않는 전역함수 형태
// - 이름을 갖고 다른 함수 내부의 값을 획득할 수 있는 중첩함수 형태
// - 이름이 없고 주변 문맥에 따라 값을 획득할 수 있는 축약 문법 형태

// 1. 기본 closure
// 예) swift library의 sorted(by:) 메서드 정의
//public func sorted(by areInIncreasingOrder: (Element, Element)->Bool)->[Element]

// closure를 전달인자로 받는다.
// (반환 받을 배열의 타입과 같은 두 개의 매개변수(string type 매개변수)를 가지며
// Bool 값을 return하는 closure)
// return값이 true면 첫번째 전달 값이 두번째 전달 값보다 먼저 배열된다.

// 아래 배열을 알파벳 내림 차순으로 정리하고자 한다.
let names: [String] = ["Charles", "Bob", "Donald", "Amy"]

// sorted(by:) 메서드에 전달할 함수 정의
func backwards(first: String, second: String) -> Bool {
	print("\(first), \(second) | comparing...");
	return first > second
}

let reserved: [String] = names.sorted(by: backwards)
print(reserved)


// first > second의 결과만 필요한데 더 간결하게 표현할 수 없을까?
//{ (매개변수들..) -> 반환타입 in
//	//실행코드
//}

// backward 함수 대신에 sorted(by:) 메서드의 전달인자로 closure 직접 전달
let reserved2: [String] = names.sorted(by: {(first: String, second: String)->Bool in
	return first > second
})

print(reserved2)


// 2. 후행 closure
// closure를 읽기 쉽게 바꿔보자
// closure가 길 때, 혹은 가독성 확보가 필요할 때 사용
// 전달인자로 closure가 여러 개 사용될 때는 마지막 closure만 사용 가능
let reserved3: [String] = names.sorted() { (first: String, second: String) -> Bool in
	return first > second
}

// 하나의 closure만 전달인자로 사용할 때는 () 생략 가능
let reserved4: [String] = names.sorted { (first: String, second: String) -> Bool in
	return first > second
}


// 3. closure 표현 간소화
// 3-1. 문맥을 통한 타입 유추
let reserved5: [String] = names.sorted { (first, second) in
	// 반환값이 Bool 타입이라는 것을 유추
	return first > second
}


// 3-2. 단축 인자 이름
// 전달 인자의 순서에 따라 $0, $1, $2... 로 대체할 수 있음
// in 으로 매개변수와 반환타입 구분할 필요가 없음
let reserved6: [String] = names.sorted {
	return $0 > $1
}


// 3-3. 암시적 반환 표현
// return도 생략 가능
let reserved7: [String] = names.sorted { $0 > $1 }
// 이 비교식의 결과가 반환값임을 유추함


// 3-4. 연산자 함수
// swift library에서 연산자 '>'의 정의
// public func > <T: Comparable>(lhs: T, rhs: T) -> Bool
// 함수도 closure의 일종이므로 '연산자 함수'를 sorted(by:) 메소드에 전달인자로
let reserved8: [String] = names.sorted(by: >)


// 4. 값 획득
// 획득(Capture) 주변 문맥을 통해 상수/변수 획득
// 획득한 값을 closure 내부에서 참조/수정 가능
// closure 실행 순간에는 획득한 본래의 상수/변수가 이미 메모리에 존재하지 않을 수 있지만
// 획득한 값을 이용 가능

func makeIncrementer(forIncrement amount: Int) -> (() -> Int) {
	var runningTotal = 0
	func incrementer() -> Int {
		runningTotal += amout
		return runningTotal
	}

	return incrementer
}


// 5. closure는 참조 타입
// closure는 참조 타입이므로
// 서로 다른 상수에 incrementByTwo라는 closure를 할당하면
// 각 상수들은 모두 같은 closure를 가리킨다.

let incrementByTwo: (() -> Int) = makeIncrementer(forIncrement: 2)
let sameWithIncrementByTwo: (() -> Int) = incrementByTwo

print(incrementByTwo())
print(sameWithIncrementByTwo())


// 6. 탈출 closure
// 함수에 전달된 closure가 함수가 종료된 이후에 호출되는 경우 - 탈출(Escape)
// 비동기 작업을 수행하기 위해 함수의 handler를 받아올 때 주로 사용 (Callback?)
// 매개변수 뒤에 : @escaping 키워드 사용하여 표현
var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
	completionHandlers.append(completionHandler)
}


// 함수를 탈출하는 closure의 예
typealias VoidVoidClosure = () -> Void

let firstClosure: VoidVoidClosure = {
	print ("Closure A")
}

let secondClosure: VoidVoidClosure = {
	print ("Closure B")
}

// first와 second 매개변수 closure는 함수의 반환 값으로 사용될 수 있으므로 탈출 closure로 지정
func returnOneClosure(first: @escaping VoidVoidClosure, second: @escaping VoidVoidClosure, shouldReturnFirstClosure: Bool) -> VoidVoidClosure {
	// 전달인자로 받은 closure가 함수 외부로 다시 반환되기 때문에 함수를 탈출하는 closure
	return shouldReturnFirstClosure ? first : second
}

let returnedClosure: VoidVoidClosure = returnOneClosure(first: firstClosure, second: secondClosure, shouldReturnFirstClosure: true)

returnedClosure()

var closures: [VoidVoidClosure] = []

// closure 매개변수 closure는 함수 외부의 변수에 저장될 수 있으므로 탈출 closure
func appendClosure(closure: @escaping VoidVoidClosure) {
	// 전달인자로 전달받은 closure가 함수 외부의 변수 내부에 저장되므로 탈출 closure
	closures.append(closure)
}

appendClosure(closure: first)
print(closures[0]())


// 탈출 closure에서는 호출하는 instance의 property, method, subscript에 접근하려면 self 키워드 사용
typealias VoidVoidClosure = () -> Void

func someFunctionWithEscapingClosure(completionHandler: @escaping VoidVoidClosure) ->
VoidVoidClosure {
	return completionHandler
}

class SomeClass {
	var x = 10

	func runEscapingClosure() -> VoidVoidClosure {
		return someFunctionWithEscapingClosure { self.x = 100 }
	}
}

let instance: SomeClass = SomeClass()

let returnedClosure: VoidVoidClosure = instance.runEscapingClosure()
returnedClosure()
print(instance.x)


// 7. 자동 closure
// 함수의 전달인자로 전달되는 표현을 자동으로 변환해주는 closure
// 전달인자가 없음: () -> ReturnType 의 형태
// block 내부의 결과값 반환
// closure가 호출되기 전까지 내부 code 동작하지 않음
// -> 연산의 지연 가능

// 예제 1
// 대기중인 손님들
var customersInline: [String] = ["YoungWha", "SangYong", "SungHun", "HaMi"]
print(customersInline.count)	// 4

// closure를 만들어두면 closure 내부의 code를 미리 실행하지 않고 갖고만 있는다.
let customerProvider: () -> String = {
	return customersInline.removeFirst()
}

print(customersInline.count)	// 4

// 실제로 실행
print("Now serving \(customerProvider())!")
print(customersInline.count)	// 3


// 예제 2
// 대기중인 손님들
var customersInline: [String] = ["YoungWha", "SangYong", "SungHun", "HaMi"]

func serveCustomer(_ customerProvider: () -> String) {
	print("Now serving \(customerProvider())!")
}

// 실제로 실행
serveCustomer( { customersInline.removeFirst() } )


// 예제 3 자동 closure의 사용!!
// 대기중인 손님들
var customersInline: [String] = ["YoungWha", "SangYong", "SungHun", "HaMi"]

func serveCustomer(_ customerProvider: @autoclosure () -> String) {
	print("Now serving \(customerProvider())!")
}

// 실제로 실행
serveCustomer(customersInline.removeFirst())

// @autoclosure 키워드를 사용하여 자동 closure라는 것을 명시해주었기 때문에
// customersInline.removeFirst()의 결과값을 반환하는 closure로 인식

// @autoclosure는 @noescape 속성을 포함하므로
// 자동 closure를 탈출 closure로 사용하고 싶으면 @autoclosure @escaping
var customersInline: [String] = ["YoungWha", "SangYong", "SungHun"]

func returnProvider(_ customerProvider: @autoclosure @escaping () -> String) -> (() -> String) {
	return customerProvider
}

let customerProvider: () -> String = returnProvider(customersInline.removeFirst())
print("Now Serving \(customerProvider())!")

	