/* 03 저장 클래스와 접근 범위 */
// 1. 지역 변수 - code block '{' '}' 내에서 사용되는 변수
func doSomething() {
    let a: Int = 1
    var b = 3
    do {
        let a: Int = 2
        var b = 4
        print("Inside == \(a) | \(b) ==")
    }
    print("Outside == \(a) | \(b) ==")
}

doSomething()

/*  결과
	Inside == 2 | 4 ==
	Outside == 1 | 3 ==
*/

func doSomething2() {
	var a = 1
	do {
		var b = 2
		do {
			var c = 3 // a, b에 접근 가능
			print("c block == \(a) | \(b) ==")
		}
		// a에 접근 가능, c에 접근 불가능
		print("b block == \(a) ==")
		//print("b block == \(a) | \(c) ==")
	}
	// b, c에 접근 불가능
	//print("a block == \(b) | \(c) ==")
}

doSomething2()

/*  결과
	c block == 1 | 2 ==
	b block == 1 ==
*/


// 2. 정적 변수 - swift는 block 내부에서 정적 변수 선언 불가


// 3. 전역 변수, 외부 변수
var sameName = 123

func printSameName() {
    var sameName = 456
    print("== \(sameName) ==")
}

printSameName()

/*  결과
	== 456 ==
*/


// 4. 레지스터 변수 - swift는 레지스터 변수 제공하지 않음


// 5. Namespace
// ModuleName.Identifier
