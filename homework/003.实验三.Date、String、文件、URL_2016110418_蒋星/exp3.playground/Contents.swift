//: Playground - noun: a place where people can play

import UIKit


////////// 1.
var now = Date()
var formmatter = DateFormatter()
formmatter.locale
formmatter.dateFormat = "yyyy年MM月dd日 EEEE aaa hh:mm"

print("北京时间："+formmatter.string(from: now))


formmatter.timeZone = TimeZone.init(secondsFromGMT: 3600*9)
 print("东京时间：" + formmatter.string(from: now))

formmatter.timeZone = TimeZone.init(secondsFromGMT: 3600*0)
print("伦敦时间：" + formmatter.string(from: now))

formmatter.timeZone = TimeZone.init(secondsFromGMT: 3600 * -5)
print("纽约时间：" + formmatter.string(from: now))

////////////// 2.
//截取字符串 6 ～20
var str = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS."

let index_1 = str.index(str.startIndex, offsetBy: 6)
let index_2 = str.index(str.startIndex, offsetBy: 20)

let sub = str[index_1...index_2]
print(sub)
let re_str = str.replacingOccurrences(of: "OS", with: "")
print(re_str)


////////////// 3.
var dicData:[String:String] = [String:String]()

let time_beijing = formmatter.string(from: now)
formmatter.timeZone = TimeZone.init(secondsFromGMT: 3600 * 9)
let time_lundun = formmatter.string(from: now)
formmatter.timeZone = TimeZone.init(secondsFromGMT: 3600 * 0)
let time_dongjing = formmatter.string(from: now)
formmatter.timeZone = TimeZone.init(secondsFromGMT: 3600 * -5)
let time_newyu = formmatter.string(from: now)

dicData["Beijing time"] = time_beijing //北京时间
dicData["London time"] = time_lundun //伦敦时间
dicData["Tokyo time"] = time_dongjing //东京时间
dicData["NewYork time"] = time_newyu //纽约时间
dicData["str"] = str
print(dicData)

// 1、获得沙盒的根路径
let home = NSHomeDirectory() as NSString
print(home)

// 2、获得Documents路径，使用NSString对象的stringByAppendingPathComponent()方法拼接路径
let docPath = home.appendingPathComponent("Documents") as NSString;

// 3.获得文本文件路径
let filePath = docPath.appendingPathComponent("data.plist")

print(filePath)

let data_store = dicData as NSDictionary

data_store.write(toFile: filePath, atomically: true)

//存储路径
//////// 4.
let url = URL(string:"https://goss.veer.com/creative/vcg/veer/800water/veer-145757956.jpg")

let data = try! Data(contentsOf:url!)


let img = UIImage(data:data)


func saveImage(currentImage: UIImage, persent: CGFloat, imageName: String){
     if let imageData = UIImageJPEGRepresentation(currentImage, persent) as NSData? {
      let fullPath = NSHomeDirectory().appending("/Documents/").appending(imageName)
      imageData.write(toFile: fullPath, atomically: true)
      print("fullPath=\(fullPath)") //打印存储路径
     }
}
saveImage(currentImage: img!, persent: 1, imageName: "999.jpg")

///////// 5.
enum MyError:Error {
    case Zero
    case NotURL
}
guard let weatherUrl = URL(string: "http://www.weather.com.cn/data/cityinfo/101010100.html") else{
   throw MyError.NotURL
}

let jsondata = try! Data(contentsOf: weatherUrl)

let json = try! JSONSerialization.jsonObject(with: jsondata, options: .allowFragments)
guard let dic = json as? [String:Any] else{
    throw MyError.NotURL
}
guard let weather = dic["weatherinfo"] as? [String:String] else{
    throw MyError.NotURL
}
let temp1 = weather["temp1"]
let temp2 = weather["temp2"]

print(weather)







