### [UIview 组件](#top) :maple_leaf: <b id="top"></b>

----
```swift
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var uiview_mine: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //设置颜色
        uiview_mine.backgroundColor = UIColor.red;
        
        //透明度
        uiview_mine.alpha = 0.5
        
        //隐藏
        //uiview_mine.isHidden = true
        
        //设置底色
        self.view.backgroundColor = UIColor.orange
    
        //通过tag控制元件
        
        view.viewWithTag(101)?.backgroundColor = UIColor.black
    
    }

}

```
