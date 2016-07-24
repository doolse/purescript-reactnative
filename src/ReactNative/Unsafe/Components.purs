module ReactNative.Unsafe.Components where

import React (ReactClass, ReactElement, createElement)

foreign import activityIndicatorClass        :: forall props. ReactClass props
foreign import buttonClass                   :: forall props. ReactClass props
foreign import datePickerIOSClass            :: forall props. ReactClass props
foreign import drawerLayoutAndroidClass      :: forall props. ReactClass props
foreign import imageClass                    :: forall props. ReactClass props
foreign import keyboardAvoidingViewClass     :: forall props. ReactClass props
foreign import listViewClass                 :: forall props. ReactClass props
foreign import mapViewClass                  :: forall props. ReactClass props
foreign import modalClass                    :: forall props. ReactClass props
foreign import navigatorClass                :: forall props. ReactClass props
foreign import pickerClass                   :: forall props. ReactClass props
foreign import pickerItemClass               :: forall props. ReactClass props
foreign import progressBarAndroidClass       :: forall props. ReactClass props
foreign import progressViewIOSClass          :: forall props. ReactClass props
foreign import refreshControlClass           :: forall props. ReactClass props
foreign import scrollViewClass               :: forall props. ReactClass props
foreign import segmentedControlIOSClass      :: forall props. ReactClass props
foreign import sliderClass                   :: forall props. ReactClass props
foreign import statusBarClass                :: forall props. ReactClass props
foreign import snapshotViewIOSClass          :: forall props. ReactClass props
foreign import switchClass                   :: forall props. ReactClass props
foreign import tabBarIOSClass                :: forall props. ReactClass props
foreign import tabBarIOSItemClass            :: forall props. ReactClass props
foreign import textClass                     :: forall props. ReactClass props
foreign import textInputClass                :: forall props. ReactClass props
foreign import toolbarAndroidClass           :: forall props. ReactClass props
foreign import touchableHighlightClass       :: forall props. ReactClass props
foreign import touchableNativeFeedbackClass  :: forall props. ReactClass props
foreign import touchableOpacityClass         :: forall props. ReactClass props
foreign import touchableWithoutFeedbackClass :: forall props. ReactClass props
foreign import viewClass                     :: forall props. ReactClass props
foreign import viewPagerAndroidClass         :: forall props. ReactClass props
foreign import webViewClass                  :: forall props. ReactClass props

createNoChild :: forall props. ReactClass props -> props -> ReactElement
createNoChild c p = createElement c p []

textU :: forall props. props -> Array ReactElement -> ReactElement
textU = createElement textClass

viewU :: forall props. props -> Array ReactElement -> ReactElement
viewU = createElement viewClass

imageU :: forall props. props -> Array ReactElement -> ReactElement
imageU = createElement imageClass

listViewU :: forall props. props -> ReactElement
listViewU = createNoChild listViewClass

toolbarAndroidU :: forall props. props -> Array ReactElement -> ReactElement
toolbarAndroidU = createElement toolbarAndroidClass

activityIndicatorU :: forall props. props -> ReactElement
activityIndicatorU = createNoChild activityIndicatorClass

touchableNativeFeedbackU :: forall props. props -> ReactElement -> ReactElement
touchableNativeFeedbackU p c = createElement touchableNativeFeedbackClass p [c]

touchableWithoutFeedbackU :: forall props. props -> ReactElement -> ReactElement
touchableWithoutFeedbackU p c = createElement touchableWithoutFeedbackClass p [c]

touchableHilightU :: forall props. props -> ReactElement -> ReactElement
touchableHilightU p c = createElement touchableHighlightClass p [c]

touchableOpacityU :: forall props. props -> ReactElement -> ReactElement
touchableOpacityU p c = createElement touchableOpacityClass p [c]


scrollViewU :: forall props. props -> Array ReactElement -> ReactElement
scrollViewU = createElement scrollViewClass

refreshControlU :: forall props. props -> ReactElement
refreshControlU = createNoChild refreshControlClass

switchU :: forall props. props -> ReactElement
switchU = createNoChild switchClass

drawerLayoutAndroidU :: forall props. props -> Array ReactElement -> ReactElement
drawerLayoutAndroidU = createElement drawerLayoutAndroidClass

buttonU :: forall props. props -> ReactElement
buttonU = createNoChild buttonClass

pickerU :: forall props. props -> Array ReactElement -> ReactElement
pickerU = createElement pickerClass

pickerItemU :: forall props. props -> ReactElement
pickerItemU = createNoChild pickerItemClass

sliderU :: forall props. props -> ReactElement
sliderU = createNoChild sliderClass

navigatorU :: forall props. props -> ReactElement
navigatorU = createNoChild navigatorClass

textInputU :: forall props. props -> ReactElement
textInputU = createNoChild textInputClass
