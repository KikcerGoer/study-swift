<a href="#" id="top">Swift基础语法 --[范型和关键字]</a>
----
```Swift
//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

// 范型
// 泛型代码让你能够根据自定义的需求，编写出适用于任意类型、灵活可重用的函数及类型。
// 它能让你避免代码的重复，用一种清晰和抽象的方式来表达代码的意图。


func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var a = 50
var b = 60
// 使用范型方法
swapTwoValues(&a, &b)

print(a,b)

/* 范型约束
 func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
   // 这里是泛型函数的函数体部分
 }
 */
protocol Container {
    associatedtype ItemType
    mutating func append(_ item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

struct Stack<Element>: Container {
    // Stack<Element> 的原始实现部分
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // Container 协议的实现部分
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

/****  guard  改写  if 语句 ****/
// else 里面只能使用 throw 或者 return 语句
var age:Int = 10

if age >= 9 {
    print("you are ok  can do it now")
}


func isOkOfAge(age:Int) -> String{
    guard age >= 9 else {
        return "you are not ok  can‘t do it now"
    }
    return "you are ok  can do it now"
}

print(isOkOfAge(age:5))

//defer 译为延缓、推迟之意。
//读取某文件内容并处理数据，你需要首先打开文件夹，读取文件内容以及处理数据，关闭文件以及文件夹。
/*
func dosomething(){
    openFile()
    
    defer {
        closeFile()
    }
    //do something other
}
*/

/* staic  静态声明 */
/* 使用final声明的类不能被继承
 使用final声明的属性、方法和下标不能被重写
 */

/*
 在Swift中，访问范围主要有两个：模块，源文件。
     模块     是指一个应用程序包或一个框架。
     源文件  是扩展名为.swift文件。
 
 Swift提供了3种访问级别：
     public    可以访问自己模块中的任何public实体。如果使用import语句导入其他模块，我们可以访问其他模块的public实体。
 
     internal    能访问自己模块的任何internal实体，不能访问其他模块中的internal实体。
     internal可以省略，默认访问权限是internal。
 
     private    只能在当前源文件中使用的实体，称为私有实体。
 */


```
