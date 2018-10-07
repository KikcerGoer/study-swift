<a href="#" id="top" >Swift基础语法--[扩展和协议]</a>
```Swift
//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
//扩展 就是为一个已有的类、结构体、枚举类型或者协议类型添加新功能。
/*
   extension SomeType {
     // 为 SomeType 添加的新功能写到这里
   }
 */
// 扩展的功能
//  添加计算型属性和计算型类型属性
//  定义实例方法和类型方法
//  提供新的构造器
//  定义下标
//  定义和使用新的嵌套类型
//  使一个已有类型符合某个协议
class person{
    var name:String
    var age:Int
    var sex:Bool
    
    init(name:String,age:Int,sex:Bool) {
        self.name = name
        self.age = age
        self.sex = sex
    }
}
//扩展person
extension person{
    //扩展方法
    func show() -> String {
        return "My name is \(name) and age is \(age)"
    }
    //扩展构造函数
    convenience init(name:String){
        self.init(name:name,age:18,sex:true);
    }
    //扩展下表
    subscript(index:Int)->Int{
        return index * 10
    }
}
var po = person(name:"jxkicker",age:18,sex:true)
print(po.show())
var po1 = person(name:"kickergod")

// 扩展 Double
extension Double {
    var km: Double { return self * 1_000.0 }
    var m : Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
    /*
      通过扩展添加的实例方法也可以修改该实例本身。结构体和枚举类型中修改 self
      或其属性的方法必须将该实例方法标注为 mutating，正如来自原始实现的可变方法一样。
     */
    mutating func pingfang(){
        self = self * self
    }
}
let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
// 打印 “One inch is 0.0254 meters”
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
// 打印 “Three feet is 0.914399970739201 meters”
/*
  -------- 协议（接口）
  定义了一个蓝图，规定了用来实现某一特定任务或者功能的方法、属性，以及其他需要的东西。
  类、结构体或枚举都可以遵循协议，并为协议定义的这些要求提供具体实现。某个类型能够满足某
  个协议的要求，就可以说该类型遵循这个协议。
 */



// 要让自定义类型遵循某个协议，在定义类型时，需要在类型名称后加上协议名称，
// 中间以冒号（:）分隔。遵循多个协议时，各协议之间用逗号（,）分隔：

protocol IEncode{
    //接口 属性
    var  hasEncode:Bool { get set }
    //接口 方法
    func Encode(data:String) -> String;
    //静态方法
    static func Encode(data:String) -> String
    // mutating 改变实例 修饰
    mutating func toggle()
    //构造器
    init(Parameter: String)
}

extension IEncode{
    func Decode(data:String)->String{
        return data + "ed"
    }
}
//协议继承
protocol coding:IEncode{
    var dataStyle:String{ get set }
}


protocol SomeClassOnlyProtocol: class {
    // 这里是类类型专属协议的定义部分
}

/*
  有时需要在方法中改变方法所属的实例。例如，在值类型（即结构体和枚举）的实例方法中，
 将 mutating 关键字作为方法的前缀，写在 func 关键字之前，表示可以在该方法中修改它
 所属的实例以及实例的任意属性的值。这一过程在在实例方法中修改值类型章节中有详细描述。
 */

protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
struct Person: Named, Aged {
    var name: String
    var age: Int
}

//可选的协议要求


```
