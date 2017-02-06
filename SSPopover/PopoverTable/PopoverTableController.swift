//
//  SecondController.swift
//  TerstProtocol
//
//  Created by Sulabh on 21/01/17.
//  Copyright © 2017 musicHelperOnline. All rights reserved.
//

import UIKit


fileprivate var popoverBaseView:Any? = nil



protocol PopoverProtocol {
    func selectedRowInDropdownMenu(cellTag:Int, cellTitle:String, withView:Any!)
}

extension UIViewController :UIPopoverPresentationControllerDelegate {
    
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}



class MHODropDownMenuList {
    
    weak var delegeterName:UIViewController?
    
    init(delegater:UIViewController) {
        self.delegeterName = delegater
    }
   
    
    func createController(baseView:Any, cellList:[PopoverCell]!, direction:UIPopoverArrowDirection) -> UIViewController {
        
        popoverBaseView = baseView
        let vc = UIStoryboard(name: "PopoverStoryboard", bundle: nil).instantiateViewController(withIdentifier: "popoverViewController") as! PopoverTableViewController
        vc.delegater = delegeterName as! PopoverProtocol?
        vc.cellList = cellList
        
        //popoverContent.delegater = self
        vc.modalPresentationStyle = .popover
        if let popover = vc.popoverPresentationController {
            
            let viewForSource = baseView as! UIView
            popover.sourceView = viewForSource
            
            // the position of the popover where it's showed
            popover.sourceRect = viewForSource.bounds
            
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




class PopoverTableViewController: UITableViewController {
    var delegater:PopoverProtocol?
    var cellList:[PopoverCell]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if let imageName = cellList[indexPath.row].leftImageName {
            cell.imageView?.image =  UIImage(named: imageName)
            cell.contentMode = .scaleToFill
        }
        if let tagIs = cellList[indexPath.row].tagNumber { //
           cell.tag = tagIs
        }else{
           cell.tag = indexPath.row
        }
        cell.textLabel?.text = cellList[indexPath.row].cellTitle
        cell.textLabel?.font = UIFont.systemFont(ofSize: 12)
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let cellTitleName = cell?.textLabel?.text
        let cellTag = cell?.tag
        delegater?.selectedRowInDropdownMenu(cellTag: cellTag!, cellTitle: cellTitleName!,  withView: popoverBaseView)
        self.dismiss(animated: false, completion: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}

