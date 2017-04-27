module ReactNative.Components where

import Data.Record.Class (class Subrow)
import Unsafe.Coerce (unsafeCoerce)

type BaseProps r = (
    key :: String
  , testID :: String
  | r
)

iosProps :: forall o r. Subrow o r => {|o} -> {|r}
iosProps = unsafeCoerce

androidProps :: forall o r. Subrow o r => {|o} -> {|r}
androidProps = unsafeCoerce
