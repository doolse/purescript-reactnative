module ReactNative.Android.Components.ProgressBarAndroid (
    ProgressBarAndroidProps, progressBarAndroid', progressBarAndroid, progressBarAndroid_
  , StyleAttr, horizontal, normal, small, large, inverse, smallInverse, largeInverse
  ) where
import Prelude (($))
import React (ReactElement)
import ReactNative.PropTypes (Prop)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
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

type ProgressBarAndroidProps = {
    color :: Color
  , indeterminate :: Boolean
  , progress :: Number
  , styleAttr :: StyleAttr
  , testID :: String
}

-- | Warning will appear due to bug in react-native: https://github.com/facebook/react-native/pull/11791
progressBarAndroid' :: Prop(ProgressBarAndroidProps) -> ReactElement
progressBarAndroid' p = progressBarAndroidU $ unsafeApplyProps {} p

progressBarAndroid_ :: ReactElement
progressBarAndroid_ = progressBarAndroidU {}

-- | Will create a horizontal loading bar
progressBarAndroid :: Number -> ReactElement
progressBarAndroid n = progressBarAndroidU {styleAttr: horizontal, indeterminate: false, progress: n}
