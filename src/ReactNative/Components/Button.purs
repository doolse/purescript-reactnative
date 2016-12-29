-- | See [Button](https://facebook.github.io/react-native/docs/button.html)
module ReactNative.Components.Button (
  ButtonProps, button, button_, button'
) where

import React (ReactElement)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Events (TouchEvent, EventHandler)
import ReactNative.PropTypes (Prop)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Unsafe.Components (buttonU)

type ButtonProps eff = {
    accessibilityLabel :: String
  , color :: Color
  , disabled :: Boolean
  , onPress :: EventHandler eff TouchEvent
  , title :: String
}

-- | Create a button with the given `title` and `onPress` handler
button :: forall eff. String -> EventHandler eff TouchEvent -> ReactElement
button title onPress = buttonU {title, onPress}

-- | Create a button with the given `title`
button_ :: String -> ReactElement
button_ title = buttonU {title}

-- | Create a button with the given props and `title`
button' :: forall eff. Prop (ButtonProps eff) -> String -> ReactElement
button' p title = buttonU (unsafeApplyProps {title} p)
