-- | See [Switch](https://facebook.github.io/react-native/docs/switch.html)
module ReactNative.Components.Switch (
  switch'
) where

import Prelude

import React (ReactElement)
import ReactNative.Components (BaseProps)
import ReactNative.Events (EventHandler)
import ReactNative.Optional (class Optional)
import ReactNative.PropTypes.Color (Color)
-- import ReactNative.PropTypes (TrackColor) --TODO: needs to be checked
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Unsafe.Components (switchU)

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
  -- , trackColor :: TrackColor
  , testID :: String
  , thumbColor :: Color
  , ios_backgroundColor :: Color
  , ios:: {|SwitchPropsIOS}
)

-- | Create a Switch with a value and change handler
switch' :: forall o
  .  Optional o SwitchPropsO
  => SwitchProps o -> ReactElement
switch' = switchU <<< unsafeApplyProps
