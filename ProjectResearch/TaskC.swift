//
//  TaskC.swift
//  ResearchKitDeMo
//
//  Created by Anh Le on 6/27/16.
//  Copyright © 2016 Vien Le. All rights reserved.
//

import Foundation
import ResearchKit
public var TaskC:ORKNavigableOrderedTask
{
    var steps = [ORKStep]()
    
    //intro
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "Yếu tố nguy cơ"
    
    steps += [instructionStep]
    
    //C1
    let C1QuestionStepTitle = "Anh/Chị có bị nhiễm siêu vi viêm gan B,C hoặc cả hai ?"
    let C1textChoices = [
        ORKTextChoice(text: "Không", value: 0),
        ORKTextChoice(text: "Có", value: 1),
        ORKTextChoice(text: "Không nhớ", value: 2),
        
    ]
    let C1AnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: C1textChoices)
    let C1QuestionStep = ORKQuestionStep(identifier: "C1QuestionStep", title: C1QuestionStepTitle, answer: C1AnswerFormat)
    steps += [C1QuestionStep]
    
    //C2
    let C2QuestionStepTitle = "Anh/Chị có nhớ mình bị nhiễm siêu vi viêm gan B,c hoặc cả hai cách đây bao lâu?"
    let C2textChoices = [
        ORKTextChoice(text: "Nhớ", value: 0),
        ORKTextChoice(text: "Không nhớ", value: 1)
        
    ]
    let C2AnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: C2textChoices)
    let C2QuestionStep = ORKQuestionStep(identifier: "C2QuestionStep", title: C2QuestionStepTitle, answer: C2AnswerFormat)
    steps += [C2QuestionStep]
    
    //C2.1
    let C21AnswerFormat = ORKTextAnswerFormat()
    C21AnswerFormat.multipleLines = false
   
    let C21QuestionStepTitle = "Anh/Chị cho biết mình bị nhiễm cách đây bao lâu ?"
    let C21QuestionStep = ORKQuestionStep(identifier: "C2.1QuestionStep", title: C21QuestionStepTitle, answer: C21AnswerFormat)
    steps += [C21QuestionStep]
    
    
    //C3
    let C3QuestionStepTitle = "Anh/Chị biết mình bị nhiễm siêu vi viêm gan B,c hoặc cả hai bằng cách nào ?"
    let C3textChoices = [
        ORKTextChoice(text: "Khám sức khoẻ định kỳ", value: 0),
        ORKTextChoice(text: "Phát hiện khi khám vì một bệnh khác", value: 1),
        ORKTextChoice(text: "Sau khi hiến máu", value: 3),
        ORKTextChoice(text: "Khi khám bệnh vì vàng mắt vàng da", value: 4),
        ORKTextChoice(text: "Khi được tầm soát trong chương trình này", value: 5),
        ORKTextChoice(text: "Không nhớ", value: 6)
        
    ]
    let C3AnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: C3textChoices)
    let C3QuestionStep = ORKQuestionStep(identifier: "C3QuestionStep", title: C3QuestionStepTitle, answer: C3AnswerFormat)
    steps += [C3QuestionStep]
   
    
    //C4
    let C4QuestionStepTitle = "Anh/Chị có đang bị bệnh gì ?"
    let C4textChoices = [
        ORKTextChoice(text: "Không, bình thường", value: 0),
        ORKTextChoice(text: "Có", value: 1),
        ORKTextChoice(text: "Không biết", value: 2)
        ]
    let C4AnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: C4textChoices)
    let C4QuestionStep = ORKQuestionStep(identifier: "C4QuestionStep", title: C4QuestionStepTitle, answer: C4AnswerFormat)
    steps += [C4QuestionStep]
    
    //C4.1
    let C41AnswerFormat = ORKTextAnswerFormat(maximumLength: 20)
    C41AnswerFormat.multipleLines = false
    
    let C41QuestionStepTitle = "Xin cho biết cụ thể bệnh ?"
    let C41QuestionStep = ORKQuestionStep(identifier: "C4.1QuestionStep", title: C41QuestionStepTitle, answer: C41AnswerFormat)
    steps += [C41QuestionStep]
    
    //C5
    let C5QuestionStepTitle = "Anh/Chị đã từng phải truyền máu ?"
    let C5textChoices = [
        ORKTextChoice(text: "Không", value: 0),
        ORKTextChoice(text: "Có", value: 1),
        ORKTextChoice(text: "Không biết", value: 2)
    ]
    let C5AnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: C5textChoices)
    let C5QuestionStep = ORKQuestionStep(identifier: "C5QuestionStep", title: C5QuestionStepTitle, answer: C5AnswerFormat)
    steps += [C5QuestionStep]
    //C5.1
    let C51AnswerFormat = ORKTextAnswerFormat(maximumLength: 20)
    C51AnswerFormat.multipleLines = false
    
    let C51QuestionStepTitle = "Xin cho biết số lần truyền máu ?"
    let C51QuestionStep = ORKQuestionStep(identifier: "C5.1QuestionStep", title: C51QuestionStepTitle, answer: C51AnswerFormat)
    steps += [C51QuestionStep]
    
    //C6
    let C6QuestionStepTitle = "Anh/Chị đã từng xăm mình ?"
    let C6textChoices = [
        ORKTextChoice(text: "Không", value: 0),
        ORKTextChoice(text: "Có", value: 1),
        ORKTextChoice(text: "Không biết", value: 2)
    ]
    let C6AnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: C6textChoices)
    let C6QuestionStep = ORKQuestionStep(identifier: "C6QuestionStep", title: C6QuestionStepTitle, answer: C6AnswerFormat)
    steps += [C6QuestionStep]
    //C6.1
    let C61AnswerFormat = ORKTextAnswerFormat(maximumLength: 20)
    C61AnswerFormat.multipleLines = false
    
    let C61QuestionStepTitle = "Xin cho biết số lần xăm mình ?"
    let C61QuestionStep = ORKQuestionStep(identifier: "C6.1QuestionStep", title: C61QuestionStepTitle, answer: C61AnswerFormat)
    steps += [C61QuestionStep]

    //C7
    
    let C7QuestionStepTitle = "Anh/Chị có sử dụng thuốc gây nghiện không ?"
    let C7textChoices = [
        ORKTextChoice(text: "Không", value: 0),
        ORKTextChoice(text: "Có", value: 1),
        ORKTextChoice(text: "Không biết", value: 2)
    ]
    let C7AnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: C7textChoices)
    let C7QuestionStep = ORKQuestionStep(identifier: "C7QuestionStep", title: C7QuestionStepTitle, answer: C7AnswerFormat)
    steps += [C7QuestionStep]
    
    //C8
    let C8QuestionStepTitle = "Anh/Chị có sử dụng kim tiêm chung với người khác ?"
    let C8textChoices = [
        ORKTextChoice(text: "Không", value: 0),
        ORKTextChoice(text: "Có", value: 1),
        ORKTextChoice(text: "Không biết", value: 2)
    ]
    let C8AnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: C8textChoices)
    let C8QuestionStep = ORKQuestionStep(identifier: "C8QuestionStep", title: C8QuestionStepTitle, answer: C8AnswerFormat)
    steps += [C8QuestionStep]
    
    //C9
    let C9QuestionStepTitle = "Anh/Chị có đang dùng thuốc ức chế miễn dịch hoặc hoá trị thuốc có steroid ?"
    let C9textChoices = [
        ORKTextChoice(text: "Không dùng", value: 0),
        ORKTextChoice(text: "Có", value: 1),
        ORKTextChoice(text: "Không biết có phải không", value: 2),
        ORKTextChoice(text: "Không biết", value: 3)
    ]
    let C9AnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: C9textChoices)
    let C9QuestionStep = ORKQuestionStep(identifier: "C9QuestionStep", title: C9QuestionStepTitle, answer: C9AnswerFormat)
    steps += [C9QuestionStep]
    //C9.1
    let C91AnswerFormat = ORKTextAnswerFormat()
    C91AnswerFormat.multipleLines = false
    
    let C91QuestionStepTitle = "Xin cho biết cụ thể ?"
    let C91QuestionStep = ORKQuestionStep(identifier: "C9.1QuestionStep", title: C91QuestionStepTitle, answer: C91AnswerFormat)
    steps += [C91QuestionStep]
    //C9.2
    let C92AnswerFormat = ORKTextAnswerFormat()
    C92AnswerFormat.multipleLines = false
    
    let C92QuestionStepTitle = "Xin cho biết tên thuốc ?"
    let C92QuestionStep = ORKQuestionStep(identifier: "C9.2QuestionStep", title: C92QuestionStepTitle, answer: C92AnswerFormat)
    steps += [C92QuestionStep]
    
    //C10
    let C10QuestionStepTitle = "Anh/Chị có từng quan hệ với mại dâm ?"
    let C10textChoices = [
        ORKTextChoice(text: "Không", value: 0),
        ORKTextChoice(text: "Ít khi", value: 1),
        ORKTextChoice(text: "Thường", value: 2),
        ORKTextChoice(text: "Không biết", value: 3)
    ]
    let C10AnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: C10textChoices)
    let C10QuestionStep = ORKQuestionStep(identifier: "C10QuestionStep", title: C10QuestionStepTitle, answer: C10AnswerFormat)
    steps += [C10QuestionStep]
    
    //C11
    let C11QuestionStepTitle = "Anh/Chị có thuộc nhóm LGBT(đồng tính, song tính, chuyển giới) ?"
    let C11textChoices = [
        ORKTextChoice(text: "Không", value: 0),
        ORKTextChoice(text: "Có", value: 1),
        ORKTextChoice(text: "Không biết", value: 2)
    ]
    let C11AnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: C11textChoices)
    let C11QuestionStep = ORKQuestionStep(identifier: "C11QuestionStep", title: C11QuestionStepTitle, answer: C11AnswerFormat)
    steps += [C11QuestionStep]
    
    //C12
    let C12QuestionStepTitle = "Anh/Chị có sử dụng bao cao su khi quan hệ tình dục ?"
    let C12textChoices = [
        ORKTextChoice(text: "Không", value: 0),
        ORKTextChoice(text: "Thỉnh thoảng", value: 1),
        ORKTextChoice(text: "Thường xuyên", value: 2),
        ORKTextChoice(text: "Không biết", value: 3)
    ]
    let C12AnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: C12textChoices)
    let C12QuestionStep = ORKQuestionStep(identifier: "C12QuestionStep", title: C12QuestionStepTitle, answer: C12AnswerFormat)
    steps += [C12QuestionStep]
    
    //C13
    let C13QuestionStepTitle = "Người sống cùng với Anh/Chị đã xét nghiệm xem có nhiễm viêm gan siêu vi B hoặc C hoặc cả 2 chưa ?"
    let C13textChoices = [
        ORKTextChoice(text: "Chưa", value: 0),
        ORKTextChoice(text: "Rồi", value: 1),
        ORKTextChoice(text: "Không biết", value: 2)
    ]
    let C13AnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: C13textChoices)
    let C13QuestionStep = ORKQuestionStep(identifier: "C13QuestionStep", title: C13QuestionStepTitle, answer: C13AnswerFormat)
    steps += [C13QuestionStep]
    
    //C14
    let C14QuestionStepTitle = "Người sống cùng với Anh/Chị có bị nhiễm viêm gan siêu vi B hoặc C hoặc cả 2 không ?"
    let C14textChoices = [
        ORKTextChoice(text: "Không", value: 0),
        ORKTextChoice(text: "Có", value: 1),
        ORKTextChoice(text: "Không biết", value: 2)
    ]
    let C14AnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: C14textChoices)
    let C14QuestionStep = ORKQuestionStep(identifier: "C14QuestionStep", title: C14QuestionStepTitle, answer: C14AnswerFormat)
    steps += [C14QuestionStep]
    
    //C15
    let C15QuestionStepTitle = "Người sống cùng với Anh/Chị đã chích ngừa viêm gan siêu vi B chưa ?"
    let C15textChoices = [
        ORKTextChoice(text: "Chưa", value: 0),
        ORKTextChoice(text: "Rồi", value: 1),
        ORKTextChoice(text: "Không biết", value: 2)
    ]
    let C15AnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: C15textChoices)
    let C15QuestionStep = ORKQuestionStep(identifier: "C15QuestionStep", title: C15QuestionStepTitle, answer: C15AnswerFormat)
    steps += [C15QuestionStep]
    
    //C16
    let C16QuestionStepTitle = "Bản thân Anh/Chị đã chích ngừa viêm gan siêu vi B chưa ?"
    let C16textChoices = [
        ORKTextChoice(text: "Rồi", value: 0),
        ORKTextChoice(text: "Chưa", value: 1),
        ORKTextChoice(text: "Không biết", value: 2)
    ]
    let C16AnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: C16textChoices)
    let C16QuestionStep = ORKQuestionStep(identifier: "C16QuestionStep", title: C16QuestionStepTitle, answer: C16AnswerFormat)
    steps += [C16QuestionStep]
    
    //C17
    let C17QuestionStepTitle = "Anh/Chị có nhớ mình đã tiêm mấy mũi ?"
    let C17textChoices = [
        ORKTextChoice(text: "Nhớ", value: 0),
        ORKTextChoice(text: "Không nhớ", value: 1),
        ORKTextChoice(text: "Không biết", value: 2)
    ]
    let C17AnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: C17textChoices)
    let C17QuestionStep = ORKQuestionStep(identifier: "C17QuestionStep", title: C17QuestionStepTitle, answer: C17AnswerFormat)
    steps += [C17QuestionStep]
    //C17.1
    let C171AnswerFormat = ORKTextAnswerFormat()
    C171AnswerFormat.multipleLines = false
    
    let C171QuestionStepTitle = "Xin cho biết số mũi đã tiêm (chỉ ghi số) ?"
    let C171QuestionStep = ORKQuestionStep(identifier: "C17.1QuestionStep", title: C171QuestionStepTitle, answer: C171AnswerFormat)
    steps += [C171QuestionStep]
    
    //C18
    let C18QuestionStepTitle = "Tiêm lần gần nhất là lúc nào ?"
    let C18textChoices = [
        ORKTextChoice(text: "Cách đây dưới 6 tháng", value: 0),
        ORKTextChoice(text: "Khác", value: 1),
        ORKTextChoice(text: "Không nhớ", value: 2),
        ORKTextChoice(text: "Không biết", value: 3)
    ]
    let C18AnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: C18textChoices)
    let C18QuestionStep = ORKQuestionStep(identifier: "C18QuestionStep", title: C18QuestionStepTitle, answer: C18AnswerFormat)
    steps += [C18QuestionStep]
    //C18.1
    let C181AnswerFormat = ORKTextAnswerFormat()
    C181AnswerFormat.multipleLines = false
    
    let C181QuestionStepTitle = "Xin cho biết cụ thể lần tiêm gần nhất ?"
    let C181QuestionStep = ORKQuestionStep(identifier: "C18.1QuestionStep", title: C181QuestionStepTitle, answer: C181AnswerFormat)
    steps += [C181QuestionStep]

    //Ket thuc
    
    let ThankyouStep = ORKCompletionStep(identifier: "ThankyouStep")
    ThankyouStep.title = "Cảm ơn Anh/Chị đã tham gia"
    steps += [ThankyouStep]

    
    let task = ORKNavigableOrderedTask(identifier: "TaskC", steps: steps)
    
    //TODO: add Rule
    
    //rule cau 1
    let predicate1 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(ORKResultSelector(resultIdentifier: C1QuestionStep.identifier), expectedAnswerValue: 1)
    let rule1:ORKPredicateStepNavigationRule = ORKPredicateStepNavigationRule(resultPredicates: [predicate1], destinationStepIdentifiers: [C2QuestionStep.identifier], defaultStepIdentifier: C4QuestionStep.identifier, validateArrays: true)
    task.setNavigationRule(rule1, forTriggerStepIdentifier: C1QuestionStep.identifier)
    
    //rule cau 2
    let predicate21 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(ORKResultSelector(resultIdentifier: C2QuestionStep.identifier), expectedAnswerValue: 0) //nhớ
    let predicate22 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(ORKResultSelector(resultIdentifier: C2QuestionStep.identifier), expectedAnswerValue: 1) //không nhớ
    let rule2:ORKPredicateStepNavigationRule = ORKPredicateStepNavigationRule(resultPredicates: [predicate21,predicate22], destinationStepIdentifiers: [C21QuestionStep.identifier,C4QuestionStep.identifier], defaultStepIdentifier: C4QuestionStep.identifier, validateArrays: true)
    task.setNavigationRule(rule2, forTriggerStepIdentifier: C2QuestionStep.identifier)
    
    //rule cau 4
    let predicate4 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(ORKResultSelector(resultIdentifier: C4QuestionStep.identifier), expectedAnswerValue: 1)
    let rule4:ORKPredicateStepNavigationRule = ORKPredicateStepNavigationRule(resultPredicates: [predicate4], destinationStepIdentifiers: [C41QuestionStep.identifier], defaultStepIdentifier: C5QuestionStep.identifier, validateArrays: true)
    task.setNavigationRule(rule4, forTriggerStepIdentifier: C4QuestionStep.identifier)
    
    //rule cau 5
    let predicate5 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(ORKResultSelector(resultIdentifier: C5QuestionStep.identifier), expectedAnswerValue: 1)
    let rule5:ORKPredicateStepNavigationRule = ORKPredicateStepNavigationRule(resultPredicates: [predicate5], destinationStepIdentifiers: [C51QuestionStep.identifier], defaultStepIdentifier: C6QuestionStep.identifier, validateArrays: true)
    task.setNavigationRule(rule5, forTriggerStepIdentifier: C5QuestionStep.identifier)
    
    //rule cau 6
    let predicate6 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(ORKResultSelector(resultIdentifier: C6QuestionStep.identifier), expectedAnswerValue: 1)
    let rule6:ORKPredicateStepNavigationRule = ORKPredicateStepNavigationRule(resultPredicates: [predicate6], destinationStepIdentifiers: [C61QuestionStep.identifier], defaultStepIdentifier: C7QuestionStep.identifier, validateArrays: true)
    task.setNavigationRule(rule6, forTriggerStepIdentifier: C6QuestionStep.identifier)
    
    //rule cau 9
    let predicate91 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(ORKResultSelector(resultIdentifier: C9QuestionStep.identifier), expectedAnswerValue: 1) //có
    let predicate92 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(ORKResultSelector(resultIdentifier: C9QuestionStep.identifier), expectedAnswerValue: 2) //không biết thuốc
    let rule9:ORKPredicateStepNavigationRule = ORKPredicateStepNavigationRule(resultPredicates: [predicate91,predicate92], destinationStepIdentifiers: [C91QuestionStep.identifier,C92QuestionStep.identifier], defaultStepIdentifier: C10QuestionStep.identifier, validateArrays: true)
    task.setNavigationRule(rule9, forTriggerStepIdentifier: C9QuestionStep.identifier)
    //rule cau 9.1
    let predicate911 = NSCompoundPredicate.init(notPredicateWithSubpredicate: ORKResultPredicate.predicateForTextQuestionResultWithResultSelector(ORKResultSelector(resultIdentifier:C91QuestionStep.identifier) , expectedString: "")) //lam nguoc lai
    let rule911:ORKPredicateStepNavigationRule = ORKPredicateStepNavigationRule(resultPredicates: [predicate911], destinationStepIdentifiers: [C10QuestionStep.identifier], defaultStepIdentifier: C91QuestionStep.identifier, validateArrays: true)
    task.setNavigationRule(rule911, forTriggerStepIdentifier: C91QuestionStep.identifier)
    
    //rule cau 13
    let predicate131 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(ORKResultSelector(resultIdentifier: C13QuestionStep.identifier), expectedAnswerValue: 0)
    let predicate132 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(ORKResultSelector(resultIdentifier: C13QuestionStep.identifier), expectedAnswerValue: 2)
    let rule13:ORKPredicateStepNavigationRule = ORKPredicateStepNavigationRule(resultPredicates: [predicate131,predicate132], destinationStepIdentifiers: [C15QuestionStep.identifier,C15QuestionStep.identifier], defaultStepIdentifier: C14QuestionStep.identifier, validateArrays: true)
    task.setNavigationRule(rule13, forTriggerStepIdentifier: C13QuestionStep.identifier)
    
    //rule cau 16
    let predicate16 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(ORKResultSelector(resultIdentifier: C16QuestionStep.identifier), expectedAnswerValue: 0)
    let rule16:ORKPredicateStepNavigationRule = ORKPredicateStepNavigationRule(resultPredicates: [predicate16], destinationStepIdentifiers: [C17QuestionStep.identifier], defaultStepIdentifier: ThankyouStep.identifier, validateArrays: true)
    task.setNavigationRule(rule16, forTriggerStepIdentifier: C16QuestionStep.identifier)
    
    //rule cau 17
    let predicate17 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(ORKResultSelector(resultIdentifier: C17QuestionStep.identifier), expectedAnswerValue: 0)
    let rule17:ORKPredicateStepNavigationRule = ORKPredicateStepNavigationRule(resultPredicates: [predicate17], destinationStepIdentifiers: [C171QuestionStep.identifier], defaultStepIdentifier: C18QuestionStep.identifier, validateArrays: true)
    task.setNavigationRule(rule17, forTriggerStepIdentifier: C17QuestionStep.identifier)
    
    //rule cau 18
    let predicate18 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(ORKResultSelector(resultIdentifier: C18QuestionStep.identifier), expectedAnswerValue: 1)
    let rule18:ORKPredicateStepNavigationRule = ORKPredicateStepNavigationRule(resultPredicates: [predicate18], destinationStepIdentifiers: [C181QuestionStep.identifier], defaultStepIdentifier: ThankyouStep.identifier, validateArrays: true)
    task.setNavigationRule(rule18, forTriggerStepIdentifier: C18QuestionStep.identifier)



    
    return task

}