import React, { Component } from "react";
import { requireNativeComponent,UIManager } from "react-native";

const ReactView = requireNativeComponent("ReactView", ReactNativeComp);
const ReactViewConst = UIManager.ReactView.Constants;

export default class ReactNativeComp extends Component {
  render() {
    return <ReactView exampleProp={ReactViewConst.EXAMPLE} {...this.props}/>;
  }
}
