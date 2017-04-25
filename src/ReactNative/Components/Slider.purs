-- | See [Slider](https://facebook.github.io/react-native/docs/slider.html)
module ReactNative.Components.Slider (
  slider, slider', class SliderType
) where

import Prelude
import Data.Record.Class (class Subrow)
import React (ReactElement)
import ReactNative.Components.View (ViewPropsEx2)
import ReactNative.Events (EventHandler)
import ReactNative.PropTypes (ImageSource)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps2)
import ReactNative.Unsafe.Components (sliderU)

type SliderPropsO a eff = ViewPropsEx2 eff (
    disabled :: Boolean
  , maximumValue :: a
  , minimumValue :: a
  , onSlidingComplete :: EventHandler eff a
  , onValueChange :: EventHandler eff a
  , step :: a
  , value :: a
) () (
    maximumTrackImage :: ImageSource
  , maximumTrackTintColor :: Color
  , minimumTrackImage :: ImageSource
  , minimumTrackTintColor :: Color
  , thumbImage :: ImageSource
  , trackImage :: ImageSource
)

-- | Create a slider with min, max, step, value and onSlidingComplete
slider :: forall a eff. SliderType a => {minimumValue::a, maximumValue::a, step::a, value::a, onSlidingComplete::EventHandler eff a} -> ReactElement
slider = sliderU

-- | Create a slider using props
slider' :: forall a eff o
  .  SliderType a
  => Subrow o (SliderPropsO a eff)
  => {|o} -> ReactElement
slider' = sliderU <<< unsafeApplyProps2

class SliderType a

instance intSlider :: SliderType Int
instance numberSlider :: SliderType Number
