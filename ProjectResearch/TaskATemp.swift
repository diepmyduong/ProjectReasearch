//
//  TaskA.swift
//  ProjectResearch
//
//  Created by Anh Le on 6/27/16.
//  Copyright © 2016 Anh Le. All rights reserved.
//

import ResearchKit

class TaskATemp:ORKNavigableOrderedTask {
    
    
    //MARK: ORKNavigableOrderedTask
    override func stepAfterStep(step: ORKStep?, withResult result: ORKTaskResult) -> ORKStep? {
        switch step?.identifier {
        case .Some("step_3"):
            if let stepResult = result.stepResultForStepIdentifier((step?.identifier)!) {
                if let choiceResult = stepResult.results?.first as? ORKChoiceQuestionResult {
                    if choiceResult.choiceAnswers?.first as! NSNumber == 0 {
                        return stepWithIdentifier("thankYou")
                    }
                }
            }
            return super.stepAfterStep(step, withResult: result)
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
