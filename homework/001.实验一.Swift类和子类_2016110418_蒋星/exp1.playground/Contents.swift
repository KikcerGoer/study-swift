import UIKit
#if os(Linux)
import Glibc
#else
import Darwin
#endif


var emptyArray:Array = [Int]()
emptyArray.append(1)
emptyArray.append(2)
emptyArray.append(3)

var index = 0;
for count in 4...100 {
    let d_count:Double = Double(count);
    let result:Double = sqrt(d_count);
    
    let boundary = Int(result);
    var ishave:Bool = false
    
    for var i in 2...boundary{
        let d_re = Double(count)/Double(i);
        let i_re = count / i;
        if d_re == Double(i_re) {
            ishave = true
            break
        }
    }
    if !ishave {
        emptyArray.append(count)
        index = index + 1
    }
}


emptyArray.sort();
emptyArray.reverse();
emptyArray.sort(by:{$0 > $1 })

func sortself (one:Int,two:Int) -> Bool{
    return one > two
}
emptyArray.sort(by:sortself)
emptyArray.sort(by:{(one:Int,two:Int) in return one > two })
print(emptyArray)
emptyArray.sort(by: > )

var array = [10,4,2,11,65]
let temp = array.reduce(
    (max:Int.min,min:Int.max,sum:0)
    )
{ (temp,i) in
    print(temp)
    print(i)
    return (max(temp.max,i),min(temp.min,i),temp.sum+i)
}



enum department:Int{
    case sicnu_jisuanjikexuexueyuan = 1
    case sicnu_gongxueyuan = 2
    case sicnu_shangxueyuan = 4
    case sicnu_wenxueyuan = 8
}

protocol SchoolProtocal{
    var department:department{ get set }
    func lendBook(data:String) ->()
}

enum Gender:Int{
    case male = 1
    case female = 4
}

class Person:CustomStringConvertible{
    var firstName:String
    var lastName:String
    var age:Int
    var gender:Gender
    
    init(firstName:String,lastName:String,age:Int,gender:Gender) {
        self.age = age
        self.lastName = lastName
        self.firstName = firstName
        self.gender = gender
    }
    
    var fullName:String{
        get{
            return firstName + " " + lastName
        }
    }
    
    func run(){
        print("Person \(fullName) is running")
    }
    
    convenience init(firstName:String){
        self.init(firstName: firstName,lastName:"king",age:18,gender: Gender.male)
    }
    
    static func == (one:Person,two:Person)-> Bool{
        if(one.age == two.age) && (one.firstName == two.firstName) && (one.lastName == two.lastName)
            && (one.gender == two.gender){
            return true;
        }else{
            return false;
        }
    }
    
    static func != (one:Person,two:Person)-> Bool{
        if(one.age == two.age) && (one.firstName == two.firstName) && (one.lastName == two.lastName)
            && (one.gender == two.gender){
            return false;
        }else{
            return true;
        }
    }
    
    var description:String {
        return " name: \(firstName) \(lastName) age:\(age) sex:\(gender)  "
    }
    
}



class Teacher:Person,SchoolProtocal{
    var title:String
    
    init(firstName: String, lastName: String, age: Int, gender: Gender,title:String) {
        self.title = title
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    
    override var description:String{
        return " name: \(firstName) \(lastName) age:\(age) sex:\(gender)  title:\(title) "
    }
    
    override func run() {
        print("Teacher \(fullName) is running")
    }
    var department:department{ get{ return department } set{ department = newValue} }
    func lendBook(data:String) {
        print("i am teacher i have teacher book")
    }
}




class Student:Person,SchoolProtocal{
    var stuNo:String
    
    init(firstName: String, lastName: String, age: Int, gender: Gender,stuNo:String) {
        self.stuNo = stuNo
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    
    
    override var description:String{
        return " name: \(firstName) \(lastName) age:\(age) sex:\(gender)  stuNo:\(stuNo) "
    }
    override func run() {
        print("Student \(fullName) is running")
    }
    
    
    var department:department{ get{ return department } set{ department = newValue} }
    func lendBook(data:String) {
        print("i am teacher i have teacher book")
    }
}


var p = Person(firstName:"kicker0",lastName:"king",age:21,gender:Gender.male)
var p0 = Person(firstName:"kicker10",lastName:"king",age:21,gender:Gender.male)
var p1 = Teacher(firstName:"kicker1",lastName:"king",age:21,gender:Gender.male,title:"banzhuren0")
var p3 = Teacher(firstName:"kicker2",lastName:"king",age:21,gender:Gender.male,title:"banzhuren1")
var p4 = Teacher(firstName:"kicker3",lastName:"king",age:21,gender:Gender.male,title:"banzhuren2")
var p5 = Teacher(firstName:"kicker4",lastName:"king",age:21,gender:Gender.male,title:"banzhuren3")
var p2 = Student(firstName:"kicker5",lastName:"king",age:21,gender:Gender.male,stuNo:"2016110418")

var plist:[Person] = [Person]()

plist.append(p)
plist.append(p0)
plist.append(p1)
plist.append(p2)
plist.append(p3)
plist.append(p4)
plist.append(p5)

var tcount:Int = plist.filter({ $0 is Teacher}).count
var scount:Int = plist.filter({ $0 is Student}).count
var pcount:Int = plist.count - tcount - scount
print("Teacher Count: \(tcount)")
print("Student Count: \(scount)")
print("Person  Count: \(pcount)")

var dic:[String:Int] = [String:Int]()

dic["Teacher Count"] = 0
dic["Student Count"] = 0
dic["Person  Count"] = 0

plist.map(){
    one in
    if(one is Teacher){
        dic["Teacher Count"] = dic["Teacher Count"]! + 1
    }
    if(one is Student){
        dic["Student Count"] = dic["Student Count"]! + 1
    }
    dic["Person  Count"] = plist.count - dic["Student Count"]! - dic["Student Count"]!
}

print(dic)

plist.forEach({
    $0.run()
    if $0 is Teacher{
        ($0 as! Teacher).lendBook(data: "wo shi laoshi")
    } else if $0 is Student{
        ($0 as! Student).lendBook(data: "wo shi xuesheng")
    }
})
