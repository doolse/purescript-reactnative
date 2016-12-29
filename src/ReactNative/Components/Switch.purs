-- | See [Switch](https://facebook.github.io/react-native/docs/switch.html)
module ReactNative.Components.Switch (
  SwitchProps, switch, switch'
) where

import React (ReactElement)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Events (EventHandler)
import ReactNative.PropTypes (Prop)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Unsafe.Components (switchU)


type SwitchProps eff  = {
    onValueChange :: EventHandler eff Boolean
  , value :: Boolean
  , disabled :: Boolean
  , testID :: String
  , ios:: Prop {
      onTintColor :: Color
    , thumbTintColor :: Color
    , tintColor :: Color
  }
}

-- | Create a Switch with a value and change handler
switch :: forall eff. {onValueChange::EventHandler eff Boolean, value :: Boolean} -> ReactElement
switch = switchU

-- | Create a Switch with props, a value and a change handler
switch' :: forall eff. Prop (SwitchProps eff) -> {onValueChange::EventHandler eff Boolean, value :: Boolean} -> ReactElement
switch' p d = switchU (unsafeApplyProps d p)
