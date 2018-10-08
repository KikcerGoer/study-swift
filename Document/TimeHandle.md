<a href="#" id="top">Swift基础语法--[时间处理] </a>
-----
```swift
import Foundation

/*
 EEEE：表示星期几（如 Monday）。使用 1-3 个字母表示周几的缩略写法。
 MMMM：月份的全写（如 October）。使用 1-3 个字母表示月份的缩略写法。
 dd：表示一个月里面日期的数字（如 09 或 15）。
 yyyy：4 个数字表示的年（如 2015）。
 HH：2 个数字表示的小时（如 08 或 19）。
 mm：2 个数字表示的分钟（如 05 或者 54）。
 ss：2 个数字表示的秒。
 zzz：3 个字母表示的时区（如 GMT）。
 GGG：BC 或者 AD。

 */

// 获取当前时间 Date 对象：
// Date对象其本身使用的时区是零时区

let now = Date()
print("\(now)")

// 从时间到日期 需要用 DateFormatter 对象
// 结果：DateFormatter对象的string方法执行转换(参数now为之前代码中所创建)
// 如果不设置格式那么返回 \n 字符
var  dateformatter_mine = "yyyy-MM-dd  HH:mm:ss zzz EEEE GGG "
var formatter = DateFormatter()
formatter.dateFormat = dateformatter_mine
formatter.timeZone = NSTimeZone.local
let reuslt_time_str = formatter.string(from: now)
print(reuslt_time_str)

formatter.dateStyle = DateFormatter.Style.full
print(formatter.string(from: now))
formatter.dateStyle = DateFormatter.Style.long
print(formatter.string(from: now))
formatter.dateStyle = DateFormatter.Style.medium
print(formatter.string(from: now))
formatter.dateStyle = DateFormatter.Style.short
print(formatter.string(from: now))


var local = NSLocale(localeIdentifier:"fr_FR") as Locale! //法国

// 获取日期时间到各个部分
// 时间 Date 到组成成分使用 DateComponents 他们之间的连接是 Calendar 和 TimeZone

let cal_my = Calendar.current

//东七区时间
let dateComponetsl = cal_my.dateComponents(in:TimeZone.init(secondsFromGMT: 3600*7)!,from: Date())
print(dateComponetsl.year!)


```
