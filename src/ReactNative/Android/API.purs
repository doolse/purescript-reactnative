module ReactNative.Android.API where

import Prelude
import Control.Monad.Eff (Eff)
import Data.Function.Eff (EffFn1, EffFn2, runEffFn2)

foreign import backAndroidAddListener :: forall eff. EffFn2 eff String (EffFn1 eff Unit Boolean) Unit
foreign import exitApp :: forall eff. Int -> Eff eff Unit

addBackEventCallback :: forall eff. EffFn1 eff Unit Boolean -> Eff eff Unit
addBackEventCallback = runEffFn2 backAndroidAddListener "hardwareBackPress"
