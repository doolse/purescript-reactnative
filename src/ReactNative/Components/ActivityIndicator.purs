-- | See [ActivityIndicator](https://facebook.github.io/react-native/docs/activityindicator.html)
module ReactNative.Components.ActivityIndicator (
  ActivityIndicatorSize, small, large, indicatorSized
, activityIndicator, activityIndicator'
)
where

import Prelude
import Data.Record.Class (class Subrow)
import React (ReactElement)
import ReactNative.Components.View (ViewPropsEx2)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Unsafe.Components (activityIndicatorU)
import Unsafe.Coerce (unsafeCoerce)


type ActivityIndicatorProps r = {
  animating :: Boolean
  | r
}

type ActivityIndicatorPropsO eff = ViewPropsEx2 eff (
    color :: Color
  , size :: ActivityIndicatorSize
) () (
  hidesWhenStopped :: Boolean
)

-- | Create an ActivityIndicator with just the `animating` flag
activityIndicator :: Boolean -> ReactElement
activityIndicator animating = activityIndicatorU {animating}

-- | Create an ActivityIndicator with props and the `animating` flag
activityIndicator' :: forall eff o
  .  Subrow o (ActivityIndicatorPropsO eff)
  => ActivityIndicatorProps o -> ReactElement
activityIndicator' = activityIndicatorU <<< unsafeApplyProps

newtype ActivityIndicatorSize = AISize String

small :: ActivityIndicatorSize
small = AISize "small"

large :: ActivityIndicatorSize
large = AISize "large"

indicatorSized :: Int -> ActivityIndicatorSize
indicatorSized = unsafeCoerce
