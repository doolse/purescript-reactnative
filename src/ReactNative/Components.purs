module ReactNative.Components where

import ReactNative.Optional (class Optional)
import Unsafe.Coerce (unsafeCoerce)

type BaseProps r = (
    key :: String
  , testID :: String
  | r
)

iosProps :: forall o r. Optional o r => {|o} -> {|r}
iosProps = unsafeCoerce

androidProps :: forall o r. Optional o r => {|o} -> {|r}
androidProps = unsafeCoerce
