//实验4 a
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

//实验4 b
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
