  <a href="#" id="top">Swift基础语法--[沙盒处理]</a>
  -----
  ```Swift
  //: Playground - noun: a place where people can play

import UIKit

/*
Documents：苹果建议将程序创建产生的文件以及应用浏览产生的文件数据保存在该目录下，iTunes备份和恢复的时候会包括此目录
 
Library：存储程序的默认设置或其它状态信息；
 
Library/Caches：存放缓存文件，保存应用的持久化数据，用于应用升级或者应用关闭后的数据保存，不会被itunes同步，所以为了减少同步的时间，可以考虑将一些比较大的文件而又不需要备份的文件放到这个目录下。
 
Library/Preference：保存应用的所有偏好设置，IOS的Settings应用会在该目录中查找应用的设置信息。
 
tmp：提供一个即时创建临时文件的地方，但不需要持久化，在应用关闭后，该目录下的数据将删除，也可能系统在程序不运行的时候清除。
 
*/

let home = NSHomeDirectory() //获取沙盒跟路径

//document 文档目录--方法一
let documentpath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last

print("Documents 路径: \(documentpath!)")  //结果1

//获取文档目录路径--方法二 沙盒根路径字符串拼接路径

let docPath = home + "/Documents/"

let fileManager = FileManager.default

let fileManager2 = FileManager()

//print(docPath)  //结果2

//第三种获取路径的方式

let urls = fileManager.urls(for:FileManager.SearchPathDirectory.documentDirectory,in:FileManager.SearchPathDomainMask.userDomainMask) as [NSURL]

if(urls.count > 0 ){
    //print(urls[0]) //结果3
}

// library 目录路径
let libraryPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as String
//print("library 路径：\(libraryPath)")
// 缓存路径cache
let cachePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as NSString
//print("cache 路径：\(cachePath)")

//临时目录路径 temp
let tempPath = NSTemporaryDirectory() as NSString

/* Library/Preference：保存应用的所有偏好设置 */
// 偏好设置存储

let def = UserDefaults.standard
def.set("aa", forKey: "a")
def.synchronize()

//获取值
let str = def.string(forKey: "a")

/* *******      把数组存入.plist文件 从沙盒中读取文件     ******* */

let documents_home = NSHomeDirectory()  //获取沙盒根路径
let docPath_use = documents_home + "/Documents/"  //获得Documents 路径

// 获取文本文件路径
let filePath = docPath_use + "data.plist"
// 必须转换为NS 类型
let ar = ["sdsd","asdasd" ] as NSArray

ar.write(toFile: filePath, atomically: true)


let ar_read = NSArray.init(contentsOfFile: filePath)! as Array

print(ar_read)

/*  3.  归档存储，获取数据     */
  ```
