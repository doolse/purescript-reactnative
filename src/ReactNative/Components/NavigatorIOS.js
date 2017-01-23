'use strict';

const RN = require('react-native');

exports.pushImpl = function(this_) {
  return function (route) {
    return function() {
      this_.push(route);
    }
  }
}

exports.popImpl = function(this_) {
    return function() {
      this_.pop();
    }
}
