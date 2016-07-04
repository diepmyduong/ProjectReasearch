//
//  MainViewControllerSegue.swift
//  ProjectResearch
//
//  Created by Anh Le on 6/28/16.
//  Copyright © 2016 Anh Le. All rights reserved.
//

import UIKit

class MainViewControllerSegue: UIStoryboardSegue {
        override func perform() {
            let controllerToReplace = sourceViewController.childViewControllers.first
            let destinationControllerView = destinationViewController.view
            
            destinationControllerView.translatesAutoresizingMaskIntoConstraints = true
            destinationControllerView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
            destinationControllerView.frame = sourceViewController.view.bounds
            
            controllerToReplace?.willMoveToParentViewController(nil)
            sourceViewController.addChildViewController(destinationViewController)
            
            sourceViewController.view.addSubview(destinationControllerView)
            controllerToReplace?.view.removeFromSuperview()
            
            destinationViewController.didMoveToParentViewController(sourceViewController)
            controllerToReplace?.removeFromParentViewController()
        }
}
