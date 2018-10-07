<a href="#" id="top">Swift 基础语法 - [枚举和类]</a>
----
```Swift
#if os(Linux)
  import Glibc
#else
  import Darwin
#endif
 
// 枚举类型 指定值类型   
enum CompassPoint:Int {
    case north = 1
    case south = 2
    case east = 4
    case west = 8
}

var point = CompassPoint.north;

print(point)

//枚举关联值 元祖类型

enum Code {
  case Point(X:Double,Y:Double, Z:Double)
  case DayTime(Int,Int,Int) 
  case Place(Country:String,Province:String,Region:String)
}

let Yuechi = Code.Place(Country:"中国人民共和国",Province:"四川省",Region:"广安市")

print(Yuechi)

//枚举关联值ti'qu
enum LineSegmentDes {  
  case StartAndPattern(start:Double,end:Double)   
  case StartAndLength(start:Double,length:Double)
}
var les = LineSegmentDes.StartAndPattern(start: 10, end: 20)
    les = LineSegmentDes.StartAndLength(start: 10, length: 10) 


switch les{
   case let .StartAndPattern(s,e):
     print("\(s),\(e)")
   case .StartAndLength(let s,let l):   
     print("start:\(s)->length:\(l)")
}

// 创建一份类 对象
/*****************   创建类和结构体的语法    ****************
class SomeClass {
    // 在这里定义类
}
struct SomeStructure {
    // 在这里定义结构体
}
**********************************************************/
class NameShape{
    var numberOfSides:Int = 0
    var name:String
    
    init(name:String) {
        self.name = name
    }
    static func ==(one:NameShape,two:NameShape)-> Bool{
        if(one.name == two.name){
            return true;
        }
        return false;
    }
    func simpleDescription()-> String{
        return "\(name) 's shape with \(numberOfSides) sides."
    }
}

var one:NameShape = NameShape(name:"jxkicker");
var two:NameShape = NameShape(name:"jxkicker");
print(one == two) //操作符做法
/* *****                        属性观察器                ***** */
// 属性观察器监控和响应属性值的变化，每次属性被设置值的时候都会调用属性观察器
// 即使新值和当前值相同的时候也不例外


//可以为属性添加如下的一个或全部观察器：

/*****************************************************************
 
   willSet 在新的值被设置之前调用
   didSet 在新的值被设置之后立即调用
 
 ******************************************************************/

class MyPoint{
    var x:Int{
        willSet(newValue){
            print("this is new value \(newValue)")
        }
        didSet{
             print("old value is \(oldValue)")
        }
    }
    
    func showx()->Int {
        return x;
    }
    
    init(X:Int) {
        self.x = X
    }
    
}

var p1 = MyPoint(X:5);
var p2 = MyPoint(X:6);

p1.x = 7;
/*
 this is new value 7
 old value is 5
 */
p2.x = 10;

/* *****                       下标语法                     ***** */
// 下标允许你通过在实例名称后面的方括号中传入一个或者多个索引值来对实例进行存取。
// 语法类似于实例方法语法和计算型属性语法的混合
// 定义下标使用subscript关键字   ------------------------------------

class dic{
    var list:[String:String] = [
        "age":"18",
        "name":"kicker",
        "sex":"boy",
        "height":"173",
        "weight":"120"
    ]
    
    subscript(key:String) ->String{
        get{
            return list[key]!;
        }
        set(newValue){
            list[key] = newValue;
        }
    }
}
var diclist = dic();
var val_dic = diclist["age"];
print(val_dic)



/*
   函数：通过名字来进行直接调用，独立的功能模块
   方法：通过名字来进行调用，但它跟一个类对象相关联，可以
        操作类内部的数据
 */



/*    ************   继承  ************    */
// 一个类可以继承另一个类的方法，属性和其它特性。当一个类继承其它类时，继承类叫子类，被继承类叫超类（或父类）。
// 在 Swift 中，继承是区分「类」与其它类型的一个基本特征。
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // 什么也不做-因为车辆不一定会有噪音
    }
}

class Bicycle: Vehicle {
    var hasBasket = false
}

/* ******** ***** 继承方法重写  ***** ********  */
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

/* ******** ***** 继承属性重写  ***** ********  */
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}
/* *****    属性或下标标记为final来防止它们被重写    ***** */


/* *****                       构造函数                     ***** */
/*
   init() {
       // 在此处执行构造过程
   }
 
  如果结构体或类的所有属性都有默认值，同时没有自定义的构造器，那么 Swift
  会给这些结构体或类提供一个默认构造器（default initializers）。
  这个默认构造器将简单地创建一个所有属性值都设置为默认值的实例。
 */
class Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

/*   类的构造器代理规则 */
/*
  1. 指定构造器必须调用其直接父类的的指定构造器。
  2. 便利构造器必须调用同类中定义的其它构造器。
  3. 便利构造器必须最终导致一个指定构造器被调用。
 */

class ClassA{
    let numA:Int
    
    init(num:Int){
        numA = num
    }
    
    convenience init(BitNum:Bool){
        self.init(num:BitNum ? 10000:1)
    }
}
/* super 实现父类 并且线实现自己 再去实现父类 */
class ClassB:ClassA{
    let numB:Int
    override init(num:Int){
        numB = num + 1
        super.init(num: num)
    }
}

// required required修饰符只能用于修饰类初始化方法。
/*
  当子类含有异于父类的初始化方法时（初始化方法参数类型和数量异于父类），子类
  必须要实现父类的required初始化方法，并且使用required修饰符而不是override
 
 */

class object{
    let numo:Int
    
    required init(num:Int){
        numo = num
    }
    
    convenience init(BitNum:Bool){
        self.init(num:BitNum ? 10000:1)
    }
}

class ClassC:object{
    let numC:Int
    let name:String
    required init(num: Int) {
        numC = num + 10
        self.name = "jxkicker"
        super.init(num: num + 15)
    }
    
    init(name:String,num:Int){
        numC = num + 1
        self.name = name;
        super.init(num: num)
    }
}

/*
   如果一个类、结构体或枚举类型的对象，在构造过程中有可能失败，则为其定义一个可失败构造器。
   这里所指的“失败”是指，如给构造器传入无效的参数值，或缺少某种所需的外部资源，又或是不满足某种必要的条件等。
 
 */

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe")

if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}


/* 析构函数
 
  deinit {
     // 执行析构过程
  }
 
 */

// 类、对象 – 类型检查和转换
// is   操作符用于判断一个实例是否是某个类的类型
// as  操作符用于转换一个实例到某个类的类型 如果不确定类型转换能否成功，可以在as后面加问号“?”
// 返回类型是Bool

var one_c = ClassC(num:5)

print(one_c is object)

/*
Any 和 AnyObject 的类型转换
Swift 为不确定类型提供了两种特殊的类型别名：

Any 可以表示任何类型，包括函数类型。
AnyObject 可以表示任何类类型的实例。
 */
var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append({ (name: String) -> String in "Hello, \(name)" })


/*
    弱引用不会对其引用的实例保持强引用，因而不会阻止 ARC 销毁被引用的实例。
    这个特性阻止了引用变为循环强引用。声明属性或者变量时，在前面加上weak关键字表明这是一个弱引用。
    lazy
    仅在需要时才分配内存，对小内存的手机非常实用。
    一种使用场景是，对象的属性的初始值依赖于其它的属性，所以必须先创建出这个对象，才能知道这个属性的值。
 
 */

/* 恒等运算符*/
//如果能够判定两个常量或者变量是否引用同一个类实例将会很有帮助。为了达到这个目的，Swift 内建了两个恒等运算符：
/*  等价于（===）
    不等价于（!==）
 */

// 所有结构体都有一个自动生成的成员逐一构造器，用于初始化新结构体实例中成员的属性。
// 新实例中各个属性的初始值可以通过属性的名称传递到成员逐一构造器之中：
// 结构体和枚举是值类型 值类型被赋予给一个变量、常量或者被传递给一个函数的时候，其值会被拷贝。

/*            *********** 结构体的逐一成员构造器 ***********             */
struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)

```
