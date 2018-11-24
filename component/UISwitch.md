### [UISwitch 组件](#top) :maple_leaf: <b id="top"></b>

----
```swift
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    @IBAction func makechange(_ sender: UISwitch) {
        if(sender.isOn == true){
            lbl.text = "label : 开关是开的"
            view.backgroundColor = UIColor.white
        }else{
            lbl.text = "label : 开关时关的"
            view.backgroundColor = UIColor.black
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }

}
```
