module ReactNative.PropTypes where

import Control.Monad.Eff.Uncurried (EffFn1)
import Data.Nullable (Nullable)
import Data.Unit (Unit)
import Unsafe.Coerce (unsafeCoerce)

-- | The type for passing in properties to Components.
-- | Unfortunately at the moment the only way to specify a subset of
-- | all properties is to use [record update syntax](https://github.com/purescript/documentation/blob/master/language/Records.md)
-- |
-- | It is hoped that in the future [Row constraints](https://github.com/purescript/purescript/issues/469) will replace the need for this
type Prop a = a -> a

-- | A type representing the source of an [image](https://facebook.github.io/react-native/docs/images.html)
-- |
-- | Unfortunately the purescript compiler currently cannot generate `require("./image.png")` calls directly, so
-- | currently you will need to use FFI code:
-- |
-- | `Images.purs`
-- | ``` purescript
-- | module Images where
-- | foreign import myImage :: ImageSource
-- | ```
-- | 
-- | `Images.js`
-- | ``` javascript
-- | exports.myImage = require("myimage.png");
-- | ```
foreign import data ImageSource :: Type

-- | Create an ImageSource from a URI string
uriSrc :: String -> ImageSource
uriSrc uri = unsafeCoerce {uri}

-- | Create an ImageSource from a URI with a specified width and height
uriSrc' :: {uri::String, width:: Int, height:: Int} -> ImageSource
uriSrc' = unsafeCoerce

-- | Create an ImageSource from an Array of ImageSource's
urisSrc :: Array ImageSource -> ImageSource
urisSrc = unsafeCoerce

-- | Data type representing the ["ref" attribute](https://facebook.github.io/react/docs/refs-and-the-dom.html)
foreign import data RefType :: Type -> Type

-- | Provide a named ref which will be accessible using `React.getRefs`
-- | Facebook say they are deprecating the use of named refs.
unsafeRef :: forall a. String -> RefType a
unsafeRef = unsafeCoerce

-- | Creates a RefType from an effectful function.
refFunc :: forall eff ref. EffFn1 eff (Nullable ref) Unit -> RefType ref
refFunc = unsafeCoerce

type Insets = {top:: Number, left:: Number, bottom:: Number, right:: Number}

foreign import nativeImageSource :: {android::String, width::Int, height::Int } -> ImageSource

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
