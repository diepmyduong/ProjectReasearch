//
//  MyConsentTask.swift
//  ProjectResearch
//
//  Created by Anh Le on 7/3/16.
//  Copyright © 2016 Anh Le. All rights reserved.
//

import ResearchKit

class MyConsentTask : ORKNavigableOrderedTask {
    override func stepAfterStep(step: ORKStep?, withResult result: ORKTaskResult) -> ORKStep? {
        switch step?.identifier {
        case .Some("ConsentReviewStep"):
            if  let stepResult = result.resultForIdentifier("ConsentReviewStep") as? ORKStepResult,
                let agreeConsent = stepResult.resultForIdentifier("ConsentDocumentParticipantSignature") as? ORKConsentSignatureResult
            {
                if agreeConsent.consented {
                    let passcodeStep = ORKPasscodeStep(identifier: "Passcode")
                    passcodeStep.text = "Hãy tạo kháo mật khẩu cho bạn để bảo vệ thông tin cá nhân bạn cung cấp."
                    return passcodeStep;
                }else{
                    let completionStep = ORKCompletionStep(identifier: "CompletionStep")
                    completionStep.title = "Xin cám ơn."
                    return completionStep
                }
            }
            return super.stepAfterStep(step, withResult: result)
        case .Some("Passcode"):
            let completionStep = ORKCompletionStep(identifier: "CompletionStep")
            completionStep.title = "Chào mừng."
            completionStep.text = "Cám ơn bạn đã tham gia nghiên cứu."
            return completionStep
        default:
            return super.stepAfterStep(step, withResult: result)
        }
    }
    
    override func stepBeforeStep(step: ORKStep?, withResult result: ORKTaskResult) -> ORKStep? {
        switch step?.identifier {
        default:
            return super.stepBeforeStep(step, withResult: result)
        }
    }
    
    override func stepWithIdentifier(identifier: String) -> ORKStep? {
        switch identifier {
        case "thankYou":
            let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
            summaryStep.title = "Xin Cám Ơn"
            return summaryStep
        default:
            return super.stepWithIdentifier(identifier)
        }
    }
    
    
}
