module ReactNative.Components.Touchable where

import Prelude
import React (ReactElement)
import ReactNative.Components.View (AccessibilityTraits, AccessibilityType)
import ReactNative.Events (EventHandler, TouchEvent, LayoutEvent)
import ReactNative.PropTypes (Prop, Insets)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Styles (Styles)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Unsafe.Components (touchableHilightU, touchableNativeFeedbackU, touchableOpacityU, touchableWithoutFeedbackU)

foreign import data NativeBackground :: *
type TouchablePropsEx eff r = {
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
}

type TouchableWithoutProps eff = TouchablePropsEx eff ()

type TouchableNativeFeedbackProps eff = TouchablePropsEx eff (
    background :: NativeBackground
  , useForeground :: Boolean
)

type TouchableOpacityProps eff = TouchablePropsEx eff (
    activeOpacity :: Number
)

type TouchableHilightProps eff = TouchablePropsEx eff (
    activeOpacity :: Number
  , onHideUnderlay :: EventHandler eff TouchEvent
  , onshowUnderlay :: EventHandler eff TouchEvent
  , style :: Styles
  , underlayColor :: Color
)

touchableNativeFeedback :: forall eff. EventHandler eff TouchEvent -> ReactElement -> ReactElement
touchableNativeFeedback onPress = touchableNativeFeedbackU {onPress}

touchableNativeFeedback' :: forall eff. Prop (TouchableNativeFeedbackProps eff) -> ReactElement -> ReactElement
touchableNativeFeedback' = touchableNativeFeedbackU <<< unsafeApplyProps {}

touchableWithoutFeedback' :: forall eff. Prop (TouchableWithoutProps eff) -> ReactElement -> ReactElement
touchableWithoutFeedback' = touchableWithoutFeedbackU <<< unsafeApplyProps {}

touchableHilight' :: forall eff. Prop (TouchableHilightProps eff) -> ReactElement -> ReactElement
touchableHilight' = touchableHilightU <<< unsafeApplyProps {}

touchableOpacity' :: forall eff. Prop (TouchableOpacityProps eff) -> ReactElement -> ReactElement
touchableOpacity' = touchableOpacityU <<< unsafeApplyProps {}

foreign import selectableBackground :: NativeBackground
foreign import selectableBackgroundBorderless :: NativeBackground
foreign import ripple :: Color -> Boolean -> NativeBackground
foreign import canUseNativeForeground :: Boolean
