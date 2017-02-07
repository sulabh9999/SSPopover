# SSPopover

## Usage

To run the example project, clone the repo, drag SSPopoverView folder in your project.

### Simple

```swift
let menuList:[String] = ["cell1","cell2", "cell3"]
var menuCellList:[SSPopoverCell]? = []

// create cell for SSPopover
for allItem in menuCellList {
      menuCellList?.append(SSPopoverCell(cellTitle: allItem, leftImageName: nil))
}
// create SSPopover controller
let controller = SSPopoverMenuList(delegater: self).createController(baseView: viewItem, cellList: menuCellList, direction: direction)

// show SSPopover controller
self.present(controller, animated: true, completion: nil)

```

## Requirements
- iOS 8.0+
- swift 3.0


## License

Popover is available under the MIT license. See the LICENSE file for more info.

