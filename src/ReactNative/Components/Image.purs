-- | See [Image](https://facebook.github.io/react-native/docs/image.html)
module ReactNative.Components.Image (
  backgroundImage, backgroundImage', image_, image, image'
, ResizeMethod, resize, scale, ImageProgressEvent
) where

import Prelude
import Data.Record.Class (class Subrow)
import React (ReactElement)
import ReactNative.Components (BaseProps)
import ReactNative.Events (LayoutEvent, UnitEventHandler, EventHandler)
import ReactNative.PropTypes (class AutoEnum, ImageSource)
import ReactNative.Styles (ResizeMode, Styles)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Unsafe.Components (imageU)

type ImageProps r = {
  source :: ImageSource
  | r
}

type ImagePropsO eff = BaseProps (
    style :: Styles
  , onError :: UnitEventHandler eff
  , onLayout :: EventHandler eff LayoutEvent
  , onLoad :: UnitEventHandler eff
  , onLoadEnd :: UnitEventHandler eff
  , onLoadStart :: UnitEventHandler eff
  , resizeMode :: ResizeMode
  , android :: {
      resizeMethod :: ResizeMethod
    }
  , ios :: {
      accessibilityLabel :: String
    , accessible :: Boolean
    , blurRadius :: Number
    , capInsets :: {top::Number, left::Number, bottom::Number, right::Number}
    , defaultSource :: ImageSource
    , onPartialLoad :: UnitEventHandler eff
    , onProgress :: EventHandler eff ImageProgressEvent
    }
)

-- | Create a background image with give styles and source
-- |
-- | Background images are simply normal images with children overalayed ontop
backgroundImage :: Styles -> ImageSource -> Array ReactElement -> ReactElement
backgroundImage style source = imageU {style, source}

-- | Create a background image with props and source
-- |
-- | Background images are simply normal images with children overalayed ontop
backgroundImage' :: forall eff o
  .  Subrow o (ImagePropsO eff)
  => ImageProps o -> Array ReactElement -> ReactElement
backgroundImage' = imageU <<< unsafeApplyProps

-- | Create an Image from source only
image_ :: ImageSource -> ReactElement
image_ source = imageU {source} []

-- | Create an Image with styles and source only
image :: Styles -> ImageSource -> ReactElement
image style source = imageU {style, source} []

-- | Create an Image with props and source
image' :: forall eff o
  .  Subrow o (ImagePropsO eff)
  => ImageProps o -> ReactElement
image' p = imageU (unsafeApplyProps p) []

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
