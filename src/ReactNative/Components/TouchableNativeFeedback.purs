-- See [TouchableNativeFeedback](https://facebook.github.io/react-native/docs/touchablenativefeedback.html)
module ReactNative.Components.TouchableNativeFeedback (
  TouchableNativeFeedbackProps
, TouchableNativeBackground
, touchableNativeFeedback', touchableNativeFeedback
, selectableBackground, selectableBackgroundBorderless, ripple, canUseNativeForeground
) where

import Prelude
import React (ReactElement)
import ReactNative.Events (EventHandler, TouchEvent)
import ReactNative.PropTypes (Prop)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Unsafe.Components (touchableNativeFeedbackU)
import ReactNative.Components.Touchable(TouchablePropsEx)

foreign import data TouchableNativeBackground :: *
type TouchableNativeFeedbackProps eff = TouchablePropsEx eff (
    background :: TouchableNativeBackground
  , useForeground :: Boolean
)

-- | Create a TouchableNativeFeedback with the given onPress handler
touchableNativeFeedback :: forall eff. EventHandler eff TouchEvent -> ReactElement -> ReactElement
touchableNativeFeedback onPress = touchableNativeFeedbackU {onPress}

-- | Create a TouchableNativeFeedback with the given props
touchableNativeFeedback' :: forall eff. Prop (TouchableNativeFeedbackProps eff) -> ReactElement -> ReactElement
touchableNativeFeedback' = touchableNativeFeedbackU <<< unsafeApplyProps {}

foreign import selectableBackground :: TouchableNativeBackground
foreign import selectableBackgroundBorderless :: TouchableNativeBackground
foreign import ripple :: Color -> Boolean -> TouchableNativeBackground
foreign import canUseNativeForeground :: Boolean
