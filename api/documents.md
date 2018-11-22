### [Documents 文件夹的操作函数](#top) :maple_leaf:  <b id="top"></b>

----

##### `判断文件夹是否存在 在 ` `Documents 文件夹中`

```swift
// documents 下面是否存在此文件夹
func DocumentsIsHaveDirectory(_ Name:String)->Bool{
    let isExist_path = NSHomeDirectory() + "/Documents/\(Name)";
    return  FileManager.default.fileExists(atPath: isExist_path)
}
```
##### `在Documents 文件夹中创建文件夹`
```swift
//创建文件夹 函数
func CreateDirectoryAtDocuments(_ Name:String){
    let path = NSHomeDirectory() + "/Documents/\(Name)";
    let manager = FileManager.default
    if(!manager.fileExists(atPath: path)){
        try! FileManager.default.createDirectory(atPath:path, withIntermediateDirectories: true,
        attributes: nil);
    }
}
```
`使用例子`
```swift
print(FileManager.default.fileExists(atPath: MydocPath))
CreateDirectoryAtDocuments("www")
print("是否存在文件 www: \(DocumentsIsHaveDirectory("www"))" )

/*
是否存在文件 www: false
是否存在文件 www: true
*/
```

##### `在Documents 创建文件夹或者文件`
```swift
//创建文件夹/文件 函数
func CreateAtDocuments(_ Name:String,_ DirectoryOrFile:Bool){
    let path = NSHomeDirectory() + "/Documents/\(Name)";
    let manager = FileManager.default
    if(!manager.fileExists(atPath: path)){
        if(DirectoryOrFile){
            try! manager.createDirectory(atPath:path, withIntermediateDirectories: true, attributes: nil);
        }else{
            manager.createFile(atPath: path, contents: nil, attributes: nil)
        }
    }
}
```

##### `从网上下载图片保存到本地`
```swift

enum PictureType{
    case JPG
    case PNG
}
/// 第一参数：图片地址
/// 第二个参数：图片类型
/// 第三个参数：存储地址 存在home 目录下面 请注意 
func DownloadPictureFromInternalSaveInPath(_ pictureURL:String, _ pictureType:PictureType,_ store_path:String) -> Bool{
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

//使用例子
let isOk =  DownloadPictureFromInternalSaveInPath(
"http://t2.hddhhn.com/uploads/tu/201707/521/85.jpg", 
 PictureType.JPG, 
"/Documents/www/my.jpg")


if isOk{
     print("文件存在")
} else {
    print("文件不存在")
}


//检测图片文件是否存在 
if let savedImage = UIImage(contentsOfFile: file_store_Path) {
     print("文件存在")
     savedImage
} else {
    print("文件不存在")
}
```
