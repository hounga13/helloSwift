/* 13 인스턴스 생성 및 소멸 */
// 1. Instance 생성 - initializer
// initializer는 반환 값이 없다.
// instance의 property 초기값을 설정
// init 키워드를 사용한 init() method를 사용

class SomeClass {
	init() {
		// 초기화 시 필요한 코드
	}
}

struct SomeStruct {
	init() {
		// 초기화 시 필요한 코드
	}
}

enum SomeEnum {
	case someCase1
	case someCase2

	init() {
		// 열거형은 각 케이스 중 하나를 반드시 할당
		self = .someCase1
		// 초기화 시 필요한 코드
	}
}


// 2. property 기본값
// 구조체와 클래스의 모든 property는 생성 시점에 초기값 할당 필수 (optional 제외)
// 정의 할 때 기본값을 할당해두면 초기값 할당이 필요 없음
struct Area1 {
	var squarMeter: Double = 0.0
}

let room1: Area1 = Area1()
print(room1.squarMeter)	// 0.0

struct Area2 {
	var squarMeter: Double

	init() {
		squarMeter = 0.0 // 초기값 할당
	}
}

let room2: Area2 = Area2()
print(room2.squarMeter)	// 0.0


// 3. initializer의 매개변수
// 사용자 정의 initializer를 정의하면 기본 initializer는 사용 불가. 따로 구현해야 함
struct AreaStruct {
	var squarMeter: Double

	init (fromPy py: Double) {
		squarMeter = py * 3.3058
	}

	init (fromSquareMether squarMeter: Double) {
		self.squarMeter = squarMeter
	}

	init (value: Double) {
		squarMeter = value
	}

	init (_ value: Double) {
		squarMeter = value
	}
}

let roomOne: AreaStruct = AreaStruct(fromPy: 15.0)
print(roomOne.squarMeter) // 15.0 * 3.3058

let roomTwo: AreaStruct = AreaStruct(fromSquareMether: 33.06)
print(roomTwo.squarMeter) // fromSquareMether

let roomThree: AreaStruct = AreaStruct(value: 45.0)
print(roomThree.squarMeter) // value

let roomFour: AreaStruct = AreaStruct(39.0)
print(roomFour.squarMeter) // 39.0


// 4. optional property type
// 값을 꼭 가지지 않아도 되는 property
// 초기화 할 때 property의 값 지정이 어려운 경우
// optional로 선언 가능
// 값을 할당하지 않으면 자동적으로 nil이 할당
class Person {
	var name: String
	var age: Int?

	init (name: String) {
		self.name = name
	}
}

let myInfo: Person = Person(name: "Kyoungho")

print(myInfo.name)	// Kyoungho
print(myInfo.age)	// nil

myInfo.age = 30

print(myInfo.age)	// optional(30)


// 5. 상수 property
// 상수 property는 instance 초기화 과정에서만 값을 할당
class Person {
	let name: String
	var age: Int?

	init(name: String) {
		self.name = name
	}
}

let myInfo: Person = Person(name: "Kyoungho")
myInfo.name = "Eric"	// Error!!!


// 6. 기본 initializer와 멤버와이즈 initializer
// 기본 initializer
// : property의 기본값이 모두 지정 && 사용자 정의 initalizer 정의되지 않음
// 멤버와이즈 initializer (구조체 only)
// : property의 이름으로 매개변수를 가지는 initializer를 제공
struct Point {
	var x: Double
	var y: Double
}

let point: Point = Point(x: 0.0, y: 0.0)
print("(\(point.x), \(point.y))")


// 7. 초기화 위임
// 구조체와 열거형은 다른 initializer에게 초기화를 위임 가능
// self.init(...) 을 사용
// 최소 2개 이상의 initializer를 정의해야 한다.
enum Student {
	case elementary, middle, high
	case none

	init() {
		self = .none
	}

	init (koreanAge: Int) {
		switch koreanAge {
		case 8...13:
			self = .elementary
		case 14...16:
			self = .middle
		case 17...19:
			self = .high
		default:
			self = .none
		}
	}

	init (bornAt: Int, currentYear: Int) {
		self.init(koreanAge: currentYear - bornAt + 1)
	}
}


var student: Student = Student(koreanAge: 10)
print(student)

student = Student(bornAt: 2000, currentYear: 2017)
print(student)


// 8. 실패가능한 initializer (Failable initializer)
// instance가 초기화 되지 못하는 경우가 있다
// 예) initializer의 전달인자로 잘못된 값이 전달되었을 때
// 실패하였을 때 nil을 반환해주므로 optional로 지정 (실제로 반환하지 않음. 의미만 부여)
// init? 키워드 사용
class Person {
	let name: String

	// Failable initializer
	init?(name: String) {
		if name.isEmpty {
			return nil
		}

		self.name = name
	}
}

let myInfo: Person? = Person(name: "Kyoungho")

if let person: Person = myInfo {
	print(person.name)
} else {
	print("Person is not initialized.")
}


let emptyInfo: Person? = Person(name: "")

if let person: Person = emptyInfo {
	print(person.name)
} else {
	print("Person is not initialized.") 
}


// 9. 함수를 사용한 property 기본값 setting
// instance 초기화 시점에서 함수나 클로저가 호출되면서 그 반환갑을 property에 제공할 수 있음
struct Student {
	var name: String?
	var number: Int?
}

class SchoolClass {
	var students: [Student] =  {
		//새로운 instance를 생성하고 사용자 정의 연산을 한 후 반환
		//반환되는 값은 반드시 [Student]
		var arr: [Student] = [Student]()

		for num in 1...15 {
			var student: Student = Student(name: nil, number: num)
			arr.append(student)
		}

		return arr
	}()
}

let schoolClass: SchoolClass = SchoolClass()

for num in 0...14 {
	if let number: Int = schoolClass.students[num].number {
		print(number)
	}
}


// 10. instance 소멸 (deinitializer)
// 메모리에서 instance가 해제되기 전 정리 작업
// deinit 키워드 사용하여 구현
// class instance에만 구현 가능
// 단 하나만 구현 가능, 매개변수 X, 괄호 X
class SomeClass {
	deinit {
		print ("Instance will be deallocated immediately")
	}
}

var instance: SomeClass? = SomeClass()
instance = nil // Instance will be deallocated immediately
