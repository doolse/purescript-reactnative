'use strict';

const RN = require("react-native");
const ListView = RN.ListView;

exports.refEquality = function (a,b) {
  return a === b;
}

exports.listViewDataSourceImpl = function(props){
    return new ListView.DataSource(props);
}

exports.cloneWithRowsImpl = function(ds,data,ids) {
  return ds.cloneWithRows(data,ids);
}

exports.cloneWithRowsAndSectionsImpl = function(ds,data,sids,rids) {
  return ds.cloneWithRowsAndSections(data, sids, rids);
}

exports.getRowCount = function (ds) {
  return ds.getRowCount();
}

exports.getRowAndSectionCount = function (ds) {
  return ds.getRowAndSectionCount();
}

exports.getRowData = function (ds) {
  return function(sid) {
    return function (rid) {
      return ds.getRowData(sid, rid);
    }
  }
}

exports.rowShouldUpdate = function (ds) {
  return function(sid) {
    return function (rid) {
      return ds.rowShouldUpdate(sid, rid);
    }
  }
}

exports.sectionHeaderShouldUpdate = function (ds) {
  return function(sid) {
    return ds.sectionHeaderShouldUpdate(sid, rid);
  }
}

exports.getSectionHeaderData = function (ds) {
  return function(sid) {
    return ds.getSectionHeaderData(sid, rid);
  }
}

exports.getRowIDForFlatIndex = function (ds) {
  return function (idx) {
    return ds.getRowIDForFlatIndex(idx);
  }
}

exports.getSectionIDForFlatIndex = function (ds) {
  return function (idx) {
    return ds.getSectionIDForFlatIndex(idx);
  }
}

exports.getSectionLengths = function (ds) {
  return ds.getSectionLengths();
}
