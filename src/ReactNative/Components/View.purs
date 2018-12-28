-- | See [View](https://facebook.github.io/react-native/docs/view.html)
module ReactNative.Components.View (
  view', view_, view
, PointerEvents, AccessibilityType, AccessibilityLiveRegion, ImportanceForAccessibility, AccessibilityTraits
, ViewPropsEx, ViewPropsEx'
, boxOnly, none, boxNone
, traits, accessibilityTraits, accessibiltyType, accessibiltyLiveRegion
, importanceForAccessibility
) where

import Prelude

import React (ReactElement, ReactThis)
import ReactNative.Components (BaseProps)
import ReactNative.Events (LayoutEvent, TouchEvent, EventHandler)
import ReactNative.Optional (class Optional)
import ReactNative.PropTypes (class AutoEnum, class NoneEnum, RefType)
import ReactNative.Styles (Styles)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Unsafe.Components (viewU)
import Type.Data.Boolean (kind Boolean)
import Unsafe.Coerce (unsafeCoerce)

type ViewPropsO = ViewPropsEx () () ()

type ViewPropsEx r ra ri = ViewPropsEx' (forall props state. ReactThis props state) r ra ri
type ViewPropsEx' ref r ra ri =
 (
    ref :: RefType ref
  , style :: Styles
  , accessibilityHint :: String
  , accessibilityLabel :: String
  -- , accessibilityRole :: AccessibilityRole
  -- , accessibilityStates :: AccessibilityStates
  , accessible :: Boolean
  , hitSlop :: {top:: Number, left:: Number, bottom:: Number, right:: Number}
  , nativeID :: String
  , onAccessibilityTap :: EventHandler TouchEvent
  , onLayout :: EventHandler LayoutEvent
  , onMagicTap :: EventHandler TouchEvent
  , onMoveShouldSetResponder :: TouchEvent -> Boolean
  , onMoveShouldSetResponderCapture :: TouchEvent -> Boolean
  , onResponderGrant :: EventHandler TouchEvent
  , onResponderMove :: EventHandler TouchEvent
  , onResponderReject :: EventHandler TouchEvent
  , onResponderRelease :: EventHandler TouchEvent
  , onResponderTerminate :: EventHandler TouchEvent
  , onResponderTerminationRequest :: TouchEvent -> Boolean
  , onStartShouldSetResponder :: TouchEvent -> Boolean
  , onStartShouldSetResponderCapture :: TouchEvent -> Boolean
  , pointerEvents :: PointerEvents
  , removeClippedSubviews :: Boolean
  , testID :: String
  , android :: {
      accessibilityComponentType :: AccessibilityType
    , accessibilityLiveRegion :: AccessibilityLiveRegion
    , collapsable :: Boolean
    , importantForAccessibility :: ImportanceForAccessibility
    , needsOffscreenAlphaCompositing :: Boolean
    , renderToHardwareTextureAndroid :: Boolean
    | ra
  }
  , ios :: {
      accessibilityTraits :: AccessibilityTraits
    , accessibilityViewIsModal :: Boolean
    , accessibilityElementsHidden :: Boolean
    , accessibilityIgnoresInvertColors :: Boolean
    , shouldRasterizeIOS :: Boolean
    | ri
  }
  | r
)


-- | Create a View with only children
view_ :: Array ReactElement -> ReactElement
view_ = viewU {}

-- | Create a View with the given styles and children
view :: Styles -> Array ReactElement -> ReactElement
view style = viewU {style}

-- | Create a View with the given props and children
view' :: forall o
  .  Optional o (ViewPropsO)
  => {|o} -> Array ReactElement -> ReactElement
view' = viewU <<< unsafeApplyProps

newtype PointerEvents = PointerEvents String

newtype AccessibilityType = AccessibilityType String
newtype AccessibilityLiveRegion = AccessibilityLiveRegion String
newtype ImportanceForAccessibility = ImportanceForAccessibility String
newtype AccessibilityTraits = Trait String

instance alrNone :: NoneEnum AccessibilityLiveRegion where
  none = AccessibilityLiveRegion "none"

instance atNone :: NoneEnum AccessibilityType where
  none = AccessibilityType "none"

instance atraitNone :: NoneEnum AccessibilityTraits where
  none = Trait "none"

importanceForAccessibility :: {
    auto :: ImportanceForAccessibility
  , yes :: ImportanceForAccessibility
  , no :: ImportanceForAccessibility
  , noHideDescendants :: ImportanceForAccessibility
}
importanceForAccessibility = {
    auto: ImportanceForAccessibility "auto"
  , yes: ImportanceForAccessibility "yes"
  , no: ImportanceForAccessibility "no"
  , noHideDescendants: ImportanceForAccessibility "no-hide-descendants"
}

accessibiltyLiveRegion :: {
    none :: AccessibilityLiveRegion
  , polite :: AccessibilityLiveRegion
  , assertive :: AccessibilityLiveRegion
}
accessibiltyLiveRegion = {
    none: AccessibilityLiveRegion "none"
  , polite: AccessibilityLiveRegion "polite"
  , assertive: AccessibilityLiveRegion "assertive"
}

accessibiltyType :: {
    none :: AccessibilityType
  , button :: AccessibilityType
  , radiobutton_checked :: AccessibilityType
  , radiobutton_unchecked :: AccessibilityType
}
accessibiltyType = {
    none: AccessibilityType "none"
  , button: AccessibilityType "button"
  , radiobutton_checked: AccessibilityType "radiobutton_checked"
  , radiobutton_unchecked: AccessibilityType "radiobutton_unchecked"
}

accessibilityTraits :: {
    none :: AccessibilityTraits
  , button :: AccessibilityTraits
  , link :: AccessibilityTraits
  , header :: AccessibilityTraits
  , search :: AccessibilityTraits
  , image :: AccessibilityTraits
  , selected :: AccessibilityTraits
  , plays :: AccessibilityTraits
  , key :: AccessibilityTraits
  , text :: AccessibilityTraits
  , summary :: AccessibilityTraits
  , disabled :: AccessibilityTraits
  -- , frequentUpdates :: AccesaccessibilityHintsibilityTraits
  , startsMedia :: AccessibilityTraits
  , adjustable :: AccessibilityTraits
  , allowsDirectInteraction :: AccessibilityTraits
  , pageTurn :: AccessibilityTraits
}
accessibilityTraits = {
    none: Trait "none"
  , button: Trait "button"
  , link: Trait "link"
  , header: Trait "header"
  , search: Trait "search"
  , image: Trait "image"
  , selected: Trait "selected"
  , plays: Trait "plays"
  , key: Trait "key"
  , text: Trait "text"
  , summary: Trait "summary"
  , disabled: Trait "disabled"
  -- , frequentUpdates: Trait "frequentUpdates"
  , startsMedia: Trait "startsMedia"
  , adjustable: Trait "adjustable"
  , allowsDirectInteraction: Trait "allowsDirectInteraction"
  , pageTurn: Trait "pageTurn"
}

traits :: Array AccessibilityTraits -> AccessibilityTraits
traits = unsafeCoerce

boxNone :: PointerEvents
boxNone = PointerEvents "box-none"

instance autoPE :: AutoEnum PointerEvents where
  auto = PointerEvents "auto"

none :: PointerEvents
none = PointerEvents "none"

boxOnly :: PointerEvents
boxOnly = PointerEvents "box-only"
