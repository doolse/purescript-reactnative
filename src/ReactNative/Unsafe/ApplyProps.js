'use strict';

exports.unsafeApplyProps = function (p) {
  return function (f) {
    var r = f(p);
    if (r.ios) {
      r = r.ios(r);
      delete r.ios;
    }
    if (r.android) {
      r = r.android(r);
      delete r.android;
    }
    return r;
  }
}

exports.unsafeApplyProps2 = function (p) {
  if (!p.ios && !p.android) {
    return p;
  }
  var r = {};
  Object.assign(r, p, p.ios, p.android);
  delete r.ios;
  delete r.android;
  return r;
}
