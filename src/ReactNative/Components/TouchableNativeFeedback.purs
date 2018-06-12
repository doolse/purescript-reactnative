-- See [TouchableNativeFeedback](https://facebook.github.io/react-native/docs/touchablenativefeedback.html)
module ReactNative.Components.TouchableNativeFeedback (
  TouchableNativeFeedbackProps
, TouchableNativeBackground
, touchableNativeFeedback', touchableNativeFeedback
, selectableBackground, selectableBackgroundBorderless, ripple, canUseNativeForeground
) where

import Prelude
import ReactNative.Optional (class Optional)
import React (ReactElement)
import ReactNative.Components.Touchable (TouchablePropsEx)
import ReactNative.Events (EventHandler, TouchEvent)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Unsafe.Components (touchableNativeFeedbackU)

foreign import data TouchableNativeBackground :: Type
type TouchableNativeFeedbackProps = TouchablePropsEx (
    background :: TouchableNativeBackground
  , useForeground :: Boolean
)

-- | Create a TouchableNativeFeedback with the given onPress handler
touchableNativeFeedback :: EventHandler TouchEvent -> ReactElement -> ReactElement
touchableNativeFeedback onPress = touchableNativeFeedbackU {onPress}

-- | Create a TouchableNativeFeedback with the given props
touchableNativeFeedback' :: forall o
  .  Optional o TouchableNativeFeedbackProps
  => {|o} -> ReactElement -> ReactElement
touchableNativeFeedback' = touchableNativeFeedbackU <<< unsafeApplyProps

foreign import selectableBackground :: TouchableNativeBackground
foreign import selectableBackgroundBorderless :: TouchableNativeBackground
foreign import ripple :: Color -> Boolean -> TouchableNativeBackground
foreign import canUseNativeForeground :: Boolean
