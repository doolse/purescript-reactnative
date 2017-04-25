'use strict';

exports.unsafeApplyProps = function (p) {
  if (!p.ios && !p.android) {
    return p;
  }
  var r = {};
  Object.assign(r, p, p.ios, p.android);
  delete r.ios;
  delete r.android;
  return r;
}
