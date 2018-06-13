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

import Data.Function.Uncurried (Fn2, runFn2)
import Effect (Effect)
import React (ReactElement, ReactThis)
import ReactNative.Components.View (ViewPropsEx')
import ReactNative.Events (EventHandler2, ScrollEvent, UnitEventHandler, EventHandler)
import ReactNative.Optional (class Optional)
import ReactNative.PropTypes (Insets)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Styles (Styles)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Unsafe.Components (refreshControlU, scrollViewU)
import Unsafe.Coerce (unsafeCoerce)

type ScrollViewPropsO = ScrollViewPropsEx ()

scrollView' :: forall o
  .  Optional o ScrollViewPropsO
  => {|o} -> Array ReactElement -> ReactElement
scrollView' = scrollViewU <<< unsafeApplyProps

scrollView_ :: Array ReactElement -> ReactElement
scrollView_ = scrollViewU {}

scrollView :: Styles -> Array ReactElement -> ReactElement
scrollView style = scrollViewU {style}

type RefreshProps r = {
    onRefresh :: UnitEventHandler
  , refreshing :: Boolean
  | r
}

type RefreshPropsO = (
    onRefresh :: UnitEventHandler
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

refreshControl :: UnitEventHandler -> Boolean -> RefreshControl
refreshControl onRefresh refreshing = RefreshControl $ refreshControlU {onRefresh, refreshing}

refreshControl' :: forall o
  .  Optional o RefreshPropsO
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

type ScrollViewPropsEx r = ViewPropsEx' Scrollable (
    contentContainerStyle :: Styles
  , horizontal :: Boolean
  , keyboardDismissMode :: KeyboardDismissMode
  , keyboardShouldPersistTaps :: KeyboardShouldPersistTaps
  , onContentSizeChange :: EventHandler2 Number Number
  , onScroll :: EventHandler ScrollEvent
  , pagingEnabled :: Boolean
  , refreshControl :: RefreshControl
  , scrollEnabled :: Boolean
  , showsHorizontalScrollIndicator :: Boolean
  , showsVerticalScrollIndicator :: Boolean
  | r
) ScrollViewAndroid ScrollViewIOS

type ScrollViewAndroid =  (
    endFillColor :: Color
  , scrollPerfTag :: String
)

type ScrollViewIOS = (
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
  , onScrollAnimationEnd :: UnitEventHandler
  , scrollEventThrottle :: Number
  , scrollIndicatorInsets :: Insets
  , scrollsToTop :: Boolean
  , snapToAlignment :: SnapToAlignment
  , snapToInterval :: Number
  , stickyHeaderIndices :: Array Number
  , zoomScale :: Number
)

newtype Scrollable = Scrollable (forall props state. ReactThis props state)

foreign import scrollToImpl :: Fn2 {x:: Int, y :: Int, animated :: Boolean} Scrollable (Effect Unit)

scrollTo' :: { x :: Int, y :: Int, animated :: Boolean } -> Scrollable -> Effect Unit
scrollTo' = runFn2 scrollToImpl

scrollTo :: {x::Int, y::Int} -> Scrollable -> Effect Unit
scrollTo {x,y} = scrollTo' {x,y,animated:true}
