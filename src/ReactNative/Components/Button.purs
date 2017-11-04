-- | See [Button](https://facebook.github.io/react-native/docs/button.html)
module ReactNative.Components.Button (
  button, button_, button'
) where

import ReactNative.Optional (class Optional)
import React (ReactElement)
import ReactNative.Events (TouchEvent, EventHandler)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Unsafe.Components (buttonU)
import Prelude

type ButtonPropsO eff = (
    accessibilityLabel :: String
  , color :: Color
  , disabled :: Boolean
  , onPress :: EventHandler eff TouchEvent
  , title :: String
)

-- | Create a button with the given `title` and `onPress` handler
button :: forall eff. String -> EventHandler eff TouchEvent -> ReactElement
button title onPress = buttonU {title, onPress}

-- | Create a button with the given `title`
button_ :: String -> ReactElement
button_ title = buttonU {title}

-- | Create a button with the given props and `title`
button' :: forall o eff. Optional o (ButtonPropsO eff) => {|o} -> ReactElement
button' = buttonU <<< unsafeApplyProps
