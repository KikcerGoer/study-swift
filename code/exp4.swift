import UIKit
import PlaygroundSupport


// 实验4 (1)文件缓存处理
/*
 a)判断沙盒的Document目录下是否存在某文件夹，如果没有则新建一个该文件夹；
 */
 
// documents 下面是否存在此文件夹
func DocumentsIsHaveDirectory(_ Name:String)->Bool{
    let isExist_path = NSHomeDirectory() + "/Documents/\(Name)";
    return  FileManager.default.fileExists(atPath: isExist_path)
}

print("是否存在文件 www: \(DocumentsIsHaveDirectory("www"))")

// documents创建文件夹 函数
func CreateDirectoryAtDocuments(_ Name:String){
    let path = NSHomeDirectory() + "/Documents/\(Name)";
    let manager = FileManager.default
    if(!manager.fileExists(atPath: path)){
        try! FileManager.default.createDirectory(atPath:path, withIntermediateDirectories: true, attributes: nil);
    }
}
CreateDirectoryAtDocuments("www")

print("是否存在文件 www: \(DocumentsIsHaveDirectory("www"))" )

/*
 b)判断是否该文件夹下存在一个图片文件，如果存在该文件，读取该文件到一个图片对象中并进行显示，如
 果不存在则从网上下载一张图片并保存到该图片文件中；
 */
 
enum PictureType{
    case JPG
    case PNG
}


func DownloadPictureFromInternalSaveInPath(_ pictureURL:String, _ pictureType:PictureType,_ store_path:String)
-> Bool
{
    let imageUrl = URL(string: pictureURL)
    let imageData = try! Data(contentsOf: imageUrl!)
    let imageUI = UIImage(data: imageData)
    
    let picture_store_Path = NSHomeDirectory() + store_path;
    
    var data:Data;
    
    switch pictureType {
        case .JPG:
            data = UIImageJPEGRepresentation(imageUI!,1)!
        case .PNG:
            data = UIImagePNGRepresentation(imageUI!)!
    }
    
    try? data.write(to: URL(fileURLWithPath:picture_store_Path))
    return UIImage(contentsOfFile: picture_store_Path) != nil; //检测是否存储成功
}


let isOk = DownloadPictureFromInternalSaveInPath(
  "http://t2.hddhhn.com/uploads/tu/201707/521/85.jpg", 
  PictureType.JPG, 
  "/Documents/www/my.jpg"
)

if isOk{
     print("存储成功")
} else {
    print("存储失败")
}

// 实验4 (2)自定制视图
/*
a)从UIView中派生一个自定制的View；
b)绘制一个椭圆（或则自己喜欢的任何图形）；
c)新建视图对象并进行显示；
*/
class MyView:UIView{
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn:rect)
        UIColor.red.setStroke()
        path.stroke()
        
        UIColor.gray.setFill()
        path.fill();
    }
}


class TriangleView:UIView{
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath();
        
        path.move(to: CGPoint(x:rect.size.width/2,y:0));
        path.addLine(to: CGPoint(x:rect.size.width,y:rect.size.height))
        path.addLine(to: CGPoint(x:0,y:rect.size.height))
        
        UIColor.green.setFill()
        path.fill()
    }
}



let vw = MyView();

vw.draw(CGRect(x:0,y:0,width:200,height:100))

class Controller:UIViewController{
    var lable:UILabel!
    var circleView:MyView!
    var tangleView:TriangleView!
    override func loadView() {
        view = UIView(frame:CGRect(x:0,y:0,width:400,height:800));
        view.backgroundColor = UIColor.white;
        
        
        lable = UILabel(frame:CGRect(x:50,y:100,width:300,height:50))
        lable.backgroundColor = UIColor.blue
        lable.textColor = UIColor.white
        lable.textAlignment  = .center
        lable.text = "hello the laji yu yan swift"
        
        view.addSubview(lable)
        
        circleView = MyView(frame:CGRect(x:100,y:400,width:200,height:200))
        circleView.backgroundColor = UIColor.green
        
        view.addSubview(circleView)
        
        
        tangleView = TriangleView(frame:CGRect(x:100,y:180,width:200,height:200))
        tangleView.backgroundColor = UIColor.red
        
        view.addSubview(tangleView)
        
    }
    
}

let ct = Controller()

PlaygroundPage.current.liveView = ct


// 实验4 (3)代码版hello world（在视图控制器中加入代码）
/*
  a)代码中生成label（outlet）和button；
  b)将label和button加入根view中；
  c)button添加像self（target）发射action（selector）的操作；
  d)实现clicked响应代码（selector）；
*/
class MyController:UIViewController{
    var lable:UILabel!
    
    @IBAction func clicked(){
        print("i am clicked");
        lable.text = "Hello World";
    }
    
    
    override func loadView() {
        view = UIView(frame:CGRect(x:0,y:0,width:400,height:700));
        view.backgroundColor = UIColor.red;
        
        lable = UILabel(frame:CGRect(x:50,y:100,width:300,height:50));
        lable.backgroundColor = UIColor.blue;
        lable.textColor = UIColor.white;
        lable.textAlignment  = .center;
        lable.text = "点击发现我要说的话";
        
        view.addSubview(lable);
        
        let button = UIButton(frame:CGRect(x:140,y:500,width:120,height:40))
        button.setTitle("来呀快活呀", for: .normal);
        button.addTarget(self, action: #selector(MyController.clicked), for: UIControlEvents.touchUpInside);
        button.backgroundColor = UIColor.white;
        button.titleLabel?.textColor = UIColor.black;
        view.addSubview(button)
    }
    
}

let ct_3 = MyController()

PlaygroundPage.current.liveView = ct_3
