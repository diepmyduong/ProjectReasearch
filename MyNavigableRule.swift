//
//  MyNavigableRule.swift
//  ProjectResearch
//
//  Created by Anh Le on 6/28/16.
//  Copyright © 2016 Anh Le. All rights reserved.
//

import Foundation
import ResearchKit

class MyNavigableRule {
    //MARK: Properties
    var identifier:String?
    var triggerStepIdentifier:String?
    var predicateValue:Int
    var expectedStepIdentifier:String?
    
    init(identifier:String?,triggerStepIdentifier:String,predicateValue:Int,expectedStepIdentifier:String){
        self.identifier = identifier
        self.triggerStepIdentifier = triggerStepIdentifier
        self.predicateValue = predicateValue
        self.expectedStepIdentifier = expectedStepIdentifier
    }
    
    func getResultPredicate() ->NSPredicate {
        let predicate = ORKResultPredicate.predicateForChoiceQuestionResultWithResultSelector(ORKResultSelector(resultIdentifier: triggerStepIdentifier!), expectedAnswerValue: predicateValue)
        return predicate
    }
    
    static func loadFromJson(data:AnyObject)->MyNavigableRule?{
        let idendifier = data["idendifier"] as? String
        let triggerStep = data["triggerStepIdentifier"] as? String
        let predicateValue = data["predicateValue"] as! Int
        let expectedStep = data["expectedStepIdentifier"] as? String
        let navigableRule = MyNavigableRule(identifier: idendifier, triggerStepIdentifier: triggerStep!, predicateValue: predicateValue, expectedStepIdentifier: expectedStep!)
        return navigableRule
    }
}