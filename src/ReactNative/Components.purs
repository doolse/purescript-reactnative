module ReactNative.Components where

import ReactNative.PropTypes (Prop)
import ReactNative.Styles (Styles)

styleOnly :: forall r. Styles -> Prop {style::Styles|r}
styleOnly style = _ {style=style}
