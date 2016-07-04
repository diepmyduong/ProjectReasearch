//
//  SurveyViewController.swift
//  ProjectResearch
//
//  Created by Anh Le on 6/28/16.
//  Copyright © 2016 Anh Le. All rights reserved.
//

import UIKit
import ResearchKit
import SVProgressHUD
import RETableViewManager

class ProfileViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var fullName: UILabel!
    //MARK: Properties
    var manager:RETableViewManager!
    //MARK: UIViewController
    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
        let signatureData = NSUserDefaults.standardUserDefaults().objectForKey("Signature") as! NSData
        let signature = NSKeyedUnarchiver.unarchiveObjectWithData(signatureData) as! ORKConsentSignature
        fullName.text = "\(signature.givenName!) \(signature.familyName!)"
        // genarate manager
        self.manager = RETableViewManager(tableView: tableView)
        // add a section
        let section = RETableViewSection(headerTitle: "Thông tin cá nhân")
        self.manager.addSection(section)
        
        self.manager.registerClass("ProjectResearch.ImageViewItem", forCellWithReuseIdentifier: "ProjectResearch.ImageViewCell")
        self.tableView.separatorStyle = .None
        // add items
        let itemHeight = RENumberItem(title: "Chiều cao", value: nil, placeholder: "cm")
        itemHeight.charactersLimit = 3
        section.addItem(itemHeight)
        let itemWidth = RENumberItem(title: "Cân nặng", value: nil, placeholder: "kg")
        itemWidth.charactersLimit = 3
        section.addItem(itemWidth)
        section.addItem(NSString(string: "Chữ ký"))
        let imageView = ImageViewItem.itemWithImage(signature.signatureImage!)
        section.addItem(imageView)
        
    }
    
    @IBAction func Test(sender: AnyObject) {
        SVProgressHUD.showWithStatus("Loading Task...")
        let url = "https://api.myjson.com/bins/3r881"
        let session = NSURLSession.sharedSession()
        let shotURL = NSURL(string: url)
        let todo = session.dataTaskWithURL(shotURL!){
            (data,response,error) in
            let myTask = MyTask.loadFromJson(data!)
            let taskController = ORKTaskViewController(task: myTask?.getTask(), taskRunUUID: nil)
            taskController.delegate = self
            dispatch_async(dispatch_get_main_queue(), {
                SVProgressHUD.dismiss()
                self.presentViewController(taskController, animated: true, completion: nil)
            })
        }
        todo.resume()
    }
}

extension ProfileViewController:ORKTaskViewControllerDelegate {
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        taskViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}
