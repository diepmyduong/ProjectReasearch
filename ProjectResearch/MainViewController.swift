//
//  MainViewController.swift
//  ProjectResearch
//
//  Created by Anh Le on 6/27/16.
//  Copyright © 2016 Anh Le. All rights reserved.
//

import UIKit
import ResearchKit

class MainViewController: UIViewController {
    // MARK: Propertues
    
    var contentHidden = false {
        didSet {
            guard contentHidden != oldValue && isViewLoaded() else { return }
            childViewControllers.first?.view.hidden = contentHidden
        }
    }
    //MARK: UIViewController
    override func viewDidLoad() {
        //TODO: Kiểm tra đăng ký passcode chưa
        super.viewDidLoad()
            
        if ORKPasscodeViewController.isPasscodeStoredInKeychain() {
            toStudy()
        }
        else {
            toOnboarding()
        }
    }
    
    @IBAction func unwindToStudy(segue: UIStoryboardSegue) {
        toStudy()
    }
    
    @IBAction func unwindToWithdrawl(segue: UIStoryboardSegue) {
        toWithdrawl()
    }
    
    
    // MARK: Transitions
    
    func toOnboarding() {
        performSegueWithIdentifier("toOnboarding", sender: self)
    }
    
    func toStudy() {
        performSegueWithIdentifier("toStudy", sender: self)
    }
    
    func toWithdrawl() {
        let viewController = WithdrawViewController()
        viewController.delegate = self
        
        presentViewController(viewController, animated: true, completion: nil)
    }

}

extension MainViewController: ORKTaskViewControllerDelegate {
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        // Check if the user has finished the `WithdrawViewController`.
        if taskViewController is WithdrawViewController {
            /*
             If the user has completed the withdrawl steps, remove them from
             the study and transition to the onboarding view.
             */
            if reason == .Completed {
                ORKPasscodeViewController.removePasscodeFromKeychain()
                toOnboarding()
            }
            
            // Dismiss the `WithdrawViewController`.
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
}
