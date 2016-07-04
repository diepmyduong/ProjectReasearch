//
//  TaskB.swift
//  ResearchKitDeMo
//
//  Created by Anh Le on 6/27/16.
//  Copyright © 2016 Vien Le. All rights reserved.
//

import Foundation
import ResearchKit
public class TaskBSurvey
{
    var steps = [ORKStep]()
    
public  func TaskB()->ORKNavigableOrderedTask{
    //var steps = [ORKStep]()
    
    //intro
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "Kiến thức, thái độ, hành vi về HBV, HCV-KAP"
    instructionStep.text = "Sau đây là một số câu hỏi đánh giá cá nhân Anh/Chị về kiến thức thái độ và hành vi"
    steps += [instructionStep]
    
    //cau hoi
    //B1
    TaskB1toB17("Anh/Chị có cho rằng có thể bị viêm gan siêu vi do hút thuốc ?",identifier: "B1ChoiceQuestionStep")
    //B2
    TaskB1toB17("Anh/Chị có cho rằng có thể bị viêm gan siêu vi do ăn uống chung hoặc dùng chung muỗng đũa nĩa ?",identifier: "B2ChoiceQuestionStep")
    //B3
    TaskB1toB17("Anh/Chị có cho rằng có thể bị viêm gan siêu vi do dùng chung bàn chải đánh răng ?",identifier: "B3ChoiceQuestionStep")
    //B4
    TaskB1toB17("Anh/Chị có cho rằng có thể bị viêm gan siêu vi do ở gần người đang hắt hơi hoặc đang ho ?",identifier: "B4ChoiceQuestionStep")
    //B5
    TaskB1toB17("Anh/Chị có cho rằng có thể bị viêm gan siêu vi do quan hệ tình dục ?",identifier: "B5ChoiceQuestionStep")
    //B6
    TaskB1toB17("Anh/Chị có cho rằng có thể bị viêm gan siêu vi do dùng chung hoặc dùng lại mũi kim như châm cứu, xăm trổ, hoặc tiêm chích với kim tiêm đã qua sử dụng?",identifier: "B6ChoiceQuestionStep")
    //B7
    TaskB1toB17("Anh/Chị có cho rằng em bé bị viêm gan siêu vi do lây truyền từ mẹ khi sanh đẻ?",identifier: "B7ChoiceQuestionStep")
    //B8
    TaskB1toB17("Anh/Chị có cho rằng một người bị viêm gan siêu vi trông bình thường, khoẻ mạnh nhưng có thể lây truyền siêu vi viêm gan ?",identifier: "B8ChoiceQuestionStep")
    //B9
    TaskB1toB17("Anh/Chị có cho rằng người bị viêm gan siêu vi có thể bị suốt đời ?",identifier: "B9ChoiceQuestionStep")
    //B10
    TaskB1toB17("Anh/Chị có cho rằng viêm gan siêu vi có thể dẫn tới ung thư gan ?",identifier: "B10ChoiceQuestionStep")
    //B11
    TaskB1toB17("Anh/Chị có cho rằng một người có thể chết vì viêm gan siêu vi không ?",identifier: "B11ChoiceQuestionStep")
    //B12
    TaskB1toB17("Anh/Chị có nghĩ rằng viêm gan siêu vi là có thể trị được ?",identifier: "B12ChoiceQuestionStep")
    //B13
    TaskB1toB17("Anh/Chị có cho rằng nên tránh những người nhiễm siêu vi viêm gan ?",identifier: "B13ChoiceQuestionStep")
    //B14
    TaskB1toB17("Anh/Chị đánh giá khả năng mình có thể bị lây viêm gan siêu vi trong suốt cuộc đời mình là ở mức độ nào ?",identifier: "B14ChoiceQuestionStep")
    //B15
    TaskB1toB17("Anh/Chị có từng thảo luận với người trong gia đình hoặc bạn bè về xét nghiệm viêm gan siêu vi ?",identifier: "B15ChoiceQuestionStep")
    //B16
    TaskB1toB17("Trong gia đình Anh/Chị(như cha mẹ, anh chị em, con cái hoặc chồng/vợ) có người nào bị nhiễm siêu vi không?",identifier: "B16ChoiceQuestionStep")
    //B17
    TaskB1toB17("Anh/Chị có cho rằng người vô gia cư dễ bị viêm gan siêu vi hơn người thường trú ở TPHCM ?",identifier: "B17ChoiceQuestionStep")
    
    //B18
    TaskB18toB26("Anh/Chị có nghĩ rằng thuốc chủng ngừa(vắc-xin) viêm gan B có hiệu quả phòng ngừa viêm gan siêu vi B ? ", identifier: "B18ChoiceQuestionStep")
    //B19
    TaskB18toB26("Anh/Chị có tin rằng thuốc chủng ngừa(vắc-xin) viêm gan B có thể gây tác dụng phụ có hại trên nhiều người  ? ", identifier: "B19ChoiceQuestionStep")
    //B20
    TaskB18toB26("Anh/Chị có tin là thuốc chủng ngừa(vắc-xin) viêm gan B là an toàn ? ", identifier: "B20ChoiceQuestionStep")
    //B21
    TaskB18toB26("Tiêm ngừa viêm gan B có nên nằm trong danh mục được bảo hiểm y tế chi trả ? ", identifier: "B21ChoiceQuestionStep")
    //B22
    TaskB18toB26("Những người khác trong gia đình Anh/Chị có dự định đi tiêm ngừa viêm gan siêu vi B ? ", identifier: "B22ChoiceQuestionStep")
    //B23
    TaskB18toB26("Anh/Chị có biết mình có thể được tiêm ngừa viêm gan B ở đâu không ? ", identifier: "B23ChoiceQuestionStep")
    //B24
    TaskB18toB26("Anh/Chị có khám bác sĩ hay sức khoẻ trong năm qua ? ", identifier: "B24ChoiceQuestionStep")
    //B25
    TaskB18toB26("Anh/Chị có kiểm tra tình trạng nhiễm viêm gan siêu vi trong vòng năm qua ? ", identifier: "B25ChoiceQuestionStep")
    //B26
    TaskB18toB26("Anh/Chị có chích ngừa trong vòng năm qua? ", identifier: "B26ChoiceQuestionStep")
    
    return ORKNavigableOrderedTask(identifier: "TaskB", steps: steps)
}
func TaskB1toB17(Title:String,identifier:String){

    let BTitle = Title
    let BChoices = [
        ORKTextChoice(text: "Chỉ có ở viêm gan siêu vi B", value: 0),
        ORKTextChoice(text: "Chỉ có ở viêm gan siêu vi C", value: 1),
        ORKTextChoice(text: "Có ở cả viêm gan siêu vi B và C", value: 2),
        ORKTextChoice(text: "Không", value: 3),
        ORKTextChoice(text: "Không biết", value: 4)
        
    ]
    let BAnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: BChoices)
    let BQuestionStep = ORKQuestionStep(identifier: identifier, title: BTitle, answer: BAnswerFormat)
   // return BQuestionStep
    steps += [BQuestionStep]
}
    func TaskB18toB26(Title:String,identifier:String){
        
        let BTitle = Title
        let BChoices = [
            ORKTextChoice(text: "Không", value: 0),
            ORKTextChoice(text: "Có", value: 1),
            ORKTextChoice(text: "Không biết", value: 2)
            
        ]
        let BAnswerFormat:ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: BChoices)
        let BQuestionStep = ORKQuestionStep(identifier: identifier, title: BTitle, answer: BAnswerFormat)
        // return BQuestionStep
        steps += [BQuestionStep]
        
    }
}