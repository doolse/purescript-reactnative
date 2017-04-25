module ReactNative.Components.Touchable (
  TouchablePropsEx
, touchableWithoutFeedback'
, touchableOpacity', touchableHighlight, touchableHighlight'
) where

import Prelude
import Data.Record.Class (class Subrow)
import React (ReactElement)
import ReactNative.Components.View (AccessibilityTraits, AccessibilityType)
import ReactNative.Events (EventHandler, TouchEvent, LayoutEvent)
import ReactNative.PropTypes (Insets)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Styles (Styles)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps2)
import ReactNative.Unsafe.Components (touchableHighlightU, touchableOpacityU, touchableWithoutFeedbackU)

type TouchablePropsEx eff r = (
    accessible :: Boolean
  , accessibilityComponentType :: AccessibilityType
  , accessibilityTraits :: AccessibilityTraits
  , delayLongPress :: Int
  , delayPressIn :: Int
  , delayPressOut :: Int
  , disabled :: Boolean
  , hitSlop :: Insets
  , onLayout :: EventHandler eff LayoutEvent
  , onPress :: EventHandler eff TouchEvent
  , onLongPress :: EventHandler eff TouchEvent
  , onPressIn :: EventHandler eff TouchEvent
  , onPressOut :: EventHandler eff TouchEvent
  , pressRetentionOffset :: Insets
  | r
)

-- | Create a [TouchableWithoutFeedback](https://facebook.github.io/react-native/docs/touchablewithoutfeedback.html) with the given props
touchableWithoutFeedback' :: forall eff o
  .  Subrow o (TouchablePropsEx eff o)
  => {|o} -> ReactElement -> ReactElement
touchableWithoutFeedback' = touchableWithoutFeedbackU <<< unsafeApplyProps2

type TouchableOpacityProps eff = TouchablePropsEx eff (
    activeOpacity :: Number
)
-- | Create a [TouchableOpacity](https://facebook.github.io/react-native/docs/touchableopacity.html) with the given props
touchableOpacity' :: forall eff o
  .  Subrow o (TouchableOpacityProps eff)
  => {|o} -> ReactElement -> ReactElement
touchableOpacity' = touchableOpacityU <<< unsafeApplyProps2

type TouchableHighlightProps eff = TouchablePropsEx eff (
    activeOpacity :: Number
  , onHideUnderlay :: EventHandler eff TouchEvent
  , onshowUnderlay :: EventHandler eff TouchEvent
  , style :: Styles
  , underlayColor :: Color
)

-- | Create a [TouchableHighlight](http://facebook.github.io/react-native/docs/touchablehighlight.html#touchablehighlight) with the given onPress handler
touchableHighlight :: forall eff. EventHandler eff TouchEvent -> ReactElement -> ReactElement
touchableHighlight onPress = touchableHighlightU {onPress}

-- | Create a [TouchableHighlight](https://facebook.github.io/react-native/docs/touchablehilight.html) with the given props
touchableHighlight' :: forall eff o
  .  Subrow o (TouchableHighlightProps eff)
  => {|o} -> ReactElement -> ReactElement
touchableHighlight' = touchableHighlightU <<< unsafeApplyProps2
