-- | See [NavigatorIOS](https://facebook.github.io/react-native/docs/navigatorios.html)
module ReactNative.Components.NavigatorIOS (
    NavigatorIOS, navigatorIOS', NavigatorIOSProps
  , push, pop, Route, RouteDefaults, mkRoute, mkRoute'
) where

import Prelude
import Control.Monad.Eff (Eff)
import React (ReactElement, ReactState, ReactThis, ReadWrite)
import ReactNative.Events (UnitEventHandler)
import ReactNative.PropTypes (ImageSource, Prop, RefType)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Styles (Styles)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Unsafe.Components (navigatorIOSU)
import Unsafe.Coerce (unsafeCoerce)

newtype NavigatorIOS = NavigatorIOS (forall props state. ReactThis props state)

type RouteDefaults r = {
    barTintColor :: Color
  , navigationBarHidden :: Boolean
  , shadowHidden :: Boolean
  , tintColor :: Color
  , titleTextColor :: Color
  , translucent :: Boolean
  | r
}

type Route eff props = RouteDefaults (
    component :: { navigator :: NavigatorIOS | props } -> ReactElement
  , title :: String
  , titleImage :: ImageSource
  , passProps :: {|props}
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

type NavigatorIOSProps = RouteDefaults (
    ref :: RefType NavigatorIOS
  , initialRoute :: forall eff props. Route eff props
  , interactivePopGestureEnabled :: Boolean
  , itemWrapperStyle :: Styles
  , style :: Styles
)

mkRoute :: forall props eff. {title :: String, component:: { navigator :: NavigatorIOS | props } -> ReactElement, passProps :: {|props}} -> Route eff props
mkRoute = unsafeCoerce

mkRoute' :: forall props eff. {title :: String, component:: { navigator :: NavigatorIOS | props } -> ReactElement, passProps :: {|props}} -> Prop (Route eff props) -> Route eff props
mkRoute' {title,component,passProps} p = unsafeApplyProps {title,component,passProps} p

-- | Create a NavigatorIOS with the given props and initialRoute
navigatorIOS' :: forall eff props. Prop (NavigatorIOSProps) -> Route eff props -> ReactElement
navigatorIOS' p initialRoute = navigatorIOSU $ unsafeApplyProps {initialRoute} p

foreign import push :: forall eff props. NavigatorIOS -> Route eff props -> Eff (state::ReactState ReadWrite|eff) Unit

foreign import pop :: forall eff. NavigatorIOS -> Eff (state::ReactState ReadWrite|eff) Unit
