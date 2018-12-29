-- | See [Text](https://facebook.github.io/react-native/docs/text.html)
module ReactNative.Components.Text (
  textElem, text', text_, text
, texts', texts, texts_
, EllipsizeMode, TextBreakStrategy, ellipsizeMode, textBreakStrategy
) where

import Ansi.Codes (Color)
import React (ReactElement)
import ReactNative.Components (BaseProps)
import ReactNative.Events (LayoutEvent, TouchEvent, EventHandler)
import ReactNative.Optional (class Optional)
import ReactNative.PropTypes (Insets)
import ReactNative.Styles (Styles)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Unsafe.Components (textU)
import Type.Data.Boolean (kind Boolean)  --TODO: needs to check further
import Unsafe.Coerce (unsafeCoerce)

newtype TextBreakStrategy = TextBreakStrategy String
textBreakStrategy :: {
    simple :: TextBreakStrategy
  , highQuality :: TextBreakStrategy
  , balanced :: TextBreakStrategy
}
textBreakStrategy = {
    simple: TextBreakStrategy "simple"
  , highQuality: TextBreakStrategy "highQuality"
  , balanced: TextBreakStrategy "balanced"
}

type TextPropsO = BaseProps (
    style :: Styles
  , numberOfLines :: Int
  , accessible :: Boolean
  , accessibilityHint :: String
  -- , accessibilityLabel :: Node --TODO: needs to check further
  , disabled :: Boolean
  , nativeID :: String
  , numberOfLines :: Number
  , onLayout :: EventHandler LayoutEvent
  , onPress :: EventHandler TouchEvent
  , onLongPress :: EventHandler TouchEvent
  , pressRetentionOffset :: Insets
  , selectable :: Boolean
  , testID :: String
  , ellipsizeMode :: EllipsizeMode
  , ios:: {
      adjustsFontSizeToFit :: Boolean
    , allowFontScaling :: Boolean
    , minimumFontScale :: Number
    , suppressHilighting :: Boolean
  }
  , android:: {
      selectionColor :: Color
    , textBreakStrategy :: TextBreakStrategy
  }
)

textElem :: String -> ReactElement
textElem = unsafeCoerce

text' :: forall o
  .  Optional o TextPropsO
  => {|o} -> String -> ReactElement
text' p s = textU (unsafeApplyProps p) [textElem s]

text :: Styles -> String -> ReactElement
text style s = textU {style} [textElem s]

text_ :: String -> ReactElement
text_ s = textU {} [textElem s]

texts :: Styles -> Array ReactElement -> ReactElement
texts style = textU {style}

texts_ :: Array ReactElement -> ReactElement
texts_ = textU {}

texts' :: forall o
  .  Optional o TextPropsO
  => {|o} -> Array ReactElement -> ReactElement
texts' p = textU (unsafeApplyProps p)

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
