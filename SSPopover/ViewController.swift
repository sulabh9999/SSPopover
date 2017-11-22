//
//  ViewController.swift
//  SSPopover
//
//  Created by Sulabh on 06/02/17.
//
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // add SSPopover to navigation bar button
    @IBAction func navBarButtonClicked(_ sender: UIBarButtonItem) {
        let itemList:[String] = ["php","angular","shall","python","java","cpp"]
        makeDropDownMenuListFor(viewItem: sender.value(forKey: "view") as! UIView, withDataList: itemList)
    }
   
    // add SSPopover to show button
    @IBAction func showButtonClicked(_ sender: UIButton) {
        let itemList:[String] = ["view1","view2","view3","view4","view5","view6"]
        makeDropDownMenuListFor(viewItem: sender, withDataList: itemList)
    }
   
    // add SSPopover to textfield
    @IBAction func textFieldEditing(_ sender: UITextField) {
        let itemList:[String] = ["php","angular","shell","python","java","cpp"]
        makeDropDownMenuListFor(viewItem: sender, withDataList: itemList)
    }
    
    // add SSPopover to downside button
    @IBAction func downSideButtonClicked(_ sender: UIButton) {
        let itemList:[String] = ["cell1","cell2","cell3"]
        makeDropDownMenuListFor(viewItem: sender, withDataList: itemList)
    }

    // hide keyboard when 'return' pressed on keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    // make SSPopover
    func makeDropDownMenuListFor(viewItem: UIView, withDataList:[String], direction: UIPopoverArrowDirection = .any)  {
        var menuCellList:[SSPopoverCell] = []
        
        // create cell for SSPopover
        for allItem in withDataList {
            menuCellList.append(SSPopoverCell(cellTitle: allItem, leftImageName: nil))
        }
        
        // create SSPopover controller
        let ssPopover = SSPopoverMenuList(delegate: self)
        let controller = ssPopover.createController(baseView: viewItem, cellList: menuCellList, direction: direction)
        // show SSPopover controller
        self.present(controller, animated: true, completion: nil)
    }
}


// MARK:- SSPopover control
extension ViewController: SSPopoverDelegate {
    
    // SSPopover protocol delegate method(necessary to write)
    func selectedRowInDropdownMenu(cellTag: Int, cellTitle: String?, withView: Any?) {
        // 'cellTag' is to get tag of associated cell
        // 'withView' is cell view
        print("selected row is: " + (cellTitle ?? "Not availed"))
    }
    
    
    
}

