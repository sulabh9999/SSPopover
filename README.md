# SSPopover

## Usage

To run the example project, clone the repo, drag SSPopoverView folder in your project.

### Simple

```swift
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let menuList: [String] = ["cell1","cell2", "cell3"]
        var menuCellList: [SSPopoverCell] = []

        // create cell for SSPopover
        for allItem in menuList {
           menuCellList.append(SSPopoverCell(cellTitle: allItem, leftImageName: nil))
        }
        
        // create SSPopover controller
        let ssPopover = SSPopoverMenuList(delegater: self)
        let controller = ssPopover.createController(baseView: viewItem, cellList: menuCellList, direction: direction)

        // show SSPopover controller
        self.present(controller, animated: true, completion: nil)
    }
}

extension ViewController: SSPopoverDelegate {
    // SSPopover protocol delegate method(necessary to write)
    func selectedRowInDropdownMenu(cellTag: Int, cellTitle: String?, withView: Any?) {
        // 'cellTag' is to get tag of associated cell
        // 'withView' is cell view
        print("selected row is: " + (cellTitle ?? "Not availed"))
    }
}




```

## Requirements
- iOS 8.0+
- swift 3.0


## License

Popover is available under the MIT license. See the LICENSE file for more info.

