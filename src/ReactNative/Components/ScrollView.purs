-- | See [ScrollView](https://facebook.github.io/react-native/docs/scrollview.html)
module ReactNative.Components.ScrollView (
  scrollView', scrollView_, scrollView, scrollTo, scrollTo'
, Scrollable, DecelerationRate, IndicatorStyle, SnapToAlignment
, KeyboardDismissMode, KeyboardShouldPersistTaps, OverScrollModeType
, ContentInsetAdjustmentBehavior
, keyboardDismissMode, decelerationRate, decelerateBy, indicatorStyle
, snapToAlignment, keyboardShouldPersistTaps, overScrollModeType, contentInsetAdjustmentBehavior
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
import Type.Data.Boolean (kind Boolean)
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
    onRefresh :: UnitEventHandler  -- TODO: needs to be checked
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

newtype OverScrollModeType = OverScrollModeType String
overScrollModeType :: {
    auto :: OverScrollModeType
  , always :: OverScrollModeType
  , never :: OverScrollModeType
}
overScrollModeType = {
    auto: OverScrollModeType "auto"
  , always: OverScrollModeType "always"
  , never: OverScrollModeType "never"
}

newtype ContentInsetAdjustmentBehavior = ContentInsetAdjustmentBehavior String
contentInsetAdjustmentBehavior :: {
    automatic :: ContentInsetAdjustmentBehavior
  , scrollableAxes :: ContentInsetAdjustmentBehavior
  , never :: ContentInsetAdjustmentBehavior
  , always :: ContentInsetAdjustmentBehavior
}
contentInsetAdjustmentBehavior = {
    automatic: ContentInsetAdjustmentBehavior "automatic"
  , scrollableAxes: ContentInsetAdjustmentBehavior "scrollableAxes"
  , never: ContentInsetAdjustmentBehavior "never"
  , always: ContentInsetAdjustmentBehavior "always"
}

type ScrollViewPropsEx r = ViewPropsEx' Scrollable (
    contentContainerStyle :: Styles
  , horizontal :: Boolean
  , keyboardDismissMode :: KeyboardDismissMode
  , keyboardShouldPersistTaps :: KeyboardShouldPersistTaps
  , onContentSizeChange :: EventHandler2 Number Number
  , onMomentumScrollBegin :: UnitEventHandler
  , onMomentumScrollEnd :: UnitEventHandler
  , onScroll :: EventHandler ScrollEvent
  , onScrollBeginDrag :: UnitEventHandler
  , onScrollEndDrag :: UnitEventHandler
  , pagingEnabled :: Boolean
  , refreshControl :: RefreshControl
  , removeClippedSubviews :: Boolean
  , scrollEnabled :: Boolean
  , showsHorizontalScrollIndicator :: Boolean
  , showsVerticalScrollIndicator :: Boolean
  , stickyHeaderIndices :: Array Number
  | r
) ScrollViewAndroid ScrollViewIOS

type ScrollViewAndroid =  (
    endFillColor :: Color
  , nestedScrollEnabled :: Boolean
  , overScrollMode :: OverScrollModeType
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
  , contentInsetAdjustmentBehavior :: ContentInsetAdjustmentBehavior
  , contentOffset :: {x::Number, y::Number}
  , decelerationRate :: DecelerationRate
  , directionalLockEnabled :: Boolean
  , sendUpdatedChildFrames :: Boolean
  , indicatorStyle :: IndicatorStyle
  , maximumZoomScale :: Number
  , minimumZoomScale :: Number
  , onScrollAnimationEnd :: UnitEventHandler
  , pinchGestureEnabled :: Boolean
  , scrollEventThrottle :: Number
  , scrollIndicatorInsets :: Insets
  , scrollsToTop :: Boolean
  , snapToAlignment :: SnapToAlignment
  , snapToInterval :: Number
  , zoomScale :: Number
)

newtype Scrollable = Scrollable (forall props state. ReactThis props state)

foreign import scrollToImpl :: Fn2 {x:: Int, y :: Int, animated :: Boolean} Scrollable (Effect Unit)

scrollTo' :: { x :: Int, y :: Int, animated :: Boolean } -> Scrollable -> Effect Unit
scrollTo' = runFn2 scrollToImpl

scrollTo :: {x::Int, y::Int} -> Scrollable -> Effect Unit
scrollTo {x,y} = scrollTo' {x,y,animated:true}
