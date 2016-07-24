module ReactNative.Events where

import Data.Function.Eff (EffFn1, EffFn2)
import Prelude (Unit)

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
    contentOffset :: {x::Int, y::Int}
  }
}

type EventHandler eff a = EffFn1 eff a Unit

type EventHandler2 eff a b = EffFn2 eff a b Unit

type UnitEventHandler eff = EffFn1 eff Unit Unit
