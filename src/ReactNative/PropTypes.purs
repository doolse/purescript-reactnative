module ReactNative.PropTypes where

import Data.Function.Eff (EffFn1)
import Data.Nullable (Nullable)
import Data.Unit (Unit)
import Unsafe.Coerce (unsafeCoerce)

foreign import data RefType :: * -> *
foreign import data ImageSource :: *

type Prop a = a -> a

foreign import nativeImageSource :: {android::String, width::Int, height::Int } -> ImageSource

uriSrc :: String -> ImageSource
uriSrc uri = unsafeCoerce {uri}

uriSrc' :: {uri::String, width:: Int, height:: Int} -> ImageSource
uriSrc' = unsafeCoerce

urisSrc :: Array {uri::String, width:: Int, height:: Int} -> ImageSource
urisSrc = unsafeCoerce

class AutoEnum a where
  auto :: a

class NormalEnum a where
  normal :: a

class CenterEnum a where
  center :: a

class VisibilityEnum a where
  visible :: a
  hidden :: a

class NoneEnum a where
  none :: a

unsafeRef :: forall a. String -> RefType a
unsafeRef = unsafeCoerce

refFunc :: forall eff ref. EffFn1 eff (Nullable ref) Unit -> RefType ref
refFunc = unsafeCoerce

type Insets = {top:: Number, left:: Number, bottom:: Number, right:: Number}
