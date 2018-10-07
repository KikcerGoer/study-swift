<a href="#" id="top">Swift基础语法--[高阶函数]</a>
----
```Swift
//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

//1 map：可以对数组中的每一个元素做一次处理 返回每个元素的执行结果‘

// 计算字符串的长度 返回每个元素的执行结果
let stringArray = ["Objective-C", "Swift", "HTML", "CSS", "JavaScript"]

//闭包
var lists = stringArray.map({$0.count})

print(lists)

func stringCount(string: String) -> Int {
    return string.count
}
stringArray.map(stringCount)

stringArray.map({string -> Int in
    return string.count
})

//2.flatMap
//flatMap返回后的数组中不存在nil，同时它会把Optional解包
let array = ["Apple", "Orange", "Puple", ""]
var list_li = array.flatMap{
    (a:String) -> Int?
        in
        let length = a.count
        guard length > 0 else {
            return nil
        }
        return length
    }

print(list_li)
let arrayt = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

let arr1 = arrayt.map{ $0 }
arr1 // [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

let arr2 = arrayt.flatMap{ $0 }
arr2 // [1, 2, 3, 4, 5, 6, 7, 8, 9]
print(arr1,arr2)
//3.filer
//filer：过滤，可以对数组中的元素按照某种规则进行一次过滤
var filist = stringArray.filter({$0.count > 5})
print(filist)


//4 reduce：计算，可以对数组的元素进行计算

print(stringArray.reduce("", {$0 + $1}))
```
