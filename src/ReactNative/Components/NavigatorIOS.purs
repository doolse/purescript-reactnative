-- | See [NavigatorIOS](https://facebook.github.io/react-native/docs/navigatorios.html)
module ReactNative.Components.NavigatorIOS (
    NavigatorIOS, navigatorIOS', NavigatorIOSProps
  , push, pop, Route, RouteM, RouteO, RouteDefaults, mkRoute
) where

import Prelude
import Control.Monad.Eff (Eff, kind Effect)
import Data.Record.Class (class Subrow)
import React (ReactElement, ReactState, ReactThis, ReadWrite)
import ReactNative.Events (UnitEventHandler)
import ReactNative.PropTypes (ImageSource, RefType)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Styles (Styles)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Unsafe.Components (navigatorIOSU)
import Unsafe.Coerce (unsafeCoerce)

newtype NavigatorIOS = NavigatorIOS (forall props state. ReactThis props state)

type RouteDefaults r = (
    barTintColor :: Color
  , navigationBarHidden :: Boolean
  , shadowHidden :: Boolean
  , tintColor :: Color
  , titleTextColor :: Color
  , translucent :: Boolean
  | r
)

foreign import data Route :: # Effect -> Type

type RouteM props o = {
    title :: String
  , component :: { navigator :: NavigatorIOS | props } -> ReactElement
  , passProps :: {|props}
  | o
}

type RouteO eff = RouteDefaults (
    titleImage :: ImageSource
  , backButtonIcon :: ImageSource
  , backButtonTitle :: String
  , leftButtonIcon :: ImageSource
  , leftButtonTitle :: String
  , leftButtonSystemIcon :: String -- Object.keys(SystemIcons)
  , onLeftButtonPress :: UnitEventHandler eff
  , rightButtonIcon :: ImageSource
  , rightButtonTitle :: String
  , rightButtonSystemIcon :: String -- Object.keys(SystemIcons)
  , onRightButtonPress :: UnitEventHandler eff
  , wrapperStyle :: Styles
)

type NavigatorIOSProps o eff = {
  initialRoute :: Route eff
  | o
}

type NavigatorIOSPropsO = RouteDefaults (
    ref :: RefType NavigatorIOS
  , interactivePopGestureEnabled :: Boolean
  , itemWrapperStyle :: Styles
  , style :: Styles
)

mkRoute :: forall props eff o
  .  Subrow o (RouteO eff)
  => RouteM props o -> Route eff
mkRoute = unsafeCoerce

-- | Create a NavigatorIOS with the given props and initialRoute
navigatorIOS' :: forall o eff
  .  Subrow o NavigatorIOSPropsO
  => NavigatorIOSProps o eff -> ReactElement
navigatorIOS' = navigatorIOSU <<< unsafeApplyProps

foreign import push :: forall eff. NavigatorIOS -> Route eff -> Eff (state::ReactState ReadWrite|eff) Unit

foreign import pop :: forall eff. NavigatorIOS -> Eff (state::ReactState ReadWrite|eff) Unit
