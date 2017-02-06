//
//  PopoverCell.swift
//  VC_As_Tooltip
//
//  Created by Sulabh on 23/01/17.
//  Copyright © 2017 musicHelperOnline. All rights reserved.
//

import UIKit
// cell for SSPopover controller
class SSPopoverCell {

    // set title for popover cell
    var cellTitle:String!
    
    // set image for popover cell
    var leftImageName:String?
    
    // set tag for popover cell
    var tagNumber:Int?
    
    init(cellTitle:String,tag:Int? = nil, leftImageName:String?) {
       self.cellTitle = cellTitle
       self.leftImageName = leftImageName
       self.tagNumber = tag
    }
}
