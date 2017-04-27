-- | See [ScrollView](https://facebook.github.io/react-native/docs/scrollview.html)
module ReactNative.Components.ScrollView (
  scrollView', scrollView_, scrollView, scrollTo, scrollTo'
, Scrollable, DecelerationRate, IndicatorStyle, SnapToAlignment
, KeyboardDismissMode, KeyboardShouldPersistTaps
, keyboardDismissMode, decelerationRate, decelerateBy, indicatorStyle
, snapToAlignment, keyboardShouldPersistTaps
, ScrollViewPropsEx, ScrollViewAndroid, ScrollViewIOS
, RefreshControl, RefreshControlSize
, refreshControl, refreshControl', refreshControlSize
)
where

import Prelude
import Control.Monad.Eff (Eff)
import Data.Function.Uncurried (Fn2, runFn2)
import Data.Record.Class (class Subrow)
import React (ReactElement, ReactThis)
import ReactNative.Components.View (ViewPropsEx)
import ReactNative.Events (EventHandler2, ScrollEvent, UnitEventHandler, EventHandler)
import ReactNative.PropTypes (Insets)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Styles (Styles)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Unsafe.Components (refreshControlU, scrollViewU)
import Unsafe.Coerce (unsafeCoerce)

type ScrollViewPropsO eff = ScrollViewPropsEx eff ()

scrollView' :: forall eff o
  .  Subrow o (ScrollViewPropsO eff)
  => {|o} -> Array ReactElement -> ReactElement
scrollView' = scrollViewU <<< unsafeApplyProps

scrollView_ :: Array ReactElement -> ReactElement
scrollView_ = scrollViewU {}

scrollView :: Styles -> Array ReactElement -> ReactElement
scrollView style = scrollViewU {style}

type RefreshProps eff r = {
    onRefresh :: UnitEventHandler eff
  , refreshing :: Boolean
  | r
}

type RefreshPropsO eff = (
    onRefresh :: UnitEventHandler eff
  , refreshing :: Boolean
  , android :: {
      colors :: Array Color
    , enabled :: Boolean
    , progressBackgroundColor :: Color
    , progressViewOffset :: Number
    , size :: RefreshControlSize
  }
  , ios :: {
      tintColor :: Color
    , title :: String
    , titleColor :: Color
  }
)

refreshControl :: forall eff. UnitEventHandler eff -> Boolean -> RefreshControl
refreshControl onRefresh refreshing = RefreshControl $ refreshControlU {onRefresh, refreshing}

refreshControl' :: forall eff o
  .  Subrow o (RefreshPropsO eff)
  => {|o} -> RefreshControl
refreshControl' = RefreshControl <<< refreshControlU <<< unsafeApplyProps

newtype RefreshControl = RefreshControl ReactElement

foreign import data RefreshControlSize :: Type

foreign import rcSizeImpl :: String -> RefreshControlSize

refreshControlSize :: {
    default :: RefreshControlSize
  , large :: RefreshControlSize
}
refreshControlSize = {
    default: rcSizeImpl "DEFAULT"
  , large: rcSizeImpl "LARGE"
}

newtype KeyboardDismissMode = KeyboardDismissMode String
keyboardDismissMode :: {
    none :: KeyboardDismissMode
  , interactive :: KeyboardDismissMode
  , onDrag :: KeyboardDismissMode
}
keyboardDismissMode = {
    none: KeyboardDismissMode "none"
  , interactive: KeyboardDismissMode "interactive"
  , onDrag: KeyboardDismissMode "on-drag"
}

newtype DecelerationRate = DecelerationRate String
decelerationRate :: { fast :: DecelerationRate
, normal :: DecelerationRate
}
decelerationRate = {
    fast: DecelerationRate "fast"
  , normal: DecelerationRate "normal"
}
decelerateBy :: Number -> DecelerationRate
decelerateBy = unsafeCoerce

newtype IndicatorStyle = IndicatorStyle String

indicatorStyle :: {
    default :: IndicatorStyle
  , black :: IndicatorStyle
  , white :: IndicatorStyle
}
indicatorStyle = {
    default: IndicatorStyle "default"
  , black: IndicatorStyle "black"
  , white: IndicatorStyle "white"
}

newtype SnapToAlignment = SnapToAlignment String
snapToAlignment :: {
    start :: SnapToAlignment
  , center :: SnapToAlignment
  , end :: SnapToAlignment
}
snapToAlignment = {
    start: SnapToAlignment "start"
  , center: SnapToAlignment "center"
  , end: SnapToAlignment "end"
}

newtype KeyboardShouldPersistTaps = KeyboardShouldPersistTaps String
keyboardShouldPersistTaps :: {
    always :: KeyboardShouldPersistTaps
  , never :: KeyboardShouldPersistTaps
  , handled :: KeyboardShouldPersistTaps
}
keyboardShouldPersistTaps = {
    always: KeyboardShouldPersistTaps "always"
  , never: KeyboardShouldPersistTaps "never"
  , handled: KeyboardShouldPersistTaps "handled"
}

type ScrollViewPropsEx eff r = ViewPropsEx eff (
    contentContainerStyle :: Styles
  , horizontal :: Boolean
  , keyboardDismissMode :: KeyboardDismissMode
  , keyboardShouldPersistTaps :: KeyboardShouldPersistTaps
  , onContentSizeChange :: EventHandler2 eff Number Number
  , onScroll :: EventHandler eff ScrollEvent
  , pagingEnabled :: Boolean
  , refreshControl :: RefreshControl
  , scrollEnabled :: Boolean
  , showsHorizontalScrollIndicator :: Boolean
  , showsVerticalScrollIndicator :: Boolean
  | r
) ScrollViewAndroid (ScrollViewIOS eff)

type ScrollViewAndroid =  (
    endFillColor :: Color
  , scrollPerfTag :: String
)

type ScrollViewIOS eff = (
    alwaysBounceHorizontal :: Boolean
  , alwaysBounceVertical :: Boolean
  , automaticallyAdjustContentInsets :: Boolean
  , bounces :: Boolean
  , bouncesZoom :: Boolean
  , canCancelContentTouches :: Boolean
  , centerContent :: Boolean
  , contentInset :: Insets
  , contentOffset :: {x::Number, y::Number}
  , decelerationRate :: DecelerationRate
  , directionalLockEnabled :: Boolean
  , indicatorStyle :: IndicatorStyle
  , maximumZoomScale :: Number
  , minimumZoomScale :: Number
  , onScrollAnimationEnd :: UnitEventHandler eff
  , scrollEventThrottle :: Number
  , scrollIndicatorInsets :: Insets
  , scrollsToTop :: Boolean
  , snapToAlignment :: SnapToAlignment
  , snapToInterval :: Number
  , stickyHeaderIndices :: Array Number
  , zoomScale :: Number
)

newtype Scrollable = Scrollable (forall props state. ReactThis props state)

foreign import scrollToImpl :: forall eff. Fn2 {x:: Int, y :: Int, animated :: Boolean} Scrollable (Eff eff Unit)

scrollTo' :: forall eff. { x :: Int, y :: Int, animated :: Boolean } -> Scrollable -> Eff eff Unit
scrollTo' = runFn2 scrollToImpl

scrollTo :: forall eff. {x::Int, y::Int} -> Scrollable -> Eff eff Unit
scrollTo {x,y} = scrollTo' {x,y,animated:true}
