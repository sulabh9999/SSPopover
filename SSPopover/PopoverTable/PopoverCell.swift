//
//  PopoverCell.swift
//  VC_As_Tooltip
//
//  Created by Sulabh on 23/01/17.
//  Copyright © 2017 musicHelperOnline. All rights reserved.
//

import UIKit

class PopoverCell {

    var cellTitle:String!
    var leftImageName:String?
    var tagNumber:Int?
    
    init(cellTitle:String,tag:Int? = nil, leftImageName:String?) {
       self.cellTitle = cellTitle
       self.leftImageName = leftImageName
       self.tagNumber = tag
    }
}
