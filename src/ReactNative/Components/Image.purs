-- | See [Image](https://facebook.github.io/react-native/docs/image.html)
module ReactNative.Components.Image (
  ImageProps, backgroundImage, backgroundImage', image_, image, image'
, ResizeMethod, resize, scale, ImageProgressEvent
) where

import Prelude
import React (ReactElement)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Components (styleOnly)
import ReactNative.Events (LayoutEvent, UnitEventHandler, EventHandler)
import ReactNative.PropTypes (class AutoEnum, ImageSource, Prop)
import ReactNative.Styles (ResizeMode, Styles)
import ReactNative.Unsafe.Components (imageU)

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

-- | Create a background image with give styles and source
-- |
-- | Background images are simply normal images with children overalayed ontop
backgroundImage :: Styles -> ImageSource -> Array ReactElement -> ReactElement
backgroundImage = backgroundImage' <<< styleOnly

-- | Create a background image with props and source
-- |
-- | Background images are simply normal images with children overalayed ontop
backgroundImage' :: forall eff. Prop (ImageProps eff) -> ImageSource -> Array ReactElement -> ReactElement
backgroundImage' p source = imageU (unsafeApplyProps {source} p)

-- | Create an Image from source only
image_ :: ImageSource -> ReactElement
image_ source = imageU {source} []

-- | Create an Image with styles and source only
image :: Styles -> ImageSource -> ReactElement
image style source = imageU {style, source} []

-- | Create an Image with props and source
image' :: forall eff. Prop (ImageProps eff) -> ImageSource -> ReactElement
image' p source = imageU (unsafeApplyProps {source} p) []

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
