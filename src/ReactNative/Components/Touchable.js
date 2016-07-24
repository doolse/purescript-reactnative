
const RN = require("react-native");
const TNF = RN.TouchableNativeFeedback
exports.selectableBackground = TNF.SelectableBackground();
exports.selectableBackgroundBorderless = TNF.SelectableBackgroundBorderless();
exports.ripple = function (color) {
  return function (b) {
    return TNF.Ripple(color,b);
  }
}
exports.canUseNativeForeground = RNF.canUseNativeForeground();
