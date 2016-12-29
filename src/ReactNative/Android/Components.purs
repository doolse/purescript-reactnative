module ReactNative.Android.Components (
  ToolbarAction
, ToolbarAndroidProp
, ActionShow, always, ifRoom, never
, action, action'
, toolbarAndroid'
, DrawerPosition, drawerPosition
, DrawerLockMode, drawerLockMode
, DrawerKeyboardDismissMode, keyboardDismissMode
, DrawerLayoutProps, DrawerLayoutRef(..)
, drawerLayoutAndroid'
, openDrawer
, closeDrawer
) where

import Prelude
import Control.Monad.Eff (Eff)
import Data.Maybe (Maybe(..))
import React (ReactElement, ReactThis)
import ReactNative.Components.View (ViewPropsEx)
import ReactNative.Events (EventHandler, UnitEventHandler)
import ReactNative.Internal.Undefinable (Undefinable, toUndefinable)
import ReactNative.PropTypes (ImageSource, Prop, RefType)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Unsafe.Components (drawerLayoutAndroidU, toolbarAndroidU)
import Unsafe.Coerce (unsafeCoerce)

type ToolbarAndroidProp eff = ViewPropsEx eff (
    actions :: Array ToolbarAction
  , navIcon :: ImageSource
  , onIconClicked :: UnitEventHandler eff
  , onActionSelected :: EventHandler eff Int
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
toolbarAndroid' :: forall eff. Prop (ToolbarAndroidProp eff) -> Array ReactElement -> ReactElement
toolbarAndroid' p = toolbarAndroidU (p $ unsafeCoerce {})

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

foreign import data DrawerPosition :: *

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

type DrawerLayoutProps eff = {
    ref :: RefType DrawerLayoutRef
  , drawerWidth :: Int
  , drawerPosition :: DrawerPosition
  , drawerBackgroundColor :: Color
  , drawerLockMode :: DrawerLockMode
  , keyboardDismissMode :: DrawerKeyboardDismissMode
  , onDrawerClose :: EventHandler eff Unit
  , onDrawerOpen :: EventHandler eff Unit
  , onDrawerSlide :: EventHandler eff Unit
  , onDrawerStateChanged :: EventHandler eff Unit
  , renderNavigationView :: Unit -> ReactElement
  , statusBarBackgroundColor :: Color
}

newtype DrawerLayoutRef = DrawerLayoutRef (forall p s. ReactThis p s)

-- | Create a [DrawerLayoutAndroid](https://facebook.github.io/react-native/docs/drawerlayoutandroid.html) component
drawerLayoutAndroid' :: forall eff.
     Prop (DrawerLayoutProps eff)
  -> {drawerWidth :: Int, drawerPosition :: DrawerPosition, renderNavigationView :: Unit -> ReactElement}
  -> Array ReactElement
  -> ReactElement
drawerLayoutAndroid' p {drawerWidth,drawerPosition:dp,renderNavigationView} =
  drawerLayoutAndroidU (unsafeApplyProps {drawerWidth, drawerPosition:dp, renderNavigationView} p)

foreign import openDrawer :: forall eff. DrawerLayoutRef -> Eff eff Unit
foreign import closeDrawer :: forall eff. DrawerLayoutRef -> Eff eff Unit
