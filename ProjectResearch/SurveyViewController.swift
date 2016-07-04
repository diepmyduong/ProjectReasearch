//
//  ViewController.swift
//  ProjectResearch
//
//  Created by Anh Le on 6/27/16.
//  Copyright © 2016 Anh Le. All rights reserved.
//

import UIKit
import ResearchKit
import RETableViewManager

class SurveyViewController: UIViewController {

    //MARK:Outlets
    
    @IBOutlet weak var tableView: UITableView!
    //MARK: Properties
    var manager:RETableViewManager!
    //MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // genarate manager
        self.manager = RETableViewManager(tableView: tableView, delegate: self)
        // add a section
        let section = RETableViewSection(headerTitle: "Survey")
        self.manager.addSection(section)
        // add items
        let itemTaskA = RETableViewItem(title: "Phần A", accessoryType: .DisclosureIndicator, selectionHandler: { (item:RETableViewItem!) in
            let taskController = ORKTaskViewController(task: TaskA, taskRunUUID: nil)
            taskController.delegate = self
            self.presentViewController(taskController, animated: true, completion: nil)
        })
        section.addItem(itemTaskA)
        let itemTaskB = RETableViewItem(title: "Phần B", accessoryType: .DisclosureIndicator, selectionHandler: { (item:RETableViewItem!) in
            let taskController = ORKTaskViewController(task: TaskBSurvey().TaskB(), taskRunUUID: nil)
            taskController.delegate = self
            self.presentViewController(taskController, animated: true, completion: nil)
        })
        section.addItem(itemTaskB)
        let itemTaskC = RETableViewItem(title: "Phần C", accessoryType: .DisclosureIndicator, selectionHandler: { (item:RETableViewItem!) in
            let taskController = ORKTaskViewController(task: TaskC, taskRunUUID: nil)
            taskController.delegate = self
            self.presentViewController(taskController, animated: true, completion: nil)
        })
        section.addItem(itemTaskC)
    }
    
    override func viewDidLayoutSubviews() {
        self.tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
    }
}

extension SurveyViewController:ORKTaskViewControllerDelegate{
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        let result = taskViewController.result
        switch reason {
        case .Completed:
            switch taskViewController.task?.identifier {
            case .Some("TaskA"):
                taskViewController.dismissViewControllerAnimated(true, completion: nil)
                if  let stepContinuesResult = result.resultForIdentifier("stepContinues") as? ORKStepResult,
                    let booleanResult = stepContinuesResult.results?.first as? ORKBooleanQuestionResult,
                    let value = booleanResult.booleanAnswer {
                        if value == 1{
                            if  let A19Result = result.resultForIdentifier("A19QuestionStep") as? ORKStepResult,
                                let choiceResult = A19Result.results?.first as? ORKChoiceQuestionResult ,
                                let value = choiceResult.choiceAnswers?[0] as? Int {
                                if (value == 3 || value == 4) {
                                    let taskController = ORKTaskViewController(task: TaskBSurvey().TaskB(), taskRunUUID: nil)
                                    taskController.delegate = self
                                    self.presentViewController(taskController, animated: true, completion: nil)
                                }else{
                                    let taskController = ORKTaskViewController(task: TaskC, taskRunUUID: nil)
                                    taskController.delegate = self
                                    self.presentViewController(taskController, animated: true, completion: nil)
                                }
                            }
                        }
                }
                break
            default:
                taskViewController.dismissViewControllerAnimated(true, completion: nil)
            }
        default:
            taskViewController.dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
}

extension SurveyViewController:RETableViewManagerDelegate{
    
}
