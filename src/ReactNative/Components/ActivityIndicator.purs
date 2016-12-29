-- | See [ActivityIndicator](https://facebook.github.io/react-native/docs/activityindicator.html)
module ReactNative.Components.ActivityIndicator (
  ActivityIndicatorSize, small, large, indicatorSized
, ActivityIndicatorProps, activityIndicator, activityIndicator'
)
where

import React (ReactElement)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Components.View (ViewPropsEx)
import ReactNative.PropTypes (Prop)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Unsafe.Components (activityIndicatorU)
import Unsafe.Coerce (unsafeCoerce)
import Prelude

type ActivityIndicatorProps eff = ViewPropsEx eff (
    animating :: Boolean
  , color :: Color
  , size :: ActivityIndicatorSize
) () (
  hidesWhenStopped :: Boolean
)

-- | Create an ActivityIndicator with just the `animating` flag
activityIndicator :: Boolean -> ReactElement
activityIndicator animating = activityIndicatorU {animating}

-- | Create an ActivityIndicator with props and the `animating` flag
activityIndicator' :: forall eff. Prop (ActivityIndicatorProps eff) -> Boolean -> ReactElement
activityIndicator' p animating = activityIndicatorU $ unsafeApplyProps {animating} p

newtype ActivityIndicatorSize = AISize String

small :: ActivityIndicatorSize
small = AISize "small"

large :: ActivityIndicatorSize
large = AISize "large"

indicatorSized :: Int -> ActivityIndicatorSize
indicatorSized = unsafeCoerce
