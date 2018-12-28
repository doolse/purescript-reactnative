module ReactNative.Components.Modal (
    AnimationType
  , OnRequestClose
  , Orientation
  , PresentationStyle
  , animationType
  , presentationStyle
  , modal'
  , modal_
  , modal
) where

import Prelude

import React (ReactElement)
import ReactNative.Events (EventHandler, UnitEventHandler)
import ReactNative.Optional (class Optional)
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

newtype PresentationStyle = PresentationStyle String
presentationStyle :: {
    fullScreen :: PresentationStyle
  , pageSheet :: PresentationStyle
  , formSheet :: PresentationStyle
  , overFullScreen :: PresentationStyle
}
presentationStyle = {
    fullScreen: PresentationStyle "fullScreen"
  , pageSheet: PresentationStyle "pageSheet"
  , formSheet: PresentationStyle "formSheet"
  , overFullScreen: PresentationStyle "overFullScreen"
}

type OnRequestClose = UnitEventHandler --TODO: Needs to be checked

type ModalPropsO a = (
    animationType :: AnimationType
  , onShow :: UnitEventHandler
  , transparent :: Boolean
  , visible :: Boolean
  , android :: {
      hardwareAccelerated :: Boolean
    , onRequestClose :: UnitEventHandler
  }
  , ios :: {
      onOrientationChange :: EventHandler Orientation
    , supportedOrientations :: Array Orientation
    , onDismiss :: UnitEventHandler
    , presentationStyle :: PresentationStyle
  }
)

modal' :: forall a o
  .  Optional o (ModalPropsO a)
  => {|o} -> Array ReactElement -> ReactElement
modal' = modalU <<< unsafeApplyProps

-- On request is required *for android*. Least nasty solution is to require it, and provide a default for iOS
-- https://github.com/facebook/react-native/commit/ce81f8b35af8d273072583d369594d4f5fd6d696
modal_ :: OnRequestClose -> Array ReactElement -> ReactElement
modal_ orc = modalU {onRequestClose: orc}

modalIOS_ :: Array ReactElement -> ReactElement
modalIOS_ = modalU {}

modal :: Boolean -> AnimationType -> OnRequestClose -> Array ReactElement -> ReactElement
modal v at orc = modalU {visible: v, animationType: at, onRequestClose: orc}

modalIOS :: Boolean -> AnimationType -> Array ReactElement -> ReactElement
modalIOS v at = modalU {visible: v, animationType: at}
