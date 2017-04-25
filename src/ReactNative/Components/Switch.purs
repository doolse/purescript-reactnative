-- | See [Switch](https://facebook.github.io/react-native/docs/switch.html)
module ReactNative.Components.Switch (
  SwitchProps, switch'
) where

import React (ReactElement)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps2)
import ReactNative.Events (EventHandler)
import ReactNative.PropTypes (Prop)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Unsafe.Components (switchU)
import Data.Record.Class (class Subrow)
type SwitchProps eff r = (
    onValueChange :: EventHandler eff Boolean
  , value :: Boolean
  | r
)

type SwitchPropsIOS = (
    onTintColor :: Color
  , thumbTintColor :: Color
  , tintColor :: Color
)

type SwitchPropsO i = (
    disabled :: Boolean
  , testID :: String
  , ios:: {|i}
)

-- | Create a Switch with a value and change handler
switch' :: forall eff o i
  .  Subrow i (SwitchPropsIOS)
  => Subrow o (SwitchPropsO i)
  => {|SwitchProps eff o} -> ReactElement
switch' p = switchU unsafeApplyProps2
