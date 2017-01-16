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

/*  결과는 아래와 같다.
	Inside == 2 | 4 ==
	Outside == 1 | 3 ==
*/
