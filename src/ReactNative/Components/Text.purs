-- | See [Text](https://facebook.github.io/react-native/docs/text.html)
module ReactNative.Components.Text (
  textElem, text', text_, text
, texts', texts, texts_
, EllipsizeMode, ellipsizeMode
) where

import Data.Record.Class (class Subrow)
import React (ReactElement)
import ReactNative.Components (BaseProps)
import ReactNative.Events (LayoutEvent, TouchEvent, EventHandler)
import ReactNative.Styles (Styles)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps2)
import ReactNative.Unsafe.Components (textU)
import Unsafe.Coerce (unsafeCoerce)

type TextPropsO eff = BaseProps (
    style :: Styles
  , numberOfLines :: Int
  , accessible :: Boolean
  , onLayout :: EventHandler eff LayoutEvent
  , onPress :: EventHandler eff TouchEvent
  , onLongPress :: EventHandler eff TouchEvent
  , selectable :: Boolean
  , ellipsizeMode :: EllipsizeMode
  , ios:: {
      adjustsFontSizeToFit :: Boolean
    , allowFontScaling :: Boolean
    , minimumFontScale :: Number
    , suppressHilighting :: Boolean
  }
)

textElem :: String -> ReactElement
textElem = unsafeCoerce

text' :: forall eff o
  .  Subrow o (TextPropsO eff)
  => {|o} -> String -> ReactElement
text' p s = textU (unsafeApplyProps2 p) [textElem s]

text :: Styles -> String -> ReactElement
text style s = textU {style} [textElem s]

text_ :: String -> ReactElement
text_ s = textU {} [textElem s]

texts :: Styles -> Array ReactElement -> ReactElement
texts style = textU {style}

texts_ :: Array ReactElement -> ReactElement
texts_ = textU {}

texts' :: forall eff o
  .  Subrow o (TextPropsO eff)
  => {|o} -> Array ReactElement -> ReactElement
texts' p = textU (unsafeApplyProps2 p)

newtype EllipsizeMode = EllipsizeMode String
ellipsizeMode :: {
    head :: EllipsizeMode
  , middle :: EllipsizeMode
  , tail :: EllipsizeMode
  , clip :: EllipsizeMode
}
ellipsizeMode = {
    head: EllipsizeMode "head"
  , middle: EllipsizeMode "middle"
  , tail: EllipsizeMode "tail"
  , clip: EllipsizeMode "clip"
}
