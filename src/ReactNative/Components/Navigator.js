'use strict';

const RN = require('react-native');
const SC = RN.Navigator.SceneConfigs;

exports.sceneConfigEnum = function(n) {
  return SC[n];
}

exports.push = function(this_) {
  return function (s) {
    return function() {
      this_.push(s);
    }
  }
}

exports.pop = function(this_) {
    return function() {
      this_.pop();
    }
}

exports.jumpTo = function(this_) {
  return function (s) {
    return function() {
      this_.jumpTo(s);
    }
  }
}

exports.replace = function(this_) {
  return function (s) {
    return function() {
      this_.replace(s);
    }
  }
}

exports.jumpForward = function(this_) {
    return function() {
      this_.jumpForward();
    }
}

exports.jumpBack = function(this_) {
    return function() {
      this_.jumpBack();
    }
}

exports.getCurrentRoutes = function(this_) {
    return this_.getCurrentRoutes();
}
