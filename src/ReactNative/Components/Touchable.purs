module ReactNative.Components.Touchable (
  TouchablePropsEx
, touchableWithoutFeedback'
, touchableOpacity', touchableHighlight, touchableHighlight'
) where

import Prelude

import Foreign.Object (Object)
import React (ReactElement)
import ReactNative.Components.View (AccessibilityTraits, AccessibilityType)
import ReactNative.Events (EventHandler, TouchEvent, LayoutEvent, UnitEventHandler)
import ReactNative.Optional (class Optional)
import ReactNative.PropTypes (Insets)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Styles (Styles)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Unsafe.Components (touchableHighlightU, touchableOpacityU, touchableWithoutFeedbackU)
import Type.Data.Boolean (kind Boolean)

type TouchablePropsEx r = (
    accessible :: Boolean
  , accessibilityComponentType :: AccessibilityType
  , accessibilityHint :: String
  -- , accessibilityLabel :: Node
  -- , accessibilityRole :: AccessibilityRole
  -- , accessibilityStates :: AccessibilityStates
  , accessibilityTraits :: AccessibilityTraits
  , delayLongPress :: Int
  , delayPressIn :: Int
  , delayPressOut :: Int
  , disabled :: Boolean
  , hitSlop :: Insets
  , onBlur :: UnitEventHandler
  , onFocus :: UnitEventHandler
  , onLayout :: EventHandler LayoutEvent
  , onPress :: EventHandler TouchEvent
  , onLongPress :: EventHandler TouchEvent
  , onPressIn :: EventHandler TouchEvent
  , onPressOut :: EventHandler TouchEvent
  , pressRetentionOffset :: Insets
  | r
)

-- | Create a [TouchableWithoutFeedback](https://facebook.github.io/react-native/docs/touchablewithoutfeedback.html) with the given props
touchableWithoutFeedback' :: forall o
  .  Optional o (TouchablePropsEx o)
  => {|o} -> ReactElement -> ReactElement
touchableWithoutFeedback' = touchableWithoutFeedbackU <<< unsafeApplyProps

type TouchableOpacityProps = TouchablePropsEx (
    activeOpacity :: Number
  , ios :: {
      hasTVPreferredFocus :: Boolean
    -- , tvParallaxProperties :: Object
  }
)
-- | Create a [TouchableOpacity](https://facebook.github.io/react-native/docs/touchableopacity.html) with the given props
touchableOpacity' :: forall o
  .  Optional o (TouchableOpacityProps)
  => {|o} -> ReactElement -> ReactElement
touchableOpacity' = touchableOpacityU <<< unsafeApplyProps

type TouchableHighlightProps = TouchablePropsEx (
    activeOpacity :: Number
  , onHideUnderlay :: EventHandler TouchEvent
  , onshowUnderlay :: EventHandler TouchEvent
  , style :: Styles
  , underlayColor :: Color
  , ios :: {
      hasTVPreferredFocus :: Boolean
    -- , tvParallaxProperties :: Object
  }
)

-- | Create a [TouchableHighlight](http://facebook.github.io/react-native/docs/touchablehighlight.html#touchablehighlight) with the given onPress handler
touchableHighlight :: EventHandler TouchEvent -> ReactElement -> ReactElement
touchableHighlight onPress = touchableHighlightU {onPress}

-- | Create a [TouchableHighlight](https://facebook.github.io/react-native/docs/touchablehilight.html) with the given props
touchableHighlight' :: forall o
  .  Optional o (TouchableHighlightProps)
  => {|o} -> ReactElement -> ReactElement
touchableHighlight' = touchableHighlightU <<< unsafeApplyProps
