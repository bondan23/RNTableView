//  Created by react-native-create-bridge

import React, { Component } from 'react'
import { requireNativeComponent } from 'react-native'

const GroupChatTableView = requireNativeComponent('GroupChatTableView', GroupChatTableViewView)

export default class GroupChatTableViewView extends Component {
  render () {
    return <GroupChatTableView {...this.props} />
  }
}
