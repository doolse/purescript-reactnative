exports.scrollToImpl = function (t,_this) {
  return function () {
    _this.scrollTo(t);
  }
}

const RN = require('react-native');

exports.rcSizeImpl = function (f) {
    return RN.RefreshControl.SIZE[f];
}
