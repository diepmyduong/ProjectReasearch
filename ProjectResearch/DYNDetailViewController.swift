//
//  DYNViewController.swift
//  ProjectResearch
//
//  Created by Anh Le on 6/30/16.
//  Copyright © 2016 Anh Le. All rights reserved.
//

import UIKit
import SVProgressHUD

class DYNDetailViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var webView: UIWebView!
    //MARK: Properties
    var currentNews:News!
    
    func loadNews(){
        SVProgressHUD.showWithStatus("Đang tải")
        //let url = "https://api.myjson.com/bins/4bokd"
        let url = "http://localhost:8888/ProjectResearch/api/getNews.php?id=\(currentNews.id)"
        let session = NSURLSession.sharedSession()
        let shotURL = NSURL(string: url)
        let todo = session.dataTaskWithURL(shotURL!){
            (data,response,error) in
            if error != nil{
                print(error?.description)
                SVProgressHUD.dismiss();
                return
            }
            do {
                let result = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
                if (result["status"] as! String) == "error" {
                    print(result["message"]!)
                }
                let data = result["data"] as! NSDictionary
                self.currentNews.content = data["content"] as? String
                let htmlString = self.currentNews.content
                self.webView.loadHTMLString(htmlString!, baseURL: NSURL(string: "http:"))
                dispatch_async(dispatch_get_main_queue(), {
                    SVProgressHUD.dismiss();
                })
            }catch {
                SVProgressHUD.dismiss();
                return
            }
        }
        todo.resume()
    }
    
    //MARK: UIViewController
    override func viewDidLoad() {
        navigationItem.title = currentNews.title
    }
    
    override func viewDidAppear(animated: Bool) {
        loadNews()
    }
    
    override func viewDidLayoutSubviews() {
        webView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        if SVProgressHUD.isVisible(){
            SVProgressHUD.dismiss()
        }
    }

}
