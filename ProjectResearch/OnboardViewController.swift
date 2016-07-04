//
//  OnboardViewController.swift
//  ProjectResearch
//
//  Created by Anh Le on 6/28/16.
//  Copyright © 2016 Anh Le. All rights reserved.
//

import UIKit
import ResearchKit

class OnboardViewController: UIViewController {
    @IBAction func joinButtonTapped(sender: UIButton) {
        let consentDocument = ConsentDocument()
        let consentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: consentDocument)
        let signature = consentDocument.signatures!.first!
        
        let reviewConsentStep = ORKConsentReviewStep(identifier: "ConsentReviewStep", signature: signature, inDocument: consentDocument)
        
        reviewConsentStep.text = "Bảng đồng thuận"
        reviewConsentStep.reasonForConsent = "Đồng ý tham gia nghiên cứu"
        reviewConsentStep.title = "Thông tin xác nhận"
        
        let orderedTask = MyConsentTask(identifier: "Join", steps: [consentStep, reviewConsentStep])
        let taskViewController = ORKTaskViewController(task: orderedTask, taskRunUUID: nil)
        taskViewController.delegate = self
        
        presentViewController(taskViewController, animated: true, completion: nil)
    }
}

extension OnboardViewController:ORKTaskViewControllerDelegate {
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        
        switch reason {
        case .Completed:
            switch taskViewController.task?.identifier {
            case "Join"?:
                if let result = taskViewController.result.resultForIdentifier("ConsentReviewStep") as? ORKStepResult,
                    let agreeConsent = result.resultForIdentifier("ConsentDocumentParticipantSignature") as? ORKConsentSignatureResult
                {
                    if agreeConsent.consented {
                        let signature = NSKeyedArchiver.archivedDataWithRootObject(agreeConsent.signature!)
                        NSUserDefaults.standardUserDefaults().setObject(signature, forKey: "Signature")
                        performSegueWithIdentifier("unwindToStudy", sender: nil)
                    }else{
                        dismissViewControllerAnimated(true, completion: nil)
                    }
                }
                break
            default:
                dismissViewControllerAnimated(true, completion: nil)
            }
        case .Discarded, .Failed, .Saved:
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
}
