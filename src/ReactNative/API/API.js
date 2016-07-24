const RN = require("react-native")

exports.alertImpl = function (t,msg,buttons,opts) {
  return function () {
    RN.Alert.alert(t,msg,buttons,opts);
  }
}

exports.registerComponent = function(name){
  return function(component){
    return function(){
      RN.AppRegistry.registerComponent(name, function(){ return component; });
    }
  }
}

exports.keyboardDismiss = function () {
  RN.Keyboard.dismiss();
}
