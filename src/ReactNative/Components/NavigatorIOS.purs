-- | See [NavigatorIOS](https://facebook.github.io/react-native/docs/navigatorios.html)
module ReactNative.Components.NavigatorIOS (
  NavigatorIOS, navigatorIOS', NavigatorIOSProps
) where

import Prelude
import Control.Monad.Eff (Eff)
import React (ReactElement, ReactState, ReactThis, ReadWrite)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.PropTypes (Prop, RefType)
import ReactNative.Styles (Styles)
import ReactNative.Unsafe.Components (navigatorIOSU)
import ReactNative.Components.Navigator (class NavigatorClass)
import ReactNative.PropTypes.Color (Color)

instance navigatorIOS :: NavigatorClass NavigatorIOS where
  push nav route = pushImpl nav route
  pop nav = popImpl nav

newtype NavigatorIOS = NavigatorIOS (forall props state. ReactThis props state)

type NavigatorIOSProps r = {
    ref :: RefType NavigatorIOS
  , barTintColor :: Color
  , initialRoute :: r
  , interactivePopGestureEnabled :: Boolean
  , itemWrapperStyle :: Styles
  , navigationBarHidden :: Boolean
  , shadowHidden :: Boolean
  , tintColor :: Color
  , titleTextColor :: Color
  , translucent :: Boolean
  , style :: Styles
}

-- | Create a NavigatorIOS with the given props and initialRoute
navigatorIOS' :: forall r. Prop (NavigatorIOSProps r) -> r -> ReactElement
navigatorIOS' p initialRoute = navigatorIOSU $ unsafeApplyProps {initialRoute} p

foreign import pushImpl :: forall r eff. NavigatorIOS -> r -> Eff (state::ReactState ReadWrite|eff) Unit

foreign import popImpl :: forall eff. NavigatorIOS -> Eff (state::ReactState ReadWrite|eff) Unit
