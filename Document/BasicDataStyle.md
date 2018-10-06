<a href="#" id="top">Swift 基础语法 - [基本数据类型]</a>
-----
```swift
//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

//使用 let 来声明常量
//使用 var 来声明变量

//不声明变量类型 编译器会自动类型推断 冒号可以提供类型信息

var myVal:Int = 42;
var val = 42;

/* 类型转换 为题： 一个值不能隐式转换 */

let lable = "the width is"
let width = 94

//let width_lable = lable + width;  Error syntex
let width_lable = lable + " " + String(width);

print(width_lable)

//常量，变量的 字符串插值
let apples = 3
let oranges = 5

let appleSmmary = "I have \(apples) apples."
let fruitSummary = "I have \(oranges) pieces of  fruit."
/* Swift 语言提供Arrays、Sets和Dictionaries三种基本的集合类型用来存储集合数据。
 数组（Arrays）是有序数据的集。集合（Sets）是无序无重复数据的集。
 字典（Dictionaries）是无序的键值对的集*/

/* Swift 语言中的Arrays、Sets和Dictionaries中存储的数据值类型必须明确。
 这意味着我们不能把不正确的数据类型插入其中。同时这也说明我们完全可以对
 取回值的类型非常自信。*/

/* 1.创建直接数组 */
var shoppingList = ["water","tuilps","blue paint","battle"]

/* 2.适应数组字面量创建数组  */
var arraylist:[String] = ["jiangxing","lizhiming"]

/* 3.类型 数组 */
var emptyArray = [String]();
var antlist = Array(repeating:2.5,count:3)

// 4.1 数组相加
var listAnt  = shoppingList + arraylist

print(listAnt)

// 4.2 数组添加元素
emptyArray.append("123")
emptyArray.append("456")
print(emptyArray)

// 4.3 isEmpty 属性判断数组是否为空
if  emptyArray.isEmpty{
    print("this Array is empty");
}else{
    print("this Array is ")
}

// 4.4 垃圾语言 垃圾语法之 几把 复制方法...
var mylist:[Int] = [1,2,3,4,5,6,7,8,9]
mylist[2...6] = [10,11,12,13]

/* 4.5 插入值 或者 删除值*/
var TiList:[Int] = [2,3,4,5,6,7]
TiList.insert(5, at: 0)

/* 4.6 删除值*/
TiList.remove(at: 0)

// 数组的遍历

for item in TiList{
    print(item)
}

for (index,value) in TiList.enumerated(){
    print("Item \(index): \(value)")
}


//集合
var letters = Set<Character>();

letters.insert("a");



//类型字典

//字典  键值对 键值都必须用引号 哪怕是 数字
// 1.0 字典初始化创造
var occupations = [
    "age":"19",
    "name":"lizhiming",
    "sex":"true"
]
print(occupations["age"]!)

// 2.创建一个类型空数组
var emptydirectionary = [String:String]()
// 是一个空的 [Int: String] 字典

// 3.创建一个数组 并初始化
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]


// 4.1 访问值 通过键
airports["YYZ"] = "my name is jiangxing"

// 4.2 修改值
// updateValue 返回旧值
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
// 输出 "The old value for DUB was Dublin."

// 4.3 添加元素
var mutableDict = [String:AnyObject]()

mutableDict["name"] = "summer" as AnyObject?
mutableDict["age"] = 18 as AnyObject?
mutableDict["height"] = 1.88 as AnyObject?
mutableDict["weight"] = 60 as AnyObject?

// 4.4 删除元素
mutableDict.removeValue(forKey: "age")

// 4.5 遍历字典中所以的值
for value in mutableDict.values
{
    print(value)
    
}
// 4.6 遍历所有的键值对
for (key, value) in mutableDict
{
    print(key)
    print(value)
}
```
