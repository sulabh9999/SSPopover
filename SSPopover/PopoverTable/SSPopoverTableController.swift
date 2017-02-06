//
//  SecondController.swift
//  TerstProtocol
//
//  Created by Sulabh on 21/01/17.
//  Copyright © 2017 musicHelperOnline. All rights reserved.
//

import UIKit

// local file variable
fileprivate var popoverBaseView:Any? = nil


// delegate protocol for SSPopover
protocol SSPopoverDelegate {
    func selectedRowInDropdownMenu(cellTag:Int, cellTitle:String, withView:Any!)
}

// MARK:- UIPopoverPresentationControllerDelegate controller
extension UIViewController :UIPopoverPresentationControllerDelegate {
    
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}


// This class create SSPopover controller
class SSPopoverMenuList {
    
    weak var delegeterName:UIViewController?
    
    init(delegater:UIViewController) {
        self.delegeterName = delegater
    }
   
    // create SSPopover
    func createController(baseView:Any, cellList:[SSPopoverCell]!, direction:UIPopoverArrowDirection) -> UIViewController {
        
        popoverBaseView = baseView
        let vc = UIStoryboard(name: "SSPopoverStoryboard", bundle: nil).instantiateViewController(withIdentifier: "popoverViewController") as! SSPopoverTableViewController
        vc.delegater = delegeterName as! SSPopoverDelegate?
        vc.cellList = cellList
        
        //popoverContent.delegater = self
        vc.modalPresentationStyle = .popover
        if let popover = vc.popoverPresentationController {
            
            let viewForSource = baseView as! UIView
            popover.sourceView = viewForSource
            
            // the position of the popover where it's showed
            popover.sourceRect = viewForSource.bounds
            
            // set direction for popover
            switch direction {
                
            case UIPopoverArrowDirection.up:
                popover.permittedArrowDirections = .down
                
            case UIPopoverArrowDirection.down:
                popover.permittedArrowDirections = .up
                
            case UIPopoverArrowDirection.left:
                popover.permittedArrowDirections = .right
                
            case UIPopoverArrowDirection.right:
                popover.permittedArrowDirections = .left
            default:
                popover.permittedArrowDirections = .any
            }
            
            
            // set menubar height
            if cellList.count <= 8 {
                // the size you want to display
                vc.preferredContentSize = CGSize(width:150, height:30 * cellList.count)  // 30 is each cell height
            }else{
                // the size you want to display
                vc.preferredContentSize = CGSize(width:150, height:300)
            }
            
            popover.delegate = delegeterName
        }
        //isDropdownMenuPresent = true
        return vc
    }
    
    
}



// MARK:- SSPopover controller
class SSPopoverTableViewController: UITableViewController {
    var delegater:SSPopoverDelegate?
    var cellList:[SSPopoverCell]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // set number of section in Popover table
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // set number of row on Popover table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellList.count
    }
    
    // create cell for SSPopover
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if let imageName = cellList[indexPath.row].leftImageName {
            cell.imageView?.image =  UIImage(named: imageName)
            cell.contentMode = .scaleToFill
        }
        // set tag for Popover cell
        if let tagIs = cellList[indexPath.row].tagNumber { //
           cell.tag = tagIs
        }else{
           cell.tag = indexPath.row
        }
        // set title for Popover cell
        cell.textLabel?.text = cellList[indexPath.row].cellTitle
        // set font
        cell.textLabel?.font = UIFont.systemFont(ofSize: 12)
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        return cell
    }
    
    // select cell from SSPopover cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let cellTitleName = cell?.textLabel?.text
        let cellTag = cell?.tag
        delegater?.selectedRowInDropdownMenu(cellTag: cellTag!, cellTitle: cellTitleName!,  withView: popoverBaseView)
        self.dismiss(animated: false, completion: nil)
    }
    
    // set height for SSPopover cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}

