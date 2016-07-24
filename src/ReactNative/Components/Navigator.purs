module ReactNative.Components.Navigator where

import Prelude
import Control.Monad.Eff (Eff)
import Data.Function.Uncurried (Fn2, mkFn2)
import React (ReactElement, ReactState, ReactThis, ReadWrite)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Events (UnitEventHandler)
import ReactNative.PropTypes (Prop, RefType)
import ReactNative.Styles (Styles)
import ReactNative.Unsafe.Components (navigatorU)

foreign import sceneConfigEnum :: String -> SceneConfig

newtype Navigator r = Navigator (forall props state. ReactThis props state)
foreign import data SceneConfig :: *
foreign import data RouteStack :: *
newtype SceneRenderer r = SceneRenderer (Fn2 r (Navigator r) ReactElement)
newtype SceneConfigurer r = SceneConfigurer (Fn2 r RouteStack SceneConfig)

type NavigatorProps r eff = {
    ref :: RefType (Navigator r)
  , configureScene :: SceneConfigurer r
  , initialRoute :: r
  , initialRouteStack :: Array r
  , navigationBar :: ReactElement
  , navigator :: ReactElement
  , onDidFocus :: UnitEventHandler eff
  , onWillFocus :: UnitEventHandler eff
  , renderScene :: SceneRenderer r
  , sceneStyle :: Styles
  , style :: Styles
}

sceneConfig' :: forall r. (r -> RouteStack -> SceneConfig) -> SceneConfigurer r
sceneConfig' = SceneConfigurer <<< mkFn2

sceneConfig :: forall r. SceneConfig -> SceneConfigurer r
sceneConfig c = sceneConfig' \_ _ -> c

sceneConfigs :: { pushFromRight :: SceneConfig
, fadeAndroid :: SceneConfig
}
sceneConfigs = {
    pushFromRight: sceneConfigEnum "PushFromRight"
  , fadeAndroid: sceneConfigEnum "FadeAndroid"
--   Navigator.SceneConfigs.PushFromRight (default)
-- Navigator.SceneConfigs.FloatFromRight
-- Navigator.SceneConfigs.FloatFromLeft
-- Navigator.SceneConfigs.FloatFromBottom
-- Navigator.SceneConfigs.FloatFromBottomAndroid
-- Navigator.SceneConfigs.SwipeFromLeft
-- Navigator.SceneConfigs.HorizontalSwipeJump
-- Navigator.SceneConfigs.HorizontalSwipeJumpFromRight
-- Navigator.SceneConfigs.HorizontalSwipeJumpFromLeft
-- Navigator.SceneConfigs.VerticalUpSwipeJump
-- Navigator.SceneConfigs.VerticalDownSwipeJump
}

sceneRenderer :: forall r. (r -> Navigator r -> ReactElement) -> SceneRenderer r
sceneRenderer = SceneRenderer <<< mkFn2

navigator' :: forall r eff. Prop (NavigatorProps r eff) -> r -> SceneRenderer r -> ReactElement
navigator' p initialRoute renderScene = navigatorU $ unsafeApplyProps {initialRoute, renderScene} p

foreign import getCurrentRoutes :: forall r. Navigator r -> Array r

foreign import push :: forall r eff. Navigator r -> r -> Eff (state::ReactState ReadWrite|eff) Unit

foreign import pop :: forall r eff. Navigator r -> Eff (state::ReactState ReadWrite|eff) Unit
