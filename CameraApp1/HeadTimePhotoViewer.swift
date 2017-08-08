//
//  HeadTimePhotoViewer.swift
//  CameraApp1
//
//  Created by Rajita Pujare on 8/1/17.
//  Copyright © 2017 Rajita Pujare. All rights reserved.
//

import UIKit
import Foundation


class HeadTimePhotoViewer: UITableViewController {

    var name2 = String()
    let fm = FileManager.default
    var items3 = [String]()

    
    @IBOutlet var timestampList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let docsurl = try! fm.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let myurl = docsurl.appendingPathComponent("headAndNeck/\(name2)")
        var urlString: String = myurl.path
        
        let items = try! fm.contentsOfDirectory(atPath: urlString)
        print(items)

        timestampList.dataSource = self
        self.timestampList.register(UITableViewCell.self, forCellReuseIdentifier: "cell2")


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in timestampList: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        /*
        let docsurl = try! fm.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let myurl = docsurl.appendingPathComponent("headAndNeck/\(name2)")
        var urlString: String = myurl.path
        
        let items2 = try! fm.contentsOfDirectory(atPath: urlString)
        
        items3 = items2
*/
        return 1
    }

    override func tableView(_ timestampList: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        let docsurl = try! fm.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let myurl = docsurl.appendingPathComponent("headAndNeck/\(name2)")
        var urlString: String = myurl.path
        
        let items = try! fm.contentsOfDirectory(atPath: urlString)
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
        dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
        dateFormatter.timeZone = TimeZone.current
        
        var finaldate1 = [String]()
        for item in items {
            let double = Double(item)
            let date2 = (Date(timeIntervalSince1970: double!))
            let data3 = "\(date2)"
            
            finaldate1.append(data3)
        }

        return items.count

    }

    
    override func tableView(_ timestampList: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let docsurl = try! fm.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let myurl = docsurl.appendingPathComponent("headAndNeck/\(name2)")
        var urlString: String = myurl.path
        
        let items1 = try! fm.contentsOfDirectory(atPath: urlString)

        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)

        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
        dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
        dateFormatter.timeZone = TimeZone.current
        
        var finaldate = [String]()
        for item in items1 {
            let double = Double(item)
            let date2 = (Date(timeIntervalSince1970: double!))
            let data3 = "\(date2)"

            finaldate.append(data3)
        }

        cell.textLabel?.text = finaldate[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            self.performSegue(withIdentifier: "showpics5", sender: self)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let docsurl = try! fm.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let myurl = docsurl.appendingPathComponent("headAndNeck/\(name2)/")
        var urlString: String = myurl.path
        
        if (segue.identifier == "showpics5") {
            if let indexPath = self.timestampList.indexPathForSelectedRow {
                
                // get the cell associated with the indexPath selected.
                let cell = self.timestampList.cellForRow(at: indexPath) as UITableViewCell!
                let items = try! fm.contentsOfDirectory(atPath: urlString)
                print(items)

                // get the label text to pass to destinationController
                let text2 = "\(cell?.textLabel?.text)"
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.A"
                let myDate = dateFormatter.date(from: text2)!
                let mydate2 = "\(myDate)"
                let path = "/headAndNeck/\(name2)/\(mydate2)"

                let destinationController = segue.destination as! PhotoGalleryViewer1

                destinationController.pathname = path
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
