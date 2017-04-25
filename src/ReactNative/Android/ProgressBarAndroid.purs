module ReactNative.Android.Components.ProgressBarAndroid (
    progressBarAndroid', progressBarAndroid, progressBarAndroid_
  , StyleAttr, horizontal, normal, small, large, inverse, smallInverse, largeInverse
  ) where
import Data.Record.Class (class Subrow)
import Prelude
import React (ReactElement)
import ReactNative.Components (BaseProps)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps2)
import ReactNative.Unsafe.Components (progressBarAndroidU)

newtype StyleAttr = StyleAttr String


horizontal :: StyleAttr
horizontal = StyleAttr "Horizontal"

normal :: StyleAttr
normal = StyleAttr "Normal"

small :: StyleAttr
small = StyleAttr "Small"

large :: StyleAttr
large = StyleAttr "Large"

inverse :: StyleAttr
inverse = StyleAttr "Inverse"

smallInverse :: StyleAttr
smallInverse = StyleAttr "SmallInverse"

largeInverse :: StyleAttr
largeInverse = StyleAttr "LargeInverse"

type ProgressBarAndroidPropsO = BaseProps (
    color :: Color
  , indeterminate :: Boolean
  , progress :: Number
  , styleAttr :: StyleAttr
)

-- | Warning will appear due to bug in react-native: https://github.com/facebook/react-native/pull/11791
progressBarAndroid' :: forall o
  .  Subrow o ProgressBarAndroidPropsO
  => {|o} -> ReactElement
progressBarAndroid' = progressBarAndroidU <<< unsafeApplyProps2

progressBarAndroid_ :: ReactElement
progressBarAndroid_ = progressBarAndroidU {}

-- | Will create a horizontal loading bar
progressBarAndroid :: Number -> ReactElement
progressBarAndroid n = progressBarAndroidU {styleAttr: horizontal, indeterminate: false, progress: n}
