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
