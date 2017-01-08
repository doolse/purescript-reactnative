const RN = require("react-native");

const empty = function(){};
const TNF = RN.Platform === 'android' ? RN.TouchableNativeFeedback : {
  SelectableBackground: empty,
  SelectableBackgroundBorderless: empty,
  canUseNativeForeground: empty,
  Ripple: empty
};

exports.selectableBackground = TNF.SelectableBackground();
exports.selectableBackgroundBorderless = TNF.SelectableBackgroundBorderless();
exports.ripple = function (color) {
  return function (b) {
    return TNF.Ripple(color,b);
  }
};
exports.canUseNativeForeground = TNF.canUseNativeForeground();
