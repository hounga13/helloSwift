/* 11 클래스와 구조체 */
// 1. 구조체
struct BasicInformation {
	var name: String
	var age: Int
}

var myInfomation: BasicInformation = BasicInformation(name: "Kyoungho", age: 30)

print("\(myInfomation.name)\'s age is \(myInfomation.age).")

myInfomation.name = "Bob"
myInfomation.age = 27

print("\(myInfomation.name)\'s age is \(myInfomation.age).")


let constInformation: BasicInformation = BasicInformation(name: "Charles", age: 15)

constInformation.name = "Alice"


// 2. 클래스
class Person {
	var height: Float = 0.0
	var weight: Float = 0.0

	deinit {
		print("Deinitializes instance of Person class.")
	}
}

var myInstance: Person? = Person()
myInstance = nil


// 3. 구조체와 클래스의 차이
struct SampleStruct {
	var name: String
	var count: Int
}

var testStruct: SampleStruct = SampleStruct(name: "Sample Struct", count: 1)

class SampleClass {
	var name: String = ""
	var count: Int = 0
}

var testClass: SampleClass = SampleClass()

testClass.name = "Sample Class"
testClass.count = 1

print("------ before change ------")
print("Sample Struct: Name: \(testStruct.name), Count: \(testStruct.count)")
print("Sample Class : Name: \(testClass.name), Count: \(testClass.count)")

func changeStructProperties(_ info: SampleStruct) {
	var copiedInfo: SampleStruct = info
	copiedInfo.name = "Struct name is changed."
	copiedInfo.count = 2
}

func changeClassProperties(_ info: SampleClass) {
	let copiedInfo: SampleClass = info
	copiedInfo.name = "Class name is changed."
	copiedInfo.count = 2
}

changeStructProperties(testStruct)
changeClassProperties(testClass)

print("------ after change ------")
print("Sample Struct: Name: \(testStruct.name), Count: \(testStruct.count)")
print("Sample Class : Name: \(testClass.name), Count: \(testClass.count)")