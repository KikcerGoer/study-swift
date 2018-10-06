<a href="#" id="top"> Swift 基础语法-[函数与数组]</a>
```Swift
//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

/* 构建函数 (参数...)->返回值 { ... return } */
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person:"Kicker"))
// 没有返回值 就不用 return

/* 默认参数 */
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // 如果你在调用时候不传第二个参数，parameterWithDefault 会值为 12 传入到函数体中。
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault = 6
someFunction(parameterWithoutDefault: 4) // parameterWithDefault = 12

/* 可变参数 */
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// 返回 3.0, 是这 5 个数的平均数。
arithmeticMean(3, 8.25, 18.75)
// 返回 10.0, 是这 3 个数的平均数。


/* 输入输出参数 */
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var a = 10 ,b = 20

swapTwoInts(&a, &b)

print("a:\(a) b:\(b)")


/* 将函数类型作为参数*/
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}//返回函数类型

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

/*   闭包（Closures）  */

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)

// 闭包表达式语法
/*
{ (parameters) -> returnType in
    statements
}
*/
reversedNames = names.sorted(by:{
    (s1:String,s2:String) -> Bool in
    return s1 > s2
})
// 闭包根据上下文推断类型
reversedNames = names.sorted(by:{
    s1 , s2 -> Bool in return s1 > s2
})

// 单表达式闭包隐式返回
reversedNames = names.sorted(by:{
    s1 , s2  in  s1 > s2
})

// 参数名称缩写
reversedNames = names.sorted(by:{ $0 > $1 })

// 运算符方法
reversedNames = names.sorted(by: >)

/*******  尾随闭包   *******/
/*
 如果你需要将一个很长的闭包表达式作为最后一个参数传递给函数，可以使用尾随闭包来增强函数的可读性。
 尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用。在使用尾随闭包时
 你不用写出它的参数标签：
 */
reversedNames = names.sorted() { $0 > $1 }

//值捕获 值捕获
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

// 元组（tuples）把多个值组合成一个复合值。元组内的值可以是任意类型，并不要求是相同类型。
// 用(  )表示
// 当函数需要返回若干值时，可以利用元组一次性返回多个值
let http200Status = (statusCode: 200, description: "OK")
//元组可以分解，可以使用下标方式来访问元组中的每个值：
let currency = http200Status.1     // " EUR"

print(currency)

```
