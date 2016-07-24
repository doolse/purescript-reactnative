module ReactNative.Android.Components where

import Prelude
import Control.Monad.Eff (Eff)
import Data.Maybe (Maybe(..))
import React (ReactElement, ReactThis)
import ReactNative.Components.View (ViewPropsEx)
import ReactNative.Events (EventHandler, UnitEventHandler)
import ReactNative.Internal.Undefinable (Undefinable, toUndefinable)
import ReactNative.PropTypes (ImageSource, Prop)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Unsafe.Components (drawerLayoutAndroidU, toolbarAndroidU)
import Unsafe.Coerce (unsafeCoerce)

type ToolbarAction = {title::String, icon::Undefinable ImageSource, show::ActionShow, showWithText::Boolean}
newtype ActionShow = ActionShow String

always :: ActionShow
always = ActionShow "always"

ifRoom :: ActionShow
ifRoom = ActionShow "ifRoom"

never :: ActionShow
never = ActionShow "never"

action :: String -> ToolbarAction
action title = action' {title, icon:Nothing, show:never, showWithText:true}

action' :: {title :: String, icon :: Maybe ImageSource, show :: ActionShow, showWithText :: Boolean} -> ToolbarAction
action' p = p {icon = toUndefinable p.icon }

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

toolbarAndroid' :: forall eff. Prop (ToolbarAndroidProp eff) -> Array ReactElement -> ReactElement
toolbarAndroid' p = toolbarAndroidU (p $ unsafeCoerce {})

foreign import dpLeft :: DrawerPosition
foreign import dpRight :: DrawerPosition

foreign import data DrawerPosition :: *

drawerPosition :: { left :: DrawerPosition
, right :: DrawerPosition
}
drawerPosition = {
    left: dpLeft
  , right: dpRight
}

newtype DrawerLockMode = DLMode String
drawerLockMode :: { unlocked :: DrawerLockMode
, lockedClosed :: DrawerLockMode
, lockedOpen :: DrawerLockMode
}
drawerLockMode = {
    unlocked : DLMode "unlocked"
  , lockedClosed : DLMode "locked-closed"
  , lockedOpen : DLMode "locked-open"
}
newtype DrawerKeyboardDismissMode = DKDMode String
keyboardDismissMode :: { none :: DrawerKeyboardDismissMode
, onDrag :: DrawerKeyboardDismissMode
}
keyboardDismissMode = {
    none: DKDMode "none"
  , onDrag: DKDMode "on-drag"
}

type DrawerLayoutProps eff = {
    ref :: String
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

foreign import openDrawer :: forall p s eff. ReactThis p s -> Eff eff Unit
foreign import closeDrawer :: forall p s eff. ReactThis p s -> Eff eff Unit

drawerLayoutAndroid' :: forall eff. Prop (DrawerLayoutProps eff) -> Int -> DrawerPosition -> (Unit -> ReactElement) -> Array ReactElement -> ReactElement
drawerLayoutAndroid' p drawerWidth dp renderNavigationView =
  drawerLayoutAndroidU (unsafeApplyProps {drawerWidth, drawerPosition:dp, renderNavigationView} p)
