module ReactNative.API (
  alert, ALERT
, keyboardDismiss
, registerComponent, REGISTER
) where

import Control.Monad.Eff (kind Effect, Eff)
import Data.Function.Uncurried (Fn4, runFn4)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)
import Data.Unit (Unit)
import React (ReactClass)

foreign import data ALERT :: Effect

foreign import alertImpl :: forall e b o. Fn4 String (Nullable String) b o (Eff (alert::ALERT|e) Unit)


alert :: forall e. String -> Maybe String -> Eff (alert::ALERT|e) Unit
alert s ms = runFn4 alertImpl s (toNullable ms) [] {}

foreign import keyboardDismiss :: forall eff. Eff eff Unit

foreign import data REGISTER :: Effect
foreign import registerComponent :: forall e props. String -> ReactClass props -> Eff (register::REGISTER|e) Unit
