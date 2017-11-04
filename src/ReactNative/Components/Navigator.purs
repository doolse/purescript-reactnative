-- | See [Navigator](https://facebook.github.io/react-native/docs/navigator.html)
module ReactNative.Components.Navigator (
  push, pop, jumpTo, jumpForward, jumpBack, replace
, Navigator, navigator'
, SceneRenderer, SceneConfigurer, sceneConfig, sceneConfig', sceneConfigs
, SceneConfig, sceneRenderer
, getCurrentRoutes
) where

import Prelude
import Control.Monad.Eff (Eff)
import Data.Function.Uncurried (Fn2, mkFn2)
import ReactNative.Optional (class Optional)
import React (ReactElement, ReactState, ReactThis, ReadWrite)
import ReactNative.Events (UnitEventHandler)
import ReactNative.PropTypes (RefType)
import ReactNative.Styles (Styles)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Unsafe.Components (navigatorU)

newtype Navigator r = Navigator (forall props state. ReactThis props state)

type NavigatorProps r o = {
    initialRoute :: r
  , renderScene :: SceneRenderer r
  | o
}

type NavigatorPropsO r eff = (
    ref :: RefType (Navigator r)
  , configureScene :: SceneConfigurer r
  , initialRouteStack :: Array r
  , navigationBar :: ReactElement
  , navigator :: ReactElement
  , onDidFocus :: UnitEventHandler eff
  , sceneStyle :: Styles
  , onWillFocus :: UnitEventHandler eff
  , style :: Styles
)

-- | Create a Navigator with the given props, initialRoute and scene renderer
navigator' :: forall r eff o
  .  Optional o (NavigatorPropsO r eff)
  => NavigatorProps r o -> ReactElement
navigator' = navigatorU <<< unsafeApplyProps

foreign import sceneConfigEnum :: String -> SceneConfig

newtype SceneRenderer r = SceneRenderer (Fn2 r (Navigator r) ReactElement)
newtype SceneConfigurer r = SceneConfigurer (Fn2 r (Array r) SceneConfig)


foreign import data SceneConfig :: Type
sceneConfig' :: forall r. (r -> Array r -> SceneConfig) -> SceneConfigurer r
sceneConfig' = SceneConfigurer <<< mkFn2

sceneConfig :: forall r. SceneConfig -> SceneConfigurer r
sceneConfig c = sceneConfig' \_ _ -> c

sceneConfigs :: {
    pushFromRight :: SceneConfig
  , fadeAndroid :: SceneConfig
  , floatFromRight :: SceneConfig
  , floatFromLeft :: SceneConfig
  , floatFromBottom :: SceneConfig
  , floatFromBottomAndroid :: SceneConfig
  , swipeFromLeft :: SceneConfig
  , horizontalSwipeJump :: SceneConfig
  , horizontalSwipeJumpFromRight :: SceneConfig
  , horizontalSwipeJumpFromLeft :: SceneConfig
  , verticalUpSwipeJump :: SceneConfig
  , verticalDownSwipeJump :: SceneConfig
}
sceneConfigs = {
    pushFromRight: sceneConfigEnum "PushFromRight"
  , fadeAndroid: sceneConfigEnum "FadeAndroid"
  , floatFromRight: sceneConfigEnum "FloatFromRight"
  , floatFromLeft: sceneConfigEnum "FloatFromLeft"
  , floatFromBottom: sceneConfigEnum "FloatFromBottom"
  , floatFromBottomAndroid: sceneConfigEnum "FloatFromBottomAndroid"
  , swipeFromLeft: sceneConfigEnum "SwipeFromLeft"
  , horizontalSwipeJump: sceneConfigEnum "HorizontalSwipeJump"
  , horizontalSwipeJumpFromRight: sceneConfigEnum "HorizontalSwipeJumpFromRight"
  , horizontalSwipeJumpFromLeft: sceneConfigEnum "HorizontalSwipeJumpFromLeft"
  , verticalUpSwipeJump: sceneConfigEnum "VerticalUpSwipeJump"
  , verticalDownSwipeJump: sceneConfigEnum "VerticalDownSwipeJump"
}

sceneRenderer :: forall r. (r -> (Navigator r) -> ReactElement) -> SceneRenderer r
sceneRenderer = SceneRenderer <<< mkFn2

foreign import getCurrentRoutes :: forall r. (Navigator r) -> Array r

foreign import push :: forall r eff. (Navigator r) -> r -> Eff (state::ReactState ReadWrite|eff) Unit

foreign import pop :: forall r eff. (Navigator r) -> Eff (state::ReactState ReadWrite|eff) Unit

foreign import jumpTo :: forall r eff. (Navigator r) -> r -> Eff (state::ReactState ReadWrite|eff) Unit

foreign import jumpForward :: forall r eff. (Navigator r) -> Eff (state::ReactState ReadWrite|eff) Unit

foreign import jumpBack :: forall r eff. (Navigator r) -> Eff (state::ReactState ReadWrite|eff) Unit

foreign import replace :: forall r eff. (Navigator r) -> r -> Eff (state::ReactState ReadWrite|eff) Unit
