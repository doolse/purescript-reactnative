module ReactNative.Components where

import ReactNative.Styles (Styles)

styleOnly :: forall r. Styles -> {style::Styles|r} -> {style::Styles|r}
styleOnly style = _ {style=style}
