//
//  MyStep.swift
//  ProjectResearch
//
//  Created by Anh Le on 6/28/16.
//  Copyright © 2016 Anh Le. All rights reserved.
//

import Foundation
import ResearchKit

class MyStep {
    //MARK: Properties
    var identifier:String?
    var taskIdentifier:String?
    var title:String = "'"
    var optional:Bool = true
    var navigableRules = [MyNavigableRule]()
    var defaultNextStepIdentifer:String?
    var questions = [MyQuestion]()
    var text:String = ""
    
    init(identifier:String?,title:String,optional:Bool){
        self.identifier = identifier
        self.title = title
        self.optional = optional
    }
    
    func getStep() -> ORKStep? {
        if(questions.count > 1){
            let step = ORKFormStep(identifier: self.identifier!, title: self.title, text: self.text)
            var formItems = [ORKFormItem]()
            for question in self.questions {
                let item = question.getFormItem()
                formItems.append(item!)
            }
            step.formItems = formItems
            step.optional = self.optional
            return step
        }else if questions.count == 1{
            let step = ORKQuestionStep (identifier: self.identifier!, title: self.title, answer: questions.first?.getQuestionAnswerFormat())
            step.optional = self.optional
            return step
        }else{
            return nil
        }
    }
    
    static func loadFromJson(data:AnyObject?) -> MyStep?{
        if(data != nil){
            let stepId = data!["identifier"] as? String
            let stepTitle = data!["title"] as! String
            let stepOptinal = data!["optional"] as! Bool
            let step = MyStep(identifier: stepId, title: stepTitle, optional: stepOptinal)
            step.defaultNextStepIdentifer = data!["defaultNextStepIdentifer"] as? String
            step.text = data!["text"] as! String
            let navigableRules = data!["navigableRules"] as? [AnyObject]
            if navigableRules?.count > 0 {
                for navigableRule in navigableRules! {
                    if let predicate = MyNavigableRule.loadFromJson(navigableRule){
                        step.navigableRules += [predicate]
                    }
                }
            }
            let questions = data!["questions"] as? [AnyObject]
            if questions?.count > 0 {
                for question in questions! {
                    if let answerFormat = MyQuestion.loadFromJson(question) {
                        step.questions += [answerFormat]
                    }
                }
            }
            return step
        }else{
            return nil
        }
    }
    
}