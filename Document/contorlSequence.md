<a href="#" id="top" >Swift 基础语法-[流程控制和运算]</a>
----
```swift
//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

//swift 没有了 ++ -- 运算符号

// 区间运算符 ...
for index in 1...5{
    print(index)
} // 1.2.3.4.5

// 区间运算符 半开..<

for index in 1..<5{
    print(index)
} // 1.2.3.4.

// 单侧区间 ...5 小于5的所有数。不能便利 适应
let range = ...5.0
range.contains(7)   // false
range.contains(4.2)   // true
range.contains(-1)  // true

let names = ["Anna", "Alex", "Brian", "Jack"]

for name in names[..<2] {
    print(name)
}
// 空合运算符 ??
var val_nil = nil ?? "wangzhe"

/*  ********** Swift  控制流 for ***********    */

//for in

for name in names {
    print("Hello, \(name)!")
}

//如果你不需要区间序列内每一项的值，你可以使用下划线（_）替代变量名来忽略这个值：
/*

let base = 3
let power = 10
var answer = 1

for _ in 1...power {
    answer *= base
    print(answer)
}
*/

/*    ***********  While 循环  ***********       */

var sequence:Int = 10;

while sequence > 0{
    print(" Item is \(sequence)")
    sequence = sequence - 1;
}

/*  ***********  Repeat-While 循环  ***********  */
sequence = 10
repeat{
    print(" Item is \(sequence)")
    sequence = sequence - 1;
} while sequence > 0

/*  ***************  if 循环  **************  */

var temperatureInFahrenheit = 40

if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}


/* *************** Switch ************** */

let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
//case "q":  error 正确做法 下面 贯穿
case "z","w":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}
/*
 循环 流出语句常用的
 continue
 
 break
 
 fallthrough 没有这个关键字。 只是说 这个叫贯穿 如何两个case。使用一个语句块 上面已经展示过了
 
 return
 
 throw
 
 */













```
