-- | See [TextInput](https://facebook.github.io/react-native/docs/textinput.html)
module ReactNative.Components.TextInput (
  textInput', TextInputRef
, ClearButtonMode, KeyboardAppearance, DocumentSelectionState, DataDetectorType
, AutoCapitalize, KeyboardType, ReturnKeyType
, clearButtonMode, keyboardType, dataDetectorType, autoCapitalize, keyboardAppearance
, dataDetectors, returnKeyType
, focus, isFocused, clear
) where

import Prelude
import Control.Monad.Eff (Eff)
import ReactNative.Optional (class Optional)
import React (ReactElement, ReactThis)
import ReactNative.Components.View (ViewPropsEx')
import ReactNative.Events (ContentSizeEvent, EventHandler, ScrollEvent, TextInputEvent)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Unsafe.Components (textInputU)
import Unsafe.Coerce (unsafeCoerce)

newtype TextInputRef = TextInputRef (forall p s. ReactThis p s)

type TextInputPropsO eff = ViewPropsEx' eff TextInputRef (
    autoCapitalize:: AutoCapitalize
  , autoCorrect :: Boolean
  , autoFocus :: Boolean
  , blurOnSubmit :: Boolean
  , editable :: Boolean
  , multiline :: Boolean
  , secureTextEntry :: Boolean
  , selectTextOnFocus :: Boolean
  , defaultValue :: String
  , keyboardType :: KeyboardType
  , maxLength :: Int
  , onBlur :: EventHandler eff TextInputEvent
  , onChange :: EventHandler eff TextInputEvent
  , onChangeText :: EventHandler eff String
  , onContentSizeChange :: EventHandler eff ContentSizeEvent
  , onEndEditing :: EventHandler eff TextInputEvent
  , onFocus :: EventHandler eff TextInputEvent
  , onScroll :: EventHandler eff ScrollEvent
  , onSelectionChange :: EventHandler eff TextInputEvent
  , onSubmitEditing :: EventHandler eff TextInputEvent
  , placeholder :: String
  , placeholderTextColor :: Color
  , selection :: {start:: Int, end:: Int}
  , selectionColor :: Color
  , returnKeyType :: ReturnKeyType
  , value :: String
) (
    inlineImagePadding :: Int
  , inlineImageLeft :: String
  , returnKeyLabel :: String
  , underlineColorAndroid :: Color
  , numberOfLines :: Int
) (
    clearTextOnFocus :: Boolean
  , enablesReturnKeyAutomatically :: Boolean
  , clearButtonMode :: ClearButtonMode
  , keyboardAppearance :: KeyboardAppearance
  , onKeyPress :: EventHandler eff TextInputEvent
  , selectionState :: DocumentSelectionState
  , dataDetectorTypes :: DataDetectorType
)

-- | Create a TextInput with the given props
textInput' :: forall eff o
  .  Optional o (TextInputPropsO eff)
  => {|o} -> ReactElement
textInput' = textInputU <<< unsafeApplyProps

-- | Focus the TextInput for the given ref
foreign import focus :: forall eff. TextInputRef -> Eff eff Unit
-- | See if TextInput is focussed for the given ref
foreign import isFocused :: TextInputRef -> Boolean
-- | Clear the value of the TextInput for the given ref
foreign import clear :: forall eff. TextInputRef -> Eff eff Unit

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
