'use strict';

const RN = require("react-native");
const NE = RN.NavigationExperimental
const NSU = NE.StateUtils

exports.cardStackClass = NE.CardStack

exports.pushRouteImpl = NSU.push
exports.popRoute = NSU.pop
