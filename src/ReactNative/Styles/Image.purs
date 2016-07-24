module ReactNative.Styles.Image where

import ReactNative.PropTypes.Color (Color)
import ReactNative.Styles (StyleProp, unsafeStyleProp)

-- Changes the color of all the non-transparent pixels to the tintColor.
tintColor :: Color -> StyleProp
tintColor = unsafeStyleProp "tintColor"

androidOverlayColor :: Color -> StyleProp
androidOverlayColor = unsafeStyleProp "overlayColor"
