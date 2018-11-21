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
        try! FileManager.default.createDirectory(atPath:path, withIntermediateDirectories: true, attributes: nil);
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

##### 创建文件夹或者文件
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
ar path_jpg = NSHomeDirectory() + "/Documents/www/mypic.jpg" ;


let imageUrl = URL(string: "http://pic5.photophoto.cn/20071228/0034034901778224_b.jpg")!
let imageData = try? Data(contentsOf: imageUrl)

var url = URL(fileURLWithPath:path_jpg)

url.appendPathComponent("mypic.jpg")
try? imageData?.write(to: url)
let image = UIImage(data: imageData!)
```
