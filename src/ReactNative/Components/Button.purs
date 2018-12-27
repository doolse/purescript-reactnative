-- | See [Button](https://facebook.github.io/react-native/docs/button.html)
module ReactNative.Components.Button (
  button, button'
) where

import ReactNative.Optional (class Optional)
import React (ReactElement)
import ReactNative.Events (TouchEvent, EventHandler)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Unsafe.Components (buttonU)
import Prelude

type ButtonProps r =
  { onPress :: EventHandler TouchEvent
  , title :: String
  | r
  }

type ButtonPropsO =
  ( accessibilityLabel :: String
  , color :: Color
  , disabled :: Boolean
  )

-- | Create a button with the given `title` and `onPress` handler
button :: String -> EventHandler TouchEvent -> ReactElement
button title onPress = buttonU {title, onPress}

-- | Create a button with the given props and `title`
button' :: forall o. Optional o ButtonPropsO => ButtonProps o -> ReactElement
button' = buttonU <<< unsafeApplyProps
