-- | See [SafeAreaView](https://facebook.github.io/react-native/docs/safeareaview.html)
module ReactNative.Components.SafeAreaView (
  safeAreaView', safeAreaView_, safeAreaView
) where

import Prelude

import React (ReactElement)
import ReactNative.Components.View (ViewPropsEx)
import ReactNative.Optional (class Optional)
import ReactNative.Styles (Styles)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Unsafe.Components (safeAreaViewU)

type SafeAreaViewPropsO eff = ViewPropsEx eff () () ()

-- | Create a SafeAreaView with only children
safeAreaView_ :: Array ReactElement -> ReactElement
safeAreaView_ = safeAreaViewU {}

-- | Create a SafeAreaView with the given styles and children
safeAreaView :: Styles -> Array ReactElement -> ReactElement
safeAreaView style = safeAreaViewU {style}

-- | Create a SafeAreaView with the given props and children
safeAreaView' :: forall eff o
  .  Optional o (SafeAreaViewPropsO eff)
  => {|o} -> Array ReactElement -> ReactElement
safeAreaView' = safeAreaViewU <<< unsafeApplyProps
