//
//  News.swift
//  ProjectResearch
//
//  Created by Anh Le on 6/30/16.
//  Copyright © 2016 Anh Le. All rights reserved.
//

import Foundation

class News{
    //MARK: Properties
    var id:String!
    var title:String!
    var description:String!
    var content:String?
    var createAt:NSDate!
    var createBy:String!
    var updateAt:NSDate?
    var updateBy:NSDate?
    
    init(id:String,title:String,description:String,createAt:NSDate,createBy:String){
        self.id = id;
        self.title = title;
        self.description = description;
        self.createAt = createAt;
        self.createBy = createBy;
    }
    
}
