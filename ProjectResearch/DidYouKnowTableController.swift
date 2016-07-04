//
//  DidYouKnowTableController.swift
//  ProjectResearch
//
//  Created by Anh Le on 6/30/16.
//  Copyright © 2016 Anh Le. All rights reserved.
//

import UIKit
import SWTableViewCell
import SVProgressHUD

class DidYouKnowTableController: UITableViewController {
    
    var listNews = [News]();
    //MARK: Actions
    @IBAction func reloadOnClick(sender: AnyObject) {
        reloadNews();
    }

    func reloadNews(){
        SVProgressHUD.showWithStatus("Đang tải")
        //let url = "http://project-research.freevnn.com/data.json"
        //let url = "https://objectivec2swift.com/#/home/converter/"
        //let url = "https://api.myjson.com/bins/t0gh"
        let url = "http://localhost:8888/ProjectResearch/api/listNews.php?page=1&pagesize=10"
        let session = NSURLSession.sharedSession()
        let shotURL = NSURL(string: url)
        let todo = session.dataTaskWithURL(shotURL!){
            (data,response,error) in
            if error != nil{
                print("error")
                print(error?.description)
                return
            }
            do {
                if data != nil {
                    let string = String(data: data!, encoding: NSUTF8StringEncoding)
                    print(string)
                }
                let result = try NSJSONSerialization.JSONObjectWithData(data!, options: [.MutableContainers])
                self.listNews.removeAll()
                if (result["status"] as! String) == "error" {
                    print(result["message"]!)
                }
                for item in result["data"] as! [AnyObject] {
                    let id = item["id"] as! String
                    let title = item["title"] as! String
                    let description = item["description"] as! String
                    let createBy = item["create_by"] as! String
                    let createAt = NSDate.getDateFormString("yyyy-MM-dd HH:mm:ss", string: item["create_at"] as! String)
                    
                    let news = News(id:  id, title: title, description: description, createAt: createAt, createBy: createBy)
                    self.listNews.append(news)
                }
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableView.reloadData()
                    SVProgressHUD.dismiss();
                })
            }catch let ex as NSError {
                print(ex.description)
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableView.reloadData()
                    SVProgressHUD.dismiss();
                })
                return
            }
        }
        todo.resume()
    }
    //MARK: UITableViewController
    override func viewDidLoad() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        reloadNews()
    }
    override func viewWillDisappear(animated: Bool) {
        if SVProgressHUD.isVisible(){
            SVProgressHUD.dismiss()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showNewsDetail"){
            let detailVC = segue.destinationViewController as! DYNDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow
            detailVC.currentNews = listNews[(indexPath?.row)!]
        }
    }
    
    //MARK: UITableViewControllerDatasource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listNews.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DidYouKnowCell", forIndexPath: indexPath) as! DidYouKnowViewCell
        let news = listNews[indexPath.row]
        cell.titleLabel.text = news.title
        cell.descriptionLabel.text = news.description
        cell.createAtLabel.text = news.createAt.getDateShortString()
        cell.leftUtilityButtons = leftButtons() as [AnyObject];
        cell.rightUtilityButtons = rightButtons() as [AnyObject];
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 65
    }
    
    //MARK: UITableViewControllerDelegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showNewsDetail", sender: self)
    }
    
    //MARK: SWTableViewCell
    func rightButtons() -> NSMutableArray{
        let rightUtilityButtons = NSMutableArray()
        rightUtilityButtons.sw_addUtilityButtonWithColor(UIColor(red: 0.78, green: 0.78, blue: 0.8, alpha: 1.0), title: "More")
        rightUtilityButtons.sw_addUtilityButtonWithColor(UIColor(red: 1.0, green: 0.231, blue: 0.188, alpha: 1.0), title: "Delete")
        return rightUtilityButtons
    }
    
    func leftButtons() -> NSMutableArray {
        let leftUtilityButtons = NSMutableArray()
        leftUtilityButtons.sw_addUtilityButtonWithColor(UIColor(red: 0.07, green: 0.75, blue: 0.16, alpha: 1.0), icon: UIImage(named: "check.png"))
        leftUtilityButtons.sw_addUtilityButtonWithColor(UIColor(red: 1.0, green: 1.0, blue: 0.35, alpha: 1.0), icon: UIImage(named: "clock.png"))
        leftUtilityButtons.sw_addUtilityButtonWithColor(UIColor(red: 1.0, green: 0.231, blue: 0.188, alpha: 1.0), icon: UIImage(named: "cross.png"))
        leftUtilityButtons.sw_addUtilityButtonWithColor(UIColor(red: 0.55, green: 0.27, blue: 0.07, alpha: 1.0), icon: UIImage(named: "list.png"))
        return leftUtilityButtons
    }
}

extension NSDate {
    func getDateShortString()->String{
        let dateFormat = NSDateFormatter()
        dateFormat.dateFormat = "dd/MM/yyyy"
        return dateFormat.stringFromDate(self)
    }
    
    static func getDateFormString(format:String,string:String)->NSDate{
        let dateFormat = NSDateFormatter()
        dateFormat.dateFormat = format
        return dateFormat.dateFromString(string)!
    }
}