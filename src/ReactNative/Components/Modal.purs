module ReactNative.Components.Modal (
    AnimationType
  , OnRequestClose
  , Orientation
  , ModalProps
  , animationType
  , modal'
  , modal_
  , modal
) where

import Prelude
import React (ReactElement)
import ReactNative.Events (EventHandler, UnitEventHandler)
import ReactNative.PropTypes (Prop)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
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

type ModalProps a eff = {
    animationType :: AnimationType
  , onShow :: UnitEventHandler eff
  , transparent :: Boolean
  , visible :: Boolean
  , android :: Prop {
      hardwareAccelerated :: Boolean
    , onRequestClose :: OnRequestClose eff
  }
  , ios :: Prop {
      onOrientationChange :: EventHandler eff Orientation
    , supportedOrientations :: Array Orientation
  }
}

modal' :: forall a eff. Prop (ModalProps a eff) -> Array ReactElement -> ReactElement
modal' p = modalU $ unsafeApplyProps {} p

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
