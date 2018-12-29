module ReactNative.Events where

import Ansi.Codes (EraseParam(..))
import Effect.Uncurried (EffectFn1, EffectFn2)
import Prelude (Unit)
import React.SyntheticEvent (nativeEvent)

type TouchEvent = {
  nativeEvent :: {
      identifier :: Int
    , locationX :: Number
    , locationY :: Number
    , pageX :: Number
    , pageY :: Number
    , timestamp :: Int
  }
}

type LayoutEvent = {
  nativeEvent :: {
    layout :: {
        x :: Int
      , y :: Int
      , width :: Int
      , height :: Int
    }
  }
}

type TextInputEvent = {
  nativeEvent :: {
    text :: String
  }
}

type ContentSizeEvent = {
  nativeEvent :: {
    contentSize :: { width :: Int, height :: Int }
  }
}

type ScrollEvent = {
  nativeEvent :: {
    contentOffset :: {x::Number, y::Number}
  }
}

type KeyPressedEvent = {
  nativeEvent :: {
    key:: String    --TODO: Types need to be defined
  }
}

type EventHandler a = EffectFn1 a Unit

type EventHandler2 a b = EffectFn2 a b Unit

type UnitEventHandler = EffectFn1 Unit Unit
