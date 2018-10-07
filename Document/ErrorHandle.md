<a href="#" id="top">Swift基础语法 错误处理</a>
-----
```Swift
//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
/*
  错误处理（Error handling）
  是响应错误以及从错误中恢复的过程。
  Swift 提供了在运行时对可恢复错误的抛出、捕获、传递和操作的一等公民支持。
 */
enum VendingMachineError:Error {
    case invalidSelection                         //选择无效
    case insufficientFunds(coinsNeeded: Double)   //金额不足
    case outOfStock                               //缺货
}


//一个标有throws关键字的函数被称作throwing 函数。如果这个函数指明了返回值类型，throws关键词需要写在箭头（->）的前面。
func getMeony(count:Double) throws ->Double{
    
    print("run it")
    
    if count < 0 {
        throw VendingMachineError.invalidSelection
        //没有钱 选择无效
    }
    
    guard count >= 100 else {
        throw VendingMachineError.insufficientFunds(coinsNeeded: 100.0 - count)
    }
    
    return count
}



do{
  //try getMeony(count:-98.0)
  try getMeony(count: 95.3)
}catch VendingMachineError.invalidSelection{
    print("can do it select is wrong!")
}catch VendingMachineError.insufficientFunds(let coinsNeeded){
    print("you need add \(coinsNeeded) doller more")
}

/* 基本步骤*/
// 创建一个继承自Error 的枚举
// 在函数内部 或者其他代码块中 抛出异常
// ran hou  shiyong do try catch  buhuo  exception
// shiyong  try! try? wo bao zheng zhe kuai daima buhui chucuo




```
