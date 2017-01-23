'use strict';

const RN = require('react-native');
const SC = RN.Navigator.SceneConfigs;

exports.sceneConfigEnum = function(n) {
  return SC[n];
}

exports.pushImpl = function(this_) {
  return function (s) {
    return function() {
      this_.push(s);
    }
  }
}

exports.popImpl = function(this_) {
    return function() {
      this_.pop();
    }
}

exports.getCurrentRoutes = function(this_) {
    return this_.getCurrentRoutes();
}
