module ReactNative.API (
  alert
, keyboardDismiss
, registerComponent
) where

import Effect (Effect)
import Data.Function.Uncurried (Fn4, runFn4)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)
import Data.Unit (Unit)
import React (ReactClass)

foreign import alertImpl :: forall b o. Fn4 String (Nullable String) b o (Effect Unit)

alert :: String -> Maybe String -> Effect Unit
alert s ms = runFn4 alertImpl s (toNullable ms) [] {}

foreign import keyboardDismiss :: Effect Unit

foreign import registerComponent :: forall props. String -> ReactClass props -> Effect Unit
