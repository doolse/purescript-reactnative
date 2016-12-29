-- | See [Slider](https://facebook.github.io/react-native/docs/slider.html)
module ReactNative.Components.Slider (
  SliderProps, slider, slider', class SliderType
) where

import React (ReactElement)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Components.View (ViewPropsEx)
import ReactNative.Events (EventHandler)
import ReactNative.PropTypes (ImageSource, Prop)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Unsafe.Components (sliderU)

type SliderProps a eff = ViewPropsEx eff (
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
slider' :: forall a eff. SliderType a => Prop (SliderProps a eff) -> ReactElement
slider' p = sliderU (unsafeApplyProps {} p)

class SliderType a

instance intSlider :: SliderType Int
instance numberSlider :: SliderType Number
