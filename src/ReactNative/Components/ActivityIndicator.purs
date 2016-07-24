module ReactNative.Components.ActivityIndicator where

import React (ReactElement)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Components.View (ViewPropsEx)
import ReactNative.PropTypes (Prop)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Unsafe.Components (activityIndicatorU)
import Unsafe.Coerce (unsafeCoerce)
import Prelude

newtype ActivityIndicatorSize = AISize String

small :: ActivityIndicatorSize
small = AISize "small"

large :: ActivityIndicatorSize
large = AISize "large"

indicatorSized :: Int -> ActivityIndicatorSize
indicatorSized = unsafeCoerce

type ActivityIndicatorProps eff = ViewPropsEx eff (
    animating :: Boolean
  , color :: Color
  , size :: ActivityIndicatorSize
) () (
  hidesWhenStopped :: Boolean
)

activityIndicator :: Boolean -> ReactElement
activityIndicator animating = activityIndicatorU {animating}

activityIndicator' :: forall eff. Prop (ActivityIndicatorProps eff) -> Boolean -> ReactElement
activityIndicator' p animating = activityIndicatorU $ unsafeApplyProps {animating} p
