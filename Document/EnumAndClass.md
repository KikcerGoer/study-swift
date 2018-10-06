<a href="#" id="top">Swift 基础语法 - [枚举和类]</a>
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


```
