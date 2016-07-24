'use strict';

const RN = require("react-native")

exports.openDrawer = function (this_) {
  return function() {
    this_.openDrawer();
  }
}
exports.closeDrawer = function (this_) {
  return function() {
    this_.closeDrawer();
  }
}

exports.dpLeft = RN.DrawerLayoutAndroid.positions.Left
exports.dpRight = RN.DrawerLayoutAndroid.positions.Right
