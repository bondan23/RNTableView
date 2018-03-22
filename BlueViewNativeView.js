//  Created by react-native-create-bridge

import React, { Component } from 'react'
import { requireNativeComponent } from 'react-native'

const BlueView = requireNativeComponent('BlueView', BlueViewView)

export default class BlueViewView extends Component {
  render () {
    return <BlueView {...this.props} />
  }
}

