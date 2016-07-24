'use strict';

const RN = require('react-native');

function styles(sarr) {
  var result = {};

  for (var i = 0, len = sarr.length; i < len; i++) {
    var style = sarr[i];

    for (var key in style) {
      if (style.hasOwnProperty(key)) {
        result[key] = style[key];
      }
    }
  }
  return result;
}

exports.styles = styles

exports.staticStyles = function(sarr) {
  return RN.StyleSheet.create({s:styles(sarr)}).s;
};

exports.unsafeStyleProp = function(s) {
  return function(v) {
    var o = {};
    o[s] = v;
    return o;
  }
}

exports.hairlineWidth = RN.StyleSheet.hairlineWidth;
