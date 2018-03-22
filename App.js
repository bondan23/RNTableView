/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from "react";
import {
  Platform,
  StyleSheet,
  Text,
  View,
  TextInput,
  UIManager,
  findNodeHandle,
  TouchableOpacity
} from "react-native";
import ReactNativeComp from "./ReactNativeComp";
import RNTableViewNative from "./RNTableViewNativeView";

const instructions = Platform.select({
  ios: "Press Cmd+R to reload,\n" + "Cmd+D or shake for dev menu",
  android:
    "Double tap R on your keyboard to reload,\n" +
    "Shake or press menu button for dev menu"
});

type Props = {};
export default class App extends Component<Props> {
  constructor(props) {
    super(props);
    this.tableViewHandle = null;
  }

  handleScroll = ({ nativeEvent }) => {
    console.log("====================================");
    console.log(nativeEvent);
    console.log("====================================");
  };

  handlePress = () => {
    console.log("====================================");
    console.log(this.tableViewHandle);
    console.log("====================================");
    UIManager.dispatchViewManagerCommand(
      this.tableViewHandle,
      UIManager.RNTableView.Commands.scrollToEnd,
      null
    );
  };

  handlePressAppendData = () => {
    UIManager.dispatchViewManagerCommand(
      this.tableViewHandle,
      UIManager.RNTableView.Commands.appendData,
      ["haiii", "Bondan23"]
    );
  };

  componentDidMount() {
    this.tableViewHandle = findNodeHandle(this.refs.tableView);
    console.log("====================================");
    console.log(this.tableViewHandle, UIManager.RNTableView);
    console.log("====================================");
  }

  render() {
    return (
      <View style={{ flex: 1, marginTop: 20 }}>
        <RNTableViewNative
          ref={"tableView"}
          style={{ flex: 1 }}
          onScroll={this.handleScroll}
        />
        <View style={{ flexDirection: "row" }}>
          <TouchableOpacity
            style={{
              height: 40,
              alignItems: "center",
              justifyContent: "center",
              flex: 1
            }}
            activeOpacity={0.8}
            onPress={this.handlePress}
          >
            <Text>Scroll To Bottom</Text>
          </TouchableOpacity>
          <TouchableOpacity
            style={{
              height: 40,
              alignItems: "center",
              justifyContent: "center",
              flex: 1,
              backgroundColor: "blue"
            }}
            activeOpacity={0.8}
            onPress={this.handlePressAppendData}
          >
            <Text style={{ color: "white" }}>Append Data</Text>
          </TouchableOpacity>
        </View>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "#F5FCFF"
  },
  welcome: {
    fontSize: 20,
    textAlign: "center",
    margin: 10
  },
  instructions: {
    textAlign: "center",
    color: "#333333",
    marginBottom: 5
  }
});
