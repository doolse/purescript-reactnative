module ReactNative.Components.Slider where

import React (ReactElement)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Components.View (ViewPropsEx)
import ReactNative.Events (EventHandler)
import ReactNative.PropTypes (ImageSource, Prop)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Unsafe.Components (sliderU)

class SliderType a

instance intSlider :: SliderType Int
instance numberSlider :: SliderType Number

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

slider :: forall a eff. SliderType a => {minimumValue::a, maximumValue::a, step::a, value::a, onSlidingComplete::EventHandler eff a} -> ReactElement
slider = sliderU

slider' :: forall a eff. SliderType a => Prop (SliderProps a eff) -> ReactElement
slider' p = sliderU (unsafeApplyProps {} p)
