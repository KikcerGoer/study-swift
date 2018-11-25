### [UISegmentedControl](#top) :maple_leaf:

----

* `Segments 属性 默认为5`:`有多少个按钮`
* `selectedSegmentIndex`:`选择了第几个按钮`
```swift
    @IBAction func valuechangesegment(_ sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0 ){
            info.text = "信息:选中第一个"
        }else{
            info.text = "信息:选中第二个"
        }
    }
    @IBAction func fiveiswho(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex);
        let index = sender.selectedSegmentIndex;
        switch index {
        case 0:
            view.backgroundColor = UIColor.blue
        case 1:
            view.backgroundColor = UIColor.red
        case 2:
            view.backgroundColor = UIColor.brown
        case 3:
            view.backgroundColor = UIColor.green
        case 4:
            view.backgroundColor = UIColor.cyan
        default:
            view.backgroundColor = UIColor.white
        }
    }
    
```
