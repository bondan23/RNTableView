//  Created by react-native-create-bridge

import Foundation
import UIKit

@objc(GroupChatTableViewManager)
class GroupChatTableViewManager : RCTViewManager {
  // Return the native view that represents your React component
  override func view() -> UIView! {
    return GroupChatTableView()
  }

  // Export constants to use in your native module
  override func constantsToExport() -> [AnyHashable : Any]! {
    return ["EXAMPLE_CONSTANT": "example"]
  }
}
