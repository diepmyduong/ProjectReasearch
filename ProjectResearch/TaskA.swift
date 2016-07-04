//
//  TaskA.swift
//  ResearchKitDeMo
//
//  Created by Anh Le on 6/28/16.
//  Copyright © 2016 Vien Le. All rights reserved.
//

import Foundation
import ResearchKit

public var TaskA:ORKNavigableOrderedTask
{
    var steps = [ORKStep]()
    //Overview
    let overview = ORKInstructionStep(identifier: "overview")
    overview.detailText = "Anh/Chị vui lòng trả lời các câu hỏi sau đây, viết vào các dòng chừa trống hoặc đánh dấu chéo vào lựa chọn phù hợp. Anh/Chị có thể chọn ô “không biết” hoặc “từ chối trả lời” nếu không muốn trả lời:"
    overview.title = "Bảng câu hỏi"
    steps.append(overview)
    //A1_3
    let A1_3QuestionStep = ORKFormStep(identifier: "A1_3QuestionStep", title: "Đặc điểm cá nhân", text: nil)
    let itemA1 = ORKFormItem(identifier: "itemA1", text: "Họ tên", answerFormat: ORKAnswerFormat.textAnswerFormat(),optional: false)
    itemA1.placeholder = "Bắt buộc"
    (itemA1.answerFormat as! ORKTextAnswerFormat).multipleLines = false
    let itemA2 = ORKFormItem(identifier: "itemA2", text: "Số CMND", answerFormat: ORKAnswerFormat.textAnswerFormatWithMaximumLength(9), optional: false)
    itemA2.placeholder = "Bắt buộc"
    (itemA2.answerFormat as! ORKTextAnswerFormat).multipleLines = false
    (itemA2.answerFormat as! ORKTextAnswerFormat).keyboardType = .NumberPad
    (itemA2.answerFormat as! ORKTextAnswerFormat).validationRegex = "^[0-9]{9,9}$"
    (itemA2.answerFormat as! ORKTextAnswerFormat).invalidMessage = "Chỉ có thể nhập 9 số "
    let itemA3 = ORKFormItem(identifier: "itemA3", text: "Ngày sinh", answerFormat: ORKAnswerFormat.dateAnswerFormat(), optional: false)
    itemA3.placeholder = "Bắt buộc"
    
    A1_3QuestionStep.formItems = [itemA1,itemA2,itemA3]
    A1_3QuestionStep.optional = false
    steps.append(A1_3QuestionStep)
    //A4
    //-- Gender
    let genderFormat = ORKHealthKitCharacteristicTypeAnswerFormat(characteristicType: HKCharacteristicType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierBiologicalSex)!)
    let A4QuestionStep = ORKQuestionStep(identifier: "A4QuestionStep", title: "Giới tính", answer: genderFormat)
    A4QuestionStep.optional = false
    steps.append(A4QuestionStep)
    //A5
    let A5QuestionStep = ORKQuestionStep(identifier: "A5QuestionStep", title: "Nơi sinh", answer: ORKTextAnswerFormat())
    A5QuestionStep.optional = false
    steps.append(A5QuestionStep)
    //A6
    let A6QuestionStep = ORKFormStep(identifier: "A6QuestionStep", title: "Địa chỉ thường chú", text: nil)
    A6QuestionStep.optional = false
    let inlineTextAnswerFormat = ORKTextAnswerFormat()
    inlineTextAnswerFormat.multipleLines = false
    let itemA6_DUONG = ORKFormItem(identifier: "itemA6_DUONG", text: "Đường", answerFormat: inlineTextAnswerFormat, optional: false)
    itemA6_DUONG.placeholder = "Bắt buộc"
    let itemA6_PHUONG = ORKFormItem(identifier: "itemA6_PHUONG", text: "Phường, Xã", answerFormat: inlineTextAnswerFormat, optional: false)
    itemA6_PHUONG.placeholder = "Bắt buộc"
    let itemA6_QUAN = ORKFormItem(identifier: "itemA6_QUAN", text: "Quận, Huyện", answerFormat: inlineTextAnswerFormat, optional: false)
    itemA6_QUAN.placeholder = "Bắt buộc"
    let itemA6_TP = ORKFormItem(identifier: "itemA6_TP", text: "Tỉnh Thành", answerFormat: inlineTextAnswerFormat, optional: false)
    itemA6_TP.placeholder = "Bắt buộc"
    let itemA6_NHA = ORKFormItem(identifier: "itemA6_NHA", text: "Đây là", answerFormat: ORKTextChoiceAnswerFormat(style: .SingleChoice, textChoices: [
            ORKTextChoice(text: "Nhà riêng", value: 0),
            ORKTextChoice(text: "Nhà thuê", value: 1)
        ]),optional: false)
    A6QuestionStep.formItems  = [itemA6_DUONG,itemA6_PHUONG,itemA6_QUAN,itemA6_TP,itemA6_NHA]
    steps.append(A6QuestionStep)
    //Ạ7
    let A7QuestionStep = ORKQuestionStep(identifier: "A7QuestionStep", title: "Trên 6 tháng trước, Anh/Chị đã ở đâu?", answer: ORKTextAnswerFormat())
    A7QuestionStep.placeholder = "Bắt buộc"
    A7QuestionStep.optional = false
    steps.append(A7QuestionStep)
    //A8_11
    let A8_11QuestionStep = ORKFormStep(identifier: "A8_11QuestionStep", title: "Thông tin liên lạc", text: nil)
    A8_11QuestionStep.optional = false
    let itemA8 = ORKFormItem(identifier: "itemA8", text: "Điện thoại cố định", answerFormat: inlineTextAnswerFormat, optional: false)
    (itemA8.answerFormat as! ORKTextAnswerFormat).keyboardType = .NumberPad
    (itemA8.answerFormat as! ORKTextAnswerFormat).validationRegex = "^[0-9]*$"
    (itemA8.answerFormat as! ORKTextAnswerFormat).invalidMessage = "Chỉ có thể nhập số"
    itemA8.placeholder = "Bắt buộc"
    let itemA9 = ORKFormItem(identifier: "itemA9", text: "Điện thoại di động", answerFormat: inlineTextAnswerFormat, optional: true)
    (itemA9.answerFormat as! ORKTextAnswerFormat).keyboardType = .NumberPad
    (itemA9.answerFormat as! ORKTextAnswerFormat).validationRegex = "^[0-9]*$"
    (itemA9.answerFormat as! ORKTextAnswerFormat).invalidMessage = "Chỉ có thể nhập số"
    itemA9.placeholder = "Nếu có"
    let itemA10 = ORKFormItem(identifier: "itemA10", text: "Số di động khác", answerFormat: inlineTextAnswerFormat, optional: true)
    (itemA10.answerFormat as! ORKTextAnswerFormat).keyboardType = .NumberPad
    (itemA10.answerFormat as! ORKTextAnswerFormat).validationRegex = "^[0-9]*$"
    (itemA10.answerFormat as! ORKTextAnswerFormat).invalidMessage = "Chỉ có thể nhập số"
    itemA10.placeholder = "Nếu có"
    let itemA11 = ORKFormItem(identifier: "itemA11", text: "Email", answerFormat: inlineTextAnswerFormat, optional: true)
    (itemA11.answerFormat as! ORKTextAnswerFormat).keyboardType = .EmailAddress
    (itemA11.answerFormat as! ORKTextAnswerFormat).validationRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
    (itemA11.answerFormat as! ORKTextAnswerFormat).invalidMessage = "Chưa nhập đúng email"
    itemA11.placeholder = "Nếu có"
    A8_11QuestionStep.formItems  = [itemA8,itemA9,itemA10,itemA11]
    steps.append(A8_11QuestionStep)
    //A12
    let A12QuestionStepTitle = "Cách thức liên lạc tiện nhất là ?"
    let A12textChoices = [
        ORKTextChoice(text: "Điện thoại cố định", value: 0),
        ORKTextChoice(text: "Điện thoại di động", value: 1),
        ORKTextChoice(text: "Email", value: 2),
         ORKTextChoice(text: "Đến nhà gặp trực tiếp", value: 3)
        
        ]
    let A12AnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: A12textChoices)
    let A12QuestionStep = ORKQuestionStep(identifier: "A12QuestionStep", title: A12QuestionStepTitle, answer: A12AnswerFormat)
    steps += [A12QuestionStep]
    
    //A13
    let A13QuestionStepTitle = "Dân tộc ?"
    let A13textChoices = [
        ORKTextChoice(text: "Kinh", value: 0),
        ORKTextChoice(text: "Hoa", value: 1),
        ORKTextChoice(text: "Khác", value: 2),
        ORKTextChoice(text: "Không biết", value: 3)
    ]
    let A13AnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: A13textChoices)
    let A13QuestionStep = ORKQuestionStep(identifier: "A13QuestionStep", title: A13QuestionStepTitle, answer: A13AnswerFormat)
    steps += [A13QuestionStep]
    
    //A13.1
    let A131AnswerFormat = ORKTextAnswerFormat()
    A131AnswerFormat.multipleLines = false
    
    let A131QuestionStepTitle = "Xin cho biết tên dân tộc ?"
    let A131QuestionStep = ORKQuestionStep(identifier: "A13.1QuestionStep", title: A131QuestionStepTitle, answer: A131AnswerFormat)
    steps += [A131QuestionStep]
    
    //A14
    let A14QuestionStepTitle = "Nghề nghiệp ?"
    let A14textChoices = [
        ORKTextChoice(text: "Không đi làm/nội trợ-không có thu nhập", value: 0),
        ORKTextChoice(text: "Có đi làm", value: 1)
        
    ]
    let A14AnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: A14textChoices)
    let A14QuestionStep = ORKQuestionStep(identifier: "A14QuestionStep", title: A14QuestionStepTitle, answer: A14AnswerFormat)
    steps += [A14QuestionStep]
    //A14.1
    let A141AnswerFormat = ORKTextAnswerFormat()
    A141AnswerFormat.multipleLines = false
    
    let A141QuestionStepTitle = "Xin cho biết nghề nghiệp cụ thể ?"
    let A141QuestionStep = ORKQuestionStep(identifier: "A14.1QuestionStep", title: A141QuestionStepTitle, answer: A141AnswerFormat)
    steps += [A141QuestionStep]
    
    //A15
    let A15QuestionStepTitle = "Mức thu nhập cá nhân ?"
    let A15textChoices = [
        ORKTextChoice(text: "Dưới 2.5 triệu/tháng hoặc dưới 30 triệu/năm", value: 0),
        ORKTextChoice(text: "2.5-7 triệu/tháng hoặc 30-84 triệu/năm", value: 1),
        ORKTextChoice(text: "7-10 triệu/tháng hoặc 84-120 triệu/năm", value: 2),
        ORKTextChoice(text: "Trên 10 triệu/tháng hoặc trên 120 triệu/năm", value: 3),
        ORKTextChoice(text: "Không có thu nhập", value: 4),
        ORKTextChoice(text: "Không biết", value: 5)
        
    ]
    let A15AnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: A15textChoices)
    let A15QuestionStep = ORKQuestionStep(identifier: "A15QuestionStep", title: A15QuestionStepTitle, answer: A15AnswerFormat)
    steps += [A15QuestionStep]
    
    
    //A16
    let A16QuestionStepTitle = "Anh/Chị có biết số người phụ thuộc(cùng hưởng mức thu nhập cá nhân tính luôn cả Anh/Chị) ?"
    let A16textChoices = [
        ORKTextChoice(text: "Biết", value: 0),
        ORKTextChoice(text: "Không biết", value: 1)
        
    ]
    let A16AnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: A16textChoices)
    let A16QuestionStep = ORKQuestionStep(identifier: "A16QuestionStep", title: A16QuestionStepTitle, answer: A16AnswerFormat)
    steps += [A16QuestionStep]
    //A16.1
    let A161AnswerFormat = ORKTextAnswerFormat()
    A161AnswerFormat.multipleLines = false
    
    let A161QuestionStepTitle = "Xin cho biết số lượng số người phụ thuộc?"
    let A161QuestionStep = ORKQuestionStep(identifier: "A16.1QuestionStep", title: A161QuestionStepTitle, answer: A161AnswerFormat)
    steps += [A161QuestionStep]

    
    //A17
    let A17QuestionStepTitle = "Học vấn cao nhất ?"
    let A17textChoices = [
        ORKTextChoice(text: "Không đi học, không biết đọc, không biết viết", value: 0),
        ORKTextChoice(text: "Có biết chữ nhưng không có bằng cấp", value: 1),
        ORKTextChoice(text: "Tiểu học", value: 2),
        ORKTextChoice(text: "Trung học cơ sở", value: 3),
        ORKTextChoice(text: "Trung học phổ thông", value: 4),
        ORKTextChoice(text: "Học nghề(sau khi tốt nghiệp trung học cơ sở)", value: 5),
        ORKTextChoice(text: "Cao đẳng nghề", value: 6),
        ORKTextChoice(text: "Đại học", value: 7),
        ORKTextChoice(text: "Sau đại học", value: 8)
        
    ]
    let A17AnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: A17textChoices)
    let A17QuestionStep = ORKQuestionStep(identifier: "A17QuestionStep", title: A17QuestionStepTitle, answer: A17AnswerFormat)
    steps += [A17QuestionStep]
    
    //A18
    let A18QuestionStepTitle = "Tình trạng hôn nhân ?"
    let A18textChoices = [
        ORKTextChoice(text: "Độc thân/Chưa kết hôn", value: 0),
        ORKTextChoice(text: "Đang sống chung nhưng chưa kết hôn", value: 1),
        ORKTextChoice(text: "Đang có chồng vợ", value: 2),
        ORKTextChoice(text: "Ly thân", value: 3),
        ORKTextChoice(text: "Ly dị", value: 4),
        ORKTextChoice(text: "Goá", value: 5),
        ORKTextChoice(text: "Không biết", value: 6)
        
    ]
    let A18AnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: A18textChoices)
    let A18QuestionStep = ORKQuestionStep(identifier: "A18QuestionStep", title: A18QuestionStepTitle, answer: A18AnswerFormat)
    steps += [A18QuestionStep]
    
    //A19
    let A19QuestionStepTitle = "Anh/Chị có bị nhiễm vi-rút viêm gan siêu vi B hay C không ?"
    let A19textChoices = [
        ORKTextChoice(text: "Bị nhiễm viêm gan siêu vi B", value: 0),
        ORKTextChoice(text: "Bị nhiễm viêm gan siêu vi C", value: 1),
        ORKTextChoice(text: "Bị nhiễm viêm gan siêu vi B và C", value: 2),
        ORKTextChoice(text: "Không bị nhiễm", value: 3), //sang B
        ORKTextChoice(text: "Không biết", value: 4),//sang B
        ORKTextChoice(text: "Khác", value: 5)
        
    ]
    let A19AnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: A19textChoices)
    let A19QuestionStep = ORKQuestionStep(identifier: "A19QuestionStep", title: A19QuestionStepTitle, answer: A19AnswerFormat)
    steps += [A19QuestionStep]
    //A19.1
    let A191AnswerFormat = ORKTextAnswerFormat()
    A191AnswerFormat.multipleLines = false
    
    let A191QuestionStepTitle = "Xin cho biết cụ thể ?"
    let A191QuestionStep = ORKQuestionStep(identifier: "A19.1QuestionStep", title: A191QuestionStepTitle, answer: A191AnswerFormat)
    steps += [A191QuestionStep]

    
    //A20
    let A20QuestionStepTitle = "Anh/Chị có giữ kết quả xét nghiệm máu hay giấy tờ có xác nhận của bác sĩ không ?"
    let A20textChoices = [
        ORKTextChoice(text: "Không có", value: 0),
        ORKTextChoice(text: "Có", value: 1),
        ORKTextChoice(text: "Không biết", value: 2)
        
    ]
    let A20AnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: A20textChoices)
    let A20QuestionStep = ORKQuestionStep(identifier: "A20QuestionStep", title: A20QuestionStepTitle, answer: A20AnswerFormat)
    steps += [A20QuestionStep]
    
    //A21
    let A21QuestionStepTitle = "Anh/Chị có đang bị bệnh về gan và có nhiễm siêu vi viêm gan B hay C hay cả hai ?"
    let A21textChoices = [
        ORKTextChoice(text: "Bị bệnh gan (hoặc viêm gan) do siêu vi B hoặc C hoặc cả hai", value: 0),
        ORKTextChoice(text: "Bị xơ gan", value: 1),
        ORKTextChoice(text: "bị ung thư gan", value: 2),
        ORKTextChoice(text: "Không bị bệnh gì về gan kèm theo nhiễm siêu vi viêm gan cả", value: 3),
        ORKTextChoice(text: "Không bị bệnh gì hết", value: 4)
        
    ]
    let A21AnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: A21textChoices)
    let A21QuestionStep = ORKQuestionStep(identifier: "A21QuestionStep", title: A21QuestionStepTitle, answer: A21AnswerFormat)
    steps += [A21QuestionStep]
    
    let stepContinues = ORKQuestionStep(identifier: "stepContinues", title: "Cám ơn Anh/chị đã hoàn thành bảng câu hỏi phần A, Anh/Chị có muốn tiếp tục?", answer: ORKBooleanAnswerFormat())
    steps += [stepContinues]
    
    let stepEnd = ORKCompletionStep(identifier: "stepEnd")
    stepEnd.title = "Xin cám ơn"
    steps += [stepEnd]
    
    let task = ORKNavigableOrderedTask(identifier: "TaskA", steps: steps)
    
    //TODO: add Rule
    //rule cau 13
    let predicateA13 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(ORKResultSelector(resultIdentifier: A13QuestionStep.identifier), expectedAnswerValue: 2)
    let ruleA13:ORKPredicateStepNavigationRule = ORKPredicateStepNavigationRule(resultPredicates: [predicateA13], destinationStepIdentifiers: [A131QuestionStep.identifier], defaultStepIdentifier: A14QuestionStep.identifier, validateArrays: true)
    task.setNavigationRule(ruleA13, forTriggerStepIdentifier: A13QuestionStep.identifier)
    
    //rule cau 14
    let predicateA14 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(ORKResultSelector(resultIdentifier: A14QuestionStep.identifier), expectedAnswerValue: 1)
    let ruleA14:ORKPredicateStepNavigationRule = ORKPredicateStepNavigationRule(resultPredicates: [predicateA14], destinationStepIdentifiers: [A141QuestionStep.identifier], defaultStepIdentifier: A15QuestionStep.identifier, validateArrays: true)
    task.setNavigationRule(ruleA14, forTriggerStepIdentifier: A14QuestionStep.identifier)
    
    //rule cau 16
    let predicateA16 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(ORKResultSelector(resultIdentifier: A16QuestionStep.identifier), expectedAnswerValue: 0)
    let ruleA16:ORKPredicateStepNavigationRule = ORKPredicateStepNavigationRule(resultPredicates: [predicateA16], destinationStepIdentifiers: [A161QuestionStep.identifier], defaultStepIdentifier: A17QuestionStep.identifier, validateArrays: true)
    task.setNavigationRule(ruleA16, forTriggerStepIdentifier: A16QuestionStep.identifier)

    
    //rule cau 19
    let predicateA19 = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(ORKResultSelector(resultIdentifier: A19QuestionStep.identifier), expectedAnswerValue: 5)
    let ruleA19:ORKPredicateStepNavigationRule = ORKPredicateStepNavigationRule(resultPredicates: [predicateA19], destinationStepIdentifiers: [A191QuestionStep.identifier], defaultStepIdentifier: A20QuestionStep.identifier, validateArrays: true)
    task.setNavigationRule(ruleA19, forTriggerStepIdentifier: A19QuestionStep.identifier)


    
     return task
}