module ReactNative.Internal.Undefinable where

import Data.Maybe (Maybe(..))
import Unsafe.Coerce (unsafeCoerce)

foreign import data Undefinable :: * -> *

foreign import undefined :: forall a. Undefinable a
foreign import mapUndefined :: forall a b. (a -> b) -> a -> b

toUndefinable :: forall a. Maybe a -> Undefinable a
toUndefinable (Just a) = unsafeCoerce a
toUndefinable _ = undefined
