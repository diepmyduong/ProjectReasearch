//
//  ImageViewCell.swift
//  ProjectResearch
//
//  Created by Anh Le on 7/3/16.
//  Copyright © 2016 Anh Le. All rights reserved.
//

import RETableViewManager

class ImageViewCell:RETableViewCell {
    var pictureView:UIImageView!
    var imageItem:ImageViewItem?
    
    override func cellDidLoad() {
        super.cellDidLoad()
        pictureView = UIImageView.init(frame: CGRectMake(7, 0, 306, 306))
        pictureView.autoresizingMask = [.FlexibleLeftMargin,.FlexibleRightMargin]
        self.addSubview(self.pictureView)
    }
    
    override func cellWillAppear() {
        super.cellWillAppear()
        self.pictureView.image = imageItem?.image
    }
    
}
