//
//  ImageViewItem.swift
//  ProjectResearch
//
//  Created by Anh Le on 7/3/16.
//  Copyright © 2016 Anh Le. All rights reserved.
//

import RETableViewManager

class ImageViewItem:RETableViewItem {
    
    
    class func itemWithImage(image: UIImage) -> ImageViewItem {
        let item: ImageViewItem = ImageViewItem()
        item.image = image
        item.cellHeight = image.size.height
        return item
    }
}
