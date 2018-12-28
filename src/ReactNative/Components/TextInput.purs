-- | See [TextInput](https://facebook.github.io/react-native/docs/textinput.html)
module ReactNative.Components.TextInput (
  textInput', TextInputRef
, ClearButtonMode, KeyboardAppearance, DocumentSelectionState, DataDetectorType
, AutoCapitalize, KeyboardType, ReturnKeyType, TextBreakStrategy
, clearButtonMode, keyboardType, dataDetectorType, autoCapitalize, keyboardAppearance
, dataDetectors, returnKeyType
, focus, isFocused, clear, textBreakStrategy
) where

import Prelude

import Effect (Effect)
import React (ReactElement, ReactThis)
import ReactNative.Components.View (ViewPropsEx')
import ReactNative.Events (ContentSizeEvent, EventHandler, ScrollEvent, TextInputEvent, LayoutEvent, KeyPressedEvent)
import ReactNative.Optional (class Optional)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Unsafe.Components (textInputU)
import Type.Data.Boolean (kind Boolean)
import Unsafe.Coerce (unsafeCoerce)

newtype TextInputRef = TextInputRef (forall p s. ReactThis p s)

newtype TextBreakStrategy = TextBreakStrategy String
textBreakStrategy :: {
    simple :: TextBreakStrategy
  , highQuality :: TextBreakStrategy
  , balanced :: TextBreakStrategy
}
textBreakStrategy = {
    simple: TextBreakStrategy "simple"
  , highQuality: TextBreakStrategy "highQuality"
  , balanced: TextBreakStrategy "balanced"
}

type TextInputPropsO = ViewPropsEx' TextInputRef (
    autoCapitalize:: AutoCapitalize
  , autoCorrect :: Boolean
  , autoFocus :: Boolean
  , allowFontScaling :: Boolean
  , blurOnSubmit :: Boolean
  , caretHidden :: Boolean
  , contextMenuHidden :: Boolean
  , editable :: Boolean
  , multiline :: Boolean
  , secureTextEntry :: Boolean
  , selectTextOnFocus :: Boolean
  , defaultValue :: String
  , keyboardType :: KeyboardType
  , maxLength :: Int
  , onBlur :: EventHandler TextInputEvent
  , onChange :: EventHandler TextInputEvent
  , onChangeText :: EventHandler String
  , onContentSizeChange :: EventHandler ContentSizeEvent
  , onEndEditing :: EventHandler TextInputEvent
  , onFocus :: EventHandler TextInputEvent
  , onKeyPress :: EventHandler KeyPressedEvent
  , onLayout :: EventHandler LayoutEvent
  , onScroll :: EventHandler ScrollEvent
  , onSelectionChange :: EventHandler TextInputEvent
  , onSubmitEditing :: EventHandler TextInputEvent
  , placeholder :: String
  , placeholderTextColor :: Color
  , selection :: {start:: Int, end:: Int}
  , selectionColor :: Color
  , secureTextEntry :: Boolean
  , selectTextOnFocus :: Boolean
  , returnKeyType :: ReturnKeyType
  , value :: String
) (
    disableFullscreenUI :: Boolean
  , inlineImagePadding :: Int
  , inlineImageLeft :: String
  , returnKeyLabel :: String
  , underlineColorAndroid :: Color
  , numberOfLines :: Int
  , textBreakStrategy :: TextBreakStrategy
) (
    clearTextOnFocus :: Boolean
  , enablesReturnKeyAutomatically :: Boolean
  , clearButtonMode :: ClearButtonMode
  , keyboardAppearance :: KeyboardAppearance
  , onKeyPress :: EventHandler TextInputEvent
  , selectionState :: DocumentSelectionState
  , spellCheck :: Boolean
  , scrollEnabled :: Boolean
  , dataDetectorTypes :: DataDetectorType
)

-- | Create a TextInput with the given props
textInput' :: forall o
  .  Optional o (TextInputPropsO)
  => {|o} -> ReactElement
textInput' = textInputU <<< unsafeApplyProps

-- | Focus the TextInput for the given ref
foreign import focus :: TextInputRef -> Effect Unit
-- | See if TextInput is focussed for the given ref
foreign import isFocused :: TextInputRef -> Boolean
-- | Clear the value of the TextInput for the given ref
foreign import clear :: TextInputRef -> Effect Unit

foreign import data DocumentSelectionState :: Type


newtype KeyboardType = KeyboardType String

keyboardType :: {
    default :: KeyboardType
  , numeric :: KeyboardType
  , emailAddress :: KeyboardType
  , phonePad :: KeyboardType
  , asciiCapable :: KeyboardType
  , numbersAndPunctuation :: KeyboardType
  , url :: KeyboardType
  , numberPad :: KeyboardType
  , namePhonePad :: KeyboardType
  , decimalPad :: KeyboardType
  , twitter :: KeyboardType
  , webSearch :: KeyboardType
}
keyboardType = {
    default: KeyboardType "default"
  , numeric: KeyboardType "numeric"
  , emailAddress: KeyboardType "email-address"
  , phonePad: KeyboardType "phone-pad"
  , asciiCapable: KeyboardType "ascii-capable"
  , numbersAndPunctuation: KeyboardType "numbers-and-punctuation"
  , url: KeyboardType "url"
  , numberPad: KeyboardType "number-pad"
  , namePhonePad: KeyboardType "name-phone-pad"
  , decimalPad: KeyboardType "decimal-pad"
  , twitter: KeyboardType "twitter"
  , webSearch: KeyboardType "web-search"
}

newtype AutoCapitalize = AutoCapitalize String
autoCapitalize :: {
    none :: AutoCapitalize
  , sentences :: AutoCapitalize
  , words :: AutoCapitalize
  , characters :: AutoCapitalize
}
autoCapitalize = {
    none: AutoCapitalize "none"
  , sentences: AutoCapitalize "sentences"
  , words: AutoCapitalize "words"
  , characters: AutoCapitalize "characters"
}

newtype ReturnKeyType = ReturnKeyType String

returnKeyType :: {
    done :: ReturnKeyType
  , go :: ReturnKeyType
  , next :: ReturnKeyType
  , search :: ReturnKeyType
  , send :: ReturnKeyType
  , android :: { none :: ReturnKeyType
               , previous :: ReturnKeyType
               }
  , ios :: { default :: ReturnKeyType
           , emergencyCall :: ReturnKeyType
           , google :: ReturnKeyType
           , join :: ReturnKeyType
           , route :: ReturnKeyType
           , yahoo :: ReturnKeyType
           }
}
returnKeyType = {
    done: ReturnKeyType "done"
  , go: ReturnKeyType "go"
  , next: ReturnKeyType "next"
  , search: ReturnKeyType "search"
  , send: ReturnKeyType "send"
  , android: {
      none: ReturnKeyType "none"
    , previous: ReturnKeyType "previous"
  }
  , ios: {
      default: ReturnKeyType "default"
    , emergencyCall: ReturnKeyType "emergency-call"
    , google: ReturnKeyType "google"
    , join: ReturnKeyType "join"
    , route: ReturnKeyType "route"
    , yahoo: ReturnKeyType "yahoo"
  }
}

newtype ClearButtonMode = ClearButtonMode String

clearButtonMode :: {
    never :: ClearButtonMode
  , whileEditing :: ClearButtonMode
  , unlessEditing :: ClearButtonMode
  , always :: ClearButtonMode
}
clearButtonMode = {
    never: ClearButtonMode "never"
  , whileEditing: ClearButtonMode "while-editing"
  , unlessEditing: ClearButtonMode "unless-editing"
  , always: ClearButtonMode "always"
}

newtype KeyboardAppearance = KeyboardAppearance String

keyboardAppearance :: {
    default :: KeyboardAppearance
  , light :: KeyboardAppearance
  , dark :: KeyboardAppearance
}
keyboardAppearance = {
    default: KeyboardAppearance "default"
  , light: KeyboardAppearance "light"
  , dark: KeyboardAppearance "dark"
}

newtype DataDetectorType = DataDetectorType String

dataDetectorType :: {
    phoneNumber :: DataDetectorType
  , link :: DataDetectorType
  , address :: DataDetectorType
  , calendarEvent :: DataDetectorType
  , none :: DataDetectorType
  , all :: DataDetectorType
}
dataDetectorType = {
    phoneNumber: DataDetectorType "phoneNumber"
  , link: DataDetectorType "link"
  , address: DataDetectorType "address"
  , calendarEvent: DataDetectorType "calendarEvent"
  , none: DataDetectorType "none"
  , all: DataDetectorType "all"
}

dataDetectors :: Array DataDetectorType -> DataDetectorType
dataDetectors = unsafeCoerce
