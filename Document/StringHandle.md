<a href="#" id="top">Swift基础语法--[字符串处理] </a>
----
```Swift
// 1.每一个String值都有一个关联的索引(index)类型，String.Index，它对应着字符串中的每一个Character的位置。
// 2.前面提到，不同的字符可能会占用不同数量的内存空间，所以要知道Character的确定位置，就必须从String开头遍
// 历每一个 Unicode 标量直到结尾。因此，Swift 的字符串不能用整数(integer)做索引。

//字符串截取的下标不是整数int  而是 index 类型 所有必须使用index 获取 index 下标 获得下标有下面两种方式。。。还有其他的
//截取字符串 6 ～20
var str = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS."

let index_1 = str.index(str.startIndex, offsetBy: 6)
let index_2 = str.index(str.startIndex, offsetBy: 20)

let sub = str[index_1...index_2]
print(sub)

//截取字符串 ，之前的所有字符
let greeting = "Hello, world!"

let index = greeting.index(of: ",") ?? greeting.endIndex
let beginning = greeting[..<index]
// beginning 的值为 "Hello"

// 把结果转化为 String 以便长期存储。
let newString = String(beginning)
print(newString)

//删除 替换 字符串 蒋os 删除

let re_str = str.replacingOccurrences(of: "OS", with: "")
print(re_str)

分解字符串    components(separatedBy: " ")

从文件初始化   String(contentsOfFile: )
保存到文件    write(toFile:   )
```
