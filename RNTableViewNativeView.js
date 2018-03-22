//  Created by react-native-create-bridge

import React, { Component } from 'react'
import { requireNativeComponent } from 'react-native'

const RNTableView = requireNativeComponent('RNTableView', RNTableViewNative)

export default class RNTableViewNative extends Component {
  render () {
    return <RNTableView {...this.props} />
  }
}