module ReactNative.Components.Modal (
    AnimationType
  , OnRequestClose
  , Orientation
  , animationType
  , modal'
  , modal_
  , modal
) where

import Prelude
import Data.Record.Class (class Subrow)
import React (ReactElement)
import ReactNative.Events (EventHandler, UnitEventHandler)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps2)
import ReactNative.Unsafe.Components (modalU)

newtype AnimationType = AnimationType String
animationType :: {
    slide :: AnimationType
  , fade :: AnimationType
  , none :: AnimationType
}
animationType = {
    slide: AnimationType "slide"
  , fade: AnimationType "fade"
  , none: AnimationType "none"
}

newtype Orientation = Orientation String
orientationType :: {
    portrait :: Orientation
  , landscape :: Orientation
}
orientationType = {
    portrait: Orientation "portrait"
  , landscape: Orientation "landscape"
}

type OnRequestClose eff =  UnitEventHandler eff

type ModalPropsO a eff = (
    animationType :: AnimationType
  , onShow :: UnitEventHandler eff
  , transparent :: Boolean
  , visible :: Boolean
  , android :: {
      hardwareAccelerated :: Boolean
    , onRequestClose :: OnRequestClose eff
  }
  , ios :: {
      onOrientationChange :: EventHandler eff Orientation
    , supportedOrientations :: Array Orientation
  }
)

modal' :: forall a eff o
  .  Subrow o (ModalPropsO a eff)
  => {|o} -> Array ReactElement -> ReactElement
modal' = modalU <<< unsafeApplyProps2

-- On request is required *for android*. Least nasty solution is to require it, and provide a default for iOS
-- https://github.com/facebook/react-native/commit/ce81f8b35af8d273072583d369594d4f5fd6d696
modal_ :: forall eff. OnRequestClose eff -> Array ReactElement -> ReactElement
modal_ orc = modalU {onRequestClose: orc}

modalIOS_ :: Array ReactElement -> ReactElement
modalIOS_ = modalU {}

modal :: forall eff. Boolean -> AnimationType -> OnRequestClose eff -> Array ReactElement -> ReactElement
modal v at orc = modalU {visible: v, animationType: at, onRequestClose: orc}

modalIOS :: Boolean -> AnimationType -> Array ReactElement -> ReactElement
modalIOS v at = modalU {visible: v, animationType: at}
