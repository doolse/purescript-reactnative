module ReactNative.Android.API where

import Prelude
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, runEffectFn2)

foreign import backAndroidAddListener :: EffectFn2 String (EffectFn1 Unit Boolean) Unit
foreign import exitApp :: Int -> Effect Unit

addBackEventCallback :: EffectFn1 Unit Boolean -> Effect Unit
addBackEventCallback = runEffectFn2 backAndroidAddListener "hardwareBackPress"
