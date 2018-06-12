module ReactNative.Android.Components (
  ToolbarAction
, ActionShow, always, ifRoom, never
, action, action'
, toolbarAndroid'
, DrawerPosition, drawerPosition
, DrawerLockMode, drawerLockMode
, DrawerKeyboardDismissMode, keyboardDismissMode
, DrawerLayoutRef(..)
, drawerLayoutAndroid'
, openDrawer
, closeDrawer
) where

import Prelude
import Effect (Effect)
import Data.Maybe (Maybe(..))
import ReactNative.Optional (class Optional)
import React (ReactElement, ReactThis)
import ReactNative.Components.View (ViewPropsEx)
import ReactNative.Events (EventHandler, UnitEventHandler)
import ReactNative.Internal.Undefinable (Undefinable, toUndefinable)
import ReactNative.PropTypes (ImageSource, RefType)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Unsafe.Components (drawerLayoutAndroidU, toolbarAndroidU)

type ToolbarAndroidPropO = ViewPropsEx (
    actions :: Array ToolbarAction
  , navIcon :: ImageSource
  , onIconClicked :: UnitEventHandler
  , onActionSelected :: EventHandler Int
  , title :: String
  , titleColor :: Color
  , contentInsetEnd :: Int
  , contentInsetStart :: Int
  , logo :: ImageSource
  , overflowIcon :: ImageSource
  , rtl :: Boolean
  , subtitle :: String
  , subtitleColor :: Color
) () ()

-- | Create a [ToolbarAndroid](https://facebook.github.io/react-native/docs/toolbarandroid.html) component
toolbarAndroid' :: forall o
  .  Optional o ToolbarAndroidPropO
  => {|o} -> Array ReactElement -> ReactElement
toolbarAndroid' = toolbarAndroidU <<< unsafeApplyProps

action :: String -> ToolbarAction
action title = action' {title, icon:Nothing, show:never, showWithText:true}

action' :: {title :: String, icon :: Maybe ImageSource, show :: ActionShow, showWithText :: Boolean} -> ToolbarAction
action' p = p {icon = toUndefinable p.icon }

type ToolbarAction = {title::String, icon::Undefinable ImageSource, show::ActionShow, showWithText::Boolean}
newtype ActionShow = ActionShow String

always :: ActionShow
always = ActionShow "always"

ifRoom :: ActionShow
ifRoom = ActionShow "ifRoom"

never :: ActionShow
never = ActionShow "never"


foreign import dpLeft :: DrawerPosition
foreign import dpRight :: DrawerPosition

foreign import data DrawerPosition :: Type

drawerPosition :: {
    left :: DrawerPosition
  , right :: DrawerPosition
}
drawerPosition = {
    left: dpLeft
  , right: dpRight
}

newtype DrawerLockMode = DLMode String
drawerLockMode :: {
    unlocked :: DrawerLockMode
  , lockedClosed :: DrawerLockMode
  , lockedOpen :: DrawerLockMode
}
drawerLockMode = {
    unlocked : DLMode "unlocked"
  , lockedClosed : DLMode "locked-closed"
  , lockedOpen : DLMode "locked-open"
}
newtype DrawerKeyboardDismissMode = DKDMode String
keyboardDismissMode :: {
    none :: DrawerKeyboardDismissMode
  , onDrag :: DrawerKeyboardDismissMode
}
keyboardDismissMode = {
    none: DKDMode "none"
  , onDrag: DKDMode "on-drag"
}

type DrawerLayoutProps o = {
    drawerWidth :: Int
  , drawerPosition :: DrawerPosition
  , renderNavigationView :: Unit -> ReactElement
  | o
}

type DrawerLayoutPropsO = (
    ref :: RefType DrawerLayoutRef
  , drawerBackgroundColor :: Color
  , drawerLockMode :: DrawerLockMode
  , keyboardDismissMode :: DrawerKeyboardDismissMode
  , onDrawerClose :: EventHandler Unit
  , onDrawerOpen :: EventHandler Unit
  , onDrawerSlide :: EventHandler Unit
  , onDrawerStateChanged :: EventHandler Unit
  , statusBarBackgroundColor :: Color
)

newtype DrawerLayoutRef = DrawerLayoutRef (forall p s. ReactThis p s)

-- | Create a [DrawerLayoutAndroid](https://facebook.github.io/react-native/docs/drawerlayoutandroid.html) component
drawerLayoutAndroid' :: forall o
  .  Optional o DrawerLayoutPropsO
  => DrawerLayoutProps o
  -> Array ReactElement
  -> ReactElement
drawerLayoutAndroid' = drawerLayoutAndroidU <<< unsafeApplyProps

foreign import openDrawer :: DrawerLayoutRef -> Effect Unit
foreign import closeDrawer :: DrawerLayoutRef -> Effect Unit
