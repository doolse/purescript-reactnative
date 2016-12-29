-- | See [Picker](https://facebook.github.io/react-native/docs/picker.html)
module ReactNative.Components.Picker (
  PickerProps, PickerMode, PickerItem, picker, picker', pickerItem
, class PickerType
) where

import Prelude
import React (ReactElement)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Components.View (ViewPropsEx)
import ReactNative.Events (EventHandler)
import ReactNative.PropTypes (Prop)
import ReactNative.Styles (Styles)
import ReactNative.Unsafe.Components (pickerItemU, pickerU)
import Unsafe.Coerce (unsafeCoerce)

type PickerProps a eff = ViewPropsEx eff (
    onValueChange :: EventHandler eff {itemValue :: a, itemPosition :: Int}
  , selectedValue :: a
) (
    enabled :: Boolean
  , mode :: PickerMode
  , prompt :: String
) (
  itemStyle :: Styles
)

picker :: forall a eff. PickerType a => a -> EventHandler eff {itemValue :: a, itemPosition :: Int} -> Array PickerItem -> ReactElement
picker selectedValue onValueChange items = pickerU {selectedValue, onValueChange} (unsafeCoerce items)

picker' :: forall a eff. PickerType a => Prop (PickerProps a eff) -> Array PickerItem -> ReactElement
picker' p items = pickerU (unsafeApplyProps {} p) $ unsafeCoerce items

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
