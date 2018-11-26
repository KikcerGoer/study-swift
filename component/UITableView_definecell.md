### [TableViewCell](#top) :maple_leaf:  <b id="top"></b>

----
* [TableViewcell](#cell)
* [TableViewcontroller](#controller)


##### [1.top](#top) :maple_leaf: <b id="cell"></b>

```swift
import UIKit

class PersonTableViewCell: UITableViewCell {

    @IBOutlet weak var userimage: UIImageView!
    
    @IBOutlet weak var lblidentifiy: UILabel!
    
    @IBOutlet weak var switchsex: UISwitch!
    
    @IBOutlet weak var lbldesc: UILabel!
    
    @IBOutlet weak var lblage: UILabel!
    
    @IBOutlet weak var lblname: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

```

##### [1.top](#top) :maple_leaf: <b id="controller"></b> 
```swift
//
//  PersonsTableViewController.swift
//  tableviewdefinebyyourself
//
//  Created by 505007 on 2018/11/25.
//  Copyright © 2018年 505007. All rights reserved.
//

import UIKit

class PersonsTableViewController: UITableViewController {

    @IBAction func change(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        title = "sdsdasd"
    }
    var plist:[Person] = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
      
        let p =  Student(firstName:"kicker0",lastName:"king",age:21,gender:Gender.male,stuNo:"banzhureaan0")
        let p0 = Student(firstName:"kicker10",lastName:"king",age:21,gender:Gender.female,stuNo:"banzhurensd0")
        let p1 = Teacher(firstName:"kicker1",lastName:"king",age:21,gender:Gender.male,title:"banzhuren0")
        let p3 = Teacher(firstName:"kicker2",lastName:"king",age:21,gender:Gender.male,title:"banzhuren1")
        let p4 = Teacher(firstName:"kicker3",lastName:"king",age:21,gender:Gender.female,title:"banzhuren2")
        let p5 = Teacher(firstName:"kicker4",lastName:"king",age:21,gender:Gender.male,title:"banzhuren3")
        let p2 = Student(firstName:"kicker5",lastName:"king",age:21,gender:Gender.female,stuNo:"2016110418")
        
        plist.append(p)
        plist.append(p0)
        plist.append(p1)
        plist.append(p2)
        plist.append(p3)
        plist.append(p4)
        plist.append(p5)
        print(plist.count)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    //节数量
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    //行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(plist.count)
        return plist.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "person", for: indexPath) as? PersonTableViewCell
        let person = plist[indexPath.row]
        if person is Student{
            cell?.lblname.text = person.fullName;
            
            switch person.gender{
               case .female:
                   cell?.switchsex.isOn = false
               default:
                   cell?.switchsex.isOn = true
                
            }
            cell?.lblidentifiy.text = "祖国的花朵"
            cell?.lblage.text = "年龄:\(person.age)";
            cell?.lbldesc.text = (person as! Student).description
            cell?.userimage.image = UIImage(named:"dog")
        }else {
            cell?.lblname.text = person.fullName;
            
            switch person.gender{
            case .female:
                cell?.switchsex.isOn = false
            default:
                cell?.switchsex.isOn = true
                
            }
            cell?.lblidentifiy.text = "尊敬的人民教师"
            cell?.lblage.text = "年龄:\(person.age)";
            cell?.lbldesc.text = (person as! Teacher).description
            cell?.userimage.image = UIImage(named:"cat")
        }
        
        
        return cell!;
        /*
        
        var cell = UITableViewCell()
        cell.textLabel?.text = indexPath.row.description
        return cell;
        */
    }
    
    // 触发导航切换
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showIdentif", sender: nil)
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
