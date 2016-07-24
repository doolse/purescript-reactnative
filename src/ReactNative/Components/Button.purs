module ReactNative.Components.Button where

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

button :: forall eff. String -> EventHandler eff TouchEvent -> ReactElement
button title onPress = buttonU {title, onPress}

button_ :: String -> ReactElement
button_ title = buttonU {title}

button' :: forall eff. Prop (ButtonProps eff) -> String -> ReactElement
button' p title = buttonU (unsafeApplyProps {title} p)
