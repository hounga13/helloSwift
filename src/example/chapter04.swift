/* 04 옵셔널 */
// 1. Optional type - nil 값을 가질 수 있는 type

var optionalString: String? = "Hello Swift"
optionalString = nil
optionalString = "New string"


// 2. Wrapping & Unwrapping

print("== \(optionalString) ==")
print("== \(optionalString!) ==")

var optionalString2: String! = "Implicitly Unwrapped Optional"

print(optionalString2)


// 3. Optional binding - c언어에서의 null check 개념

optionalString = nil

if (optionalString == nil) {
    print("== Nil !!! ==")
} else {
    print("== optional string is bound. [\(optionalString!)]==")
}

optionalString = "Not nil"

if (optionalString == nil) {
    print("== Nil !!! ==")
} else {
    print("== optional string is bound. [\(optionalString!)]==")
}