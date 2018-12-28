-- | See [Picker](https://facebook.github.io/react-native/docs/picker.html)
module ReactNative.Components.Picker (
  PickerProps, PickerMode, PickerItem, picker, picker', pickerItem
, class PickerType
) where

import Prelude

import React (ReactElement)
import ReactNative.Components.View (ViewPropsEx)
import ReactNative.Events (EventHandler)
import ReactNative.Optional (class Optional)
import ReactNative.Styles (Styles)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Unsafe.Components (pickerItemU, pickerU)
import Unsafe.Coerce (unsafeCoerce)

type PickerProps a = ViewPropsEx (
    onValueChange :: EventHandler a
  , selectedValue :: a
  -- , style :: pickerStyleType  TODO: needs to be checked
  , testID :: String

) (
    enabled :: Boolean
  , mode :: PickerMode
  , prompt :: String
) (
  itemStyle :: Styles
)

picker :: forall a. PickerType a => a -> EventHandler a -> Array PickerItem -> ReactElement
picker selectedValue onValueChange items = pickerU {selectedValue, onValueChange} (unsafeCoerce items)

picker' :: forall a o
  .  PickerType a
  => Optional o (PickerProps a)
  => {|o} -> Array PickerItem -> ReactElement
picker' p items = pickerU (unsafeApplyProps p) $ unsafeCoerce items

pickerItem :: forall a. PickerType a => String -> a -> PickerItem
pickerItem label value = PickerItem $ pickerItemU {label,value}

newtype PickerItem = PickerItem ReactElement
class PickerType a

instance intPicker :: PickerType Int
instance stringPicker :: PickerType String

newtype PickerMode = PickerMode String

pickerMode :: {
    dialog :: PickerMode
  , dropdown :: PickerMode
}
pickerMode = {
    dialog: PickerMode "dialog"
  , dropdown: PickerMode "dropdown"
}
