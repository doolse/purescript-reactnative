exports.focus = function (_this) {
  return function () {
    _this.focus();
  }
}

exports.clear = function (_this) {
  return function () {
    _this.clear();
  }
}

exports.isFocused = function (_this) {
  return _this.isFocused();
}
