
exports.mapUndefined = function (f) {
  return function (fa) {
    return (fa === undefined) ? undefined : f(fa);
  }
}

exports.undefined = undefined;
