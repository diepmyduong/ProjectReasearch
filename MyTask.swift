//
//  MyTask.swift
//  ProjectResearch
//
//  Created by Anh Le on 6/28/16.
//  Copyright © 2016 Anh Le. All rights reserved.
//

import Foundation
import ResearchKit
import JsonSerializerSwift

class MyTask {
    //MARK: Properties
    var identifier:String?
    var title:String = ""
    var steps = [MyStep]()
    
    
    init(identifier:String?,title:String){
        self.identifier = identifier
        self.title = title
    }
    
    func getTask() -> ORKTask? {
        
        if steps.count > 0 {
            var steps = [ORKStep]()
            var navigableRules = [(navigableRule:ORKPredicateStepNavigationRule,step:MyStep)]()
            for step in self.steps {
                steps.append(step.getStep()!)
                if(step.navigableRules.count > 0){
                    var predicates = [NSPredicate]()
                    var expectedSteps = [String]()
                    for predicate in step.navigableRules {
                        predicates.append(predicate.getResultPredicate())
                        expectedSteps.append(predicate.expectedStepIdentifier!)
                    }
                    let predicateRule = ORKPredicateStepNavigationRule(resultPredicates: predicates, destinationStepIdentifiers: expectedSteps, defaultStepIdentifier: step.defaultNextStepIdentifer, validateArrays: true)
                    navigableRules.append((predicateRule,step))
                }
            }
            let task = ORKNavigableOrderedTask(identifier: self.identifier! , steps: steps)
            for (navigableRule,step) in navigableRules {
                task.setNavigationRule(navigableRule, forTriggerStepIdentifier: step.identifier!)
            }
            return task
        }else{
            return nil
        }
    }
    
    static func loadFromJson(jsonData: NSData) -> MyTask?{
        do {
            let result = try NSJSONSerialization.JSONObjectWithData(jsonData, options: .MutableContainers)
            let identifier = result["identifier"] as? String
            let title = result["title"] as! String
            let task = MyTask(identifier: identifier, title: title)
            let stepsObject = result["steps"] as! [AnyObject]
            for stepObject in stepsObject {
                let step = MyStep.loadFromJson(stepObject)
                task.steps += [step!]
            }
            return task
            
        }catch {
            return nil
        }
    }
}