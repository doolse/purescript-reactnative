module ReactNative.Components.Image where

import Prelude
import React (ReactElement)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Components (styleOnly)
import ReactNative.Events (LayoutEvent, UnitEventHandler, EventHandler)
import ReactNative.PropTypes (class AutoEnum, ImageSource, Prop)
import ReactNative.Styles (ResizeMode, Styles)
import ReactNative.Unsafe.Components (imageU)

newtype ResizeMethod = ResizeMethod String

instance autoRM :: AutoEnum ResizeMethod where
  auto = ResizeMethod "auto"

resize :: ResizeMethod
resize = ResizeMethod "resize"

scale :: ResizeMethod
scale = ResizeMethod "scale"

type ImageProgressEvent = {
  nativeEvent :: {
      loaded :: Number
    , total :: Number
  }
}

type ImageProps eff = {
    style :: Styles
  , onError :: UnitEventHandler eff
  , onLayout :: EventHandler eff LayoutEvent
  , onLoad :: UnitEventHandler eff
  , onLoadEnd :: UnitEventHandler eff
  , onLoadStart :: UnitEventHandler eff
  , resizeMode :: ResizeMode
  , source :: ImageSource
  , testID :: String
  , android :: Prop {
      resizeMethod :: ResizeMethod
    }
  , ios :: Prop {
      accessibilityLabel :: String
    , accessible :: Boolean
    , blurRadius :: Number
    , capInsets :: {top::Number, left::Number, bottom::Number, right::Number}
    , defaultSource :: ImageSource
    , onPartialLoad :: UnitEventHandler eff
    , onProgress :: EventHandler eff ImageProgressEvent
    }
}


backgroundImage :: Styles -> ImageSource -> Array ReactElement -> ReactElement
backgroundImage = backgroundImage' <<< styleOnly

backgroundImage' :: forall eff. Prop (ImageProps eff) -> ImageSource -> Array ReactElement -> ReactElement
backgroundImage' p source = imageU (unsafeApplyProps {source} p)

image_ :: ImageSource -> ReactElement
image_ source = imageU {source} []

image :: Styles -> ImageSource -> ReactElement
image style source = imageU {style, source} []

image' :: forall eff. Prop (ImageProps eff) -> ImageSource -> ReactElement
image' p source = imageU (unsafeApplyProps {source} p) []
