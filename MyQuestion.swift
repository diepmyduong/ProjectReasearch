//
//  MyQuestion.swift
//  ProjectResearch
//
//  Created by Anh Le on 6/28/16.
//  Copyright © 2016 Anh Le. All rights reserved.
//

import Foundation
import ResearchKit

enum MyQuestionType:String {
    case Text = "Text"
    case Boolean = "Boolean"
    case TextChoice = "TextChoice"
    case Form = "Form"
}

class MyQuestion {
    var identifier:String?
    var title:String = ""
    var description:String = ""
    var questionType:MyQuestionType!
    var textChoices = [String]()
    var optional:Bool = true
    var multipleLines:Bool = false
    var multiChoice:Bool = false
    var isFormItem = false
    var text:String = ""
    
    init(){
        
    }
    
    init(identifier:String?,title:String,questionType:MyQuestionType,optional:Bool){
        self.identifier = identifier
        self.title = title
        self.questionType = questionType
        self.optional = optional
    }
    
    func getQuestionAnswerFormat() -> ORKAnswerFormat?{
        switch questionType {
        case .Some(MyQuestionType.Text):
            let answerFormat = ORKAnswerFormat.textAnswerFormat()
            answerFormat.multipleLines = multipleLines
            return answerFormat
        case .Some(MyQuestionType.Boolean):
            let answerFormat = ORKAnswerFormat.booleanAnswerFormat()
            return answerFormat
        case .Some(MyQuestionType.TextChoice):
            var textChoices = [ORKTextChoice]()
            for (index,choice) in EnumerateSequence(self.textChoices){
                textChoices.append(ORKTextChoice(text: choice, value: index))
            }
            if multiChoice {
                let answerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.MultipleChoice, textChoices:textChoices)
                return answerFormat
            }else{
                let answerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices:textChoices)
                return answerFormat
            }
        default:
            return nil
        }
    }
    
    func getFormItem() ->ORKFormItem? {
        if(self.isFormItem){
            let item = ORKFormItem(identifier: self.identifier!, text: self.text, answerFormat: self.getQuestionAnswerFormat(), optional: self.optional)
            return item
        }else{
            return nil
        }
    }
    
    static func loadFromJson(data:AnyObject)-> MyQuestion? {
        let idendifier = data["identifier"] as? String
        let title = data["title"] as! String
        let questionType = MyQuestionType.init(rawValue: data["questionType"] as! String)
        let optional = data["optional"] as! Bool
        let question = MyQuestion(identifier: idendifier, title: title, questionType: questionType!, optional: optional)
        question.description = data["description"] as! String
        
        question.textChoices = data["textChoices"] as! [String]
        
        question.multipleLines = data["multipleLines"] as! Bool
        question.multiChoice = data["multiChoice"] as! Bool
        question.isFormItem = data["isFormItem"] as! Bool
        question.text = data["text"] as! String
        
        return question

    }
}
