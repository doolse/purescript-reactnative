-- | See [Slider](https://facebook.github.io/react-native/docs/slider.html)
module ReactNative.Components.Slider (
  slider, slider', class SliderType
) where

import Prelude

import React (ReactElement)
import ReactNative.Components.View (ViewPropsEx)
import ReactNative.Events (EventHandler)
import ReactNative.Optional (class Optional)
import ReactNative.PropTypes (ImageSource)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Unsafe.Components (sliderU)

type SliderPropsO a = ViewPropsEx (
    disabled :: Boolean
  , maximumValue :: a
  , minimumValue :: a
  , onSlidingComplete :: EventHandler a
  , onValueChange :: EventHandler a
  , step :: a
  , testID :: String
  , value :: a
) (
    thumbTintColor :: Color
) (
    maximumTrackImage :: ImageSource
  , maximumTrackTintColor :: Color
  , minimumTrackImage :: ImageSource
  , minimumTrackTintColor :: Color
  , thumbImage :: ImageSource
  , trackImage :: ImageSource
)

-- | Create a slider with min, max, step, value and onSlidingComplete
slider :: forall a. SliderType a => {minimumValue::a, maximumValue::a, step::a, value::a, onSlidingComplete::EventHandler a} -> ReactElement
slider = sliderU

-- | Create a slider using props
slider' :: forall a o
  .  SliderType a
  => Optional o (SliderPropsO a)
  => {|o} -> ReactElement
slider' = sliderU <<< unsafeApplyProps

class SliderType a

instance intSlider :: SliderType Int
instance numberSlider :: SliderType Number
