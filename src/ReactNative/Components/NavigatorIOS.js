'use strict';

const RN = require('react-native');

exports.push = function(this_) {
  return function (route) {
    return function() {
      this_.push(route);
    }
  }
}

exports.pop = function(this_) {
    return function() {
      this_.pop();
    }
}
