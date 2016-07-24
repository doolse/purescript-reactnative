module ReactNative.Components.Switch where

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

switch :: forall eff. {onValueChange::EventHandler eff Boolean, value :: Boolean} -> ReactElement
switch = switchU

switch' :: forall eff. Prop (SwitchProps eff) -> {onValueChange::EventHandler eff Boolean, value :: Boolean} -> ReactElement
switch' p d = switchU (unsafeApplyProps d p)
