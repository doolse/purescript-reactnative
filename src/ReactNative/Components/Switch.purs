-- | See [Switch](https://facebook.github.io/react-native/docs/switch.html)
module ReactNative.Components.Switch (
  switch'
) where

import Data.Record.Class (class Subrow)
import React (ReactElement)
import ReactNative.Components (BaseProps)
import ReactNative.Events (EventHandler)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps2)
import ReactNative.Unsafe.Components (switchU)
import Prelude

type SwitchProps eff r = {
    onValueChange :: EventHandler eff Boolean
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
switch' :: forall eff o
  .  Subrow o SwitchPropsO
  => SwitchProps eff o -> ReactElement
switch' = switchU <<< unsafeApplyProps2
