'use strict';

const RN = require("react-native");
const ListView = RN.ListView;

exports.refEquality = function (a,b) {
  return a === b;
}

exports.listViewDataSourceImpl = function(eq){
  return function(items){
    return new ListView.DataSource({
      rowHasChanged: function(r1, r2){ return !eq(r1, r2); }
    }).cloneWithRows(items);
  }
}

exports.cloneWithRows = function(ds) {
  return function (data) {
    return ds.cloneWithRows(data);
  }
}

exports.getRowCount = function (ds) {
  return ds.getRowCount();
}
