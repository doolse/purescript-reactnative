-- | See [Switch](https://facebook.github.io/react-native/docs/switch.html)
module ReactNative.Components.Switch (
  switch'
) where

import ReactNative.Optional (class Optional)
import React (ReactElement)
import ReactNative.Components (BaseProps)
import ReactNative.Events (EventHandler)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Unsafe.Components (switchU)
import Prelude

type SwitchProps r = {
    onValueChange :: EventHandler Boolean
  , value :: Boolean
  | r
}

type SwitchPropsIOS = (
    onTintColor :: Color
  , thumbTintColor :: Color
  , tintColor :: Color
)

type SwitchPropsO = BaseProps (
    disabled :: Boolean
  , ios:: {|SwitchPropsIOS}
)

-- | Create a Switch with a value and change handler
switch' :: forall o
  .  Optional o SwitchPropsO
  => SwitchProps o -> ReactElement
switch' = switchU <<< unsafeApplyProps
