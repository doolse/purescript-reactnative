-- | See [Text](https://facebook.github.io/react-native/docs/text.html)
module ReactNative.Components.Text (
  TextProps, textElem, text', text_, text
, texts', texts, texts_
, EllipsizeMode, ellipsizeMode
) where

import React (ReactElement)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Events (LayoutEvent, TouchEvent, EventHandler)
import ReactNative.PropTypes (Prop)
import ReactNative.Styles (Styles)
import ReactNative.Unsafe.Components (textU)
import Unsafe.Coerce (unsafeCoerce)


type TextProps eff = {
    style :: Styles
  , key :: String
  , testID :: String
  , numberOfLines :: Int
  , accessible :: Boolean
  , onLayout :: EventHandler eff LayoutEvent
  , onPress :: EventHandler eff TouchEvent
  , onLongPress :: EventHandler eff TouchEvent
  , selectable :: Boolean
  , ellipsizeMode :: EllipsizeMode
  , ios:: Prop {
      adjustsFontSizeToFit :: Boolean
    , allowFontScaling :: Boolean
    , minimumFontScale :: Number
    , suppressHilighting :: Boolean
  }
}

textElem :: String -> ReactElement
textElem = unsafeCoerce

text' :: forall eff. Prop (TextProps eff) -> String -> ReactElement
text' p s = textU (unsafeApplyProps {} p) [textElem s]

text :: Styles -> String -> ReactElement
text style s = textU {style} [textElem s]

text_ :: String -> ReactElement
text_ s = textU {} [textElem s]

texts :: Styles -> Array ReactElement -> ReactElement
texts style = textU {style}

texts_ :: Array ReactElement -> ReactElement
texts_ = textU {}

texts' :: forall eff. Prop (TextProps eff) -> Array ReactElement -> ReactElement
texts' p = textU (unsafeApplyProps {} p)

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
