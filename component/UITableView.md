### [UITableView 组件](#top) :maple_leaf: <b id="top"></b>

----
`非常重要的一个组件 在swift 开发中`

##### [尺寸属性](#top)
* `Row Height`:`每一个tableview cell的高度`
##### [重要方法](#top)
* `reloadData()`:`刷新 重新加载数据`
```swift
//
//  animalTableViewControler.swift
//  tableviewcontroler
//
//  Created by 505007 on 2018/11/25.
//  Copyright © 2018年 505007. All rights reserved.
//

import UIKit

class animalTableViewControler: UITableViewController {

    //状态列是否隐藏
    override var prefersStatusBarHidden: Bool{
        return false;
    }
    
    let animalArray = ["dog","cat","tiger","lion","rabbit","snail","monkey","mouse","fox","goat"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    //设置section 数量
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return animalArray.count
    }

    //设置cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath);
        cell.textLabel?.text = animalArray[indexPath.row]
        //cell.separatorInset = UIEdgeInsets.init(top: 1, left: 1, bottom: 1, right: 1)
        cell.imageView?.image = UIImage(named:"cat");
        
        return cell
    }
    // 触发导航切换
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: nil)
    }

    // 传递数据
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showDetail"){
            let dacontroller = segue.destination as? dataShowViewController
            let selected = self.tableView.indexPathForSelectedRow
            
            if let selectedrow = selected?.row{
                dacontroller?.sendData  = animalArray[selectedrow]
            }
            
            
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

```
