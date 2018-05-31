# purescript-reactnative

[![Latest release](https://pursuit.purescript.org/packages/purescript-reactnative/badge)](https://pursuit.purescript.org/packages/purescript-reactnative)
[![Travis Build](https://travis-ci.org/doolse/purescript-reactnative.svg?branch=master)](https://travis-ci.org/doolse/purescript-reactnative)

Purescript bindings for [react-native](http://facebook.github.io/react-native)

- Latest react-native version tested against 0.51
- [Movie example project](https://github.com/doolse/purescript-reactnative-example)
- `bower install purescript-reactnative --save`
- [CHANGELOG](CHANGELOG.md)

## Goals

React-native is a fast moving javascript project which is frequently released
(monthly at the time of writing). Much too fast for me to realistically keep all the
purescript bindings continually up-to-date, so the goals are:

- Keep up to date with `purescript` language releases.

- Keep the official [React Native docs](http://facebook.github.io/react-native/releases/next/docs/getting-started.html) as the best
place to go for help. This will be acheived by:
 - Using record types for property passing.
 - Use `newtype | foreign import data` + smart constructors for property types.

- Have unsafe versions of all the component functions, so if the library is
lagging behind or the component does not yet have a safe version, it's still possible to use
the library without too much hassle.

- Stay event framework agnostic. This is acheived by using `EffFnX` to model the event callbacks.
There will be additional libraries for your favourite action library - e.g. `purescript-reactnative-thermite`
I have also made a very small and simple library for dispatching react actions [purescript-dispatcher-react](http://github.com/doolse/purescript-dispatcher-react).

## Examples and Naming conventions

All component functions follow the naming convention of:

- `image` - The most common properties
- `image_` - Only mandatory properties
- `image'` - Mandatory properties and all optional properties - uses purescript row constraints to allow a single record to be passed in.
- `imageU` - Unsafe, takes any properties

Enum property types will either be accessible through functions with the name of the enum:

```purescript
newtype FlexDirection = FlexDirection String

row :: FlexDirection
row = FlexDirection "row"

rowReverse :: FlexDirection
rowReverse = FlexDirection "row-reverse"

column :: FlexDirection
column = FlexDirection "column"

columnReverse :: FlexDirection
columnReverse = FlexDirection "column-reverse"`
```
or a record which has a field for each value in the enum:

```purescript
newtype KeyboardDismissMode = KeyboardDismissMode String
keyboardDismissMode :: {
    none :: KeyboardDismissMode
  , interactive :: KeyboardDismissMode
  , onDrag :: KeyboardDismissMode
}
keyboardDismissMode = {
    none: KeyboardDismissMode "none"
  , interactive: KeyboardDismissMode "interactive"
  , onDrag: KeyboardDismissMode "on-drag"
}
```

If you want to examples check out the code in the `purescript-reactnative` port of the [Movies](https://github.com/facebook/react-native/tree/master/Examples/Movies) example
app which comes with the react-native source code.

https://github.com/doolse/purescript-reactnative-example

## Styles

Styles are defined using arrays of `StyleProp`s and you can create a stylesheet simply by creating a record which contains these styles defined with `staticStyles`:

```purescript
sheet :: { searchBar :: Styles
, searchBarInput :: Styles
, spinner :: Styles
, icon :: Styles
}
sheet = {
  searchBar: staticStyles [
    flexDirection row,
    alignItems center,
    backgroundColor $ rgbi 0xa9a9a9,
    height 56
  ],
  searchBarInput: staticStyles [
    flex 1,
    fontSize 20,
    fontWeight bold,
    color white,
    height 50,
    padding 0,
    backgroundColor transparent
  ],
  spinner: staticStyles [
    width 30,
    height 30,
    marginRight 16
  ],
  icon: staticStyles [
    width 24,
    height 24,
    marginHorizontal 8
  ]
}
```

## Platform specific code

The decision to not do anything special with the type system concerning platform specific components is because:

- a) Usually it very obvious from the component name
- b) It would be a significant amount of extra work and type signature noise and I don't think the benefits justify it.

Having said that, platform specific properties have been separated into sub properties for clarity.
For example:

```purescript
type ViewProps eff = {
    style :: Styles
    -- More platform neutral properties
  , ios :: {
        shouldRasterizeIOS :: Boolean
    },
  , android :: {
        needsOffscreenAlphaCompositing :: Boolean
    }
}
```

```purescript
import ReactNative.Components (iosProps,androidProps)

main = view' {accessible:true, android:androidProps {collapsable:true}, ios:iosProps {shouldRasterizeIOS:true} }
```

## Getting started - Hello World
This is a barebones starter "in accordance with the ancient traditions of our people" meant to parallel [the example on facebook's react-native docs.](https://facebook.github.io/react-native/docs/tutorial.html)

Firstly, install the react native cli if you don't have it already, and then start a barebones `react-native` project:
```sh
npm install -g react-native-cli
react-native init HelloWorld
```
Also add in the basic purescript project structure to the project.
```sh
cd HelloWorld
pulp init --force
```
Install purescript react native dependency:
```sh
bower install purescript-reactnative --save
```
Replace the contents of `src/Main.purs` with
```purescript
module Main where

import Prelude
import Control.Monad.Eff (Eff)
import React (ReactClass, ReactElement, Render, createClass, getProps, spec)
import ReactNative.API (REGISTER, registerComponent)
import ReactNative.Components.Text (text_)

render :: forall props state eff. Render props state ReactElement eff
render ctx = do
            _ <- getProps ctx  -- get props from context if needed
            pure(text_ "Hello World")

app :: forall p. ReactClass p
app = createClass $ spec {} render

main :: forall e. Eff (register:: REGISTER | e) Unit
main = do
  registerComponent "HelloWorld" app
```
Then from your project root, build the purescript project and output it to `index.js`
```sh
pulp build --to index.js
```
And that's it! Fire up an emulator (e.g. `android avd`) or connect a device and launch your app:
```
react-native run-android
```

## Component support table

The plan is to initially support a subset of the components fully, and provide unsafe functions for many of the others. Type safe versions of the components are created based off the react-native documentation, this table shows the current status:

|Component   | Supported|
|----------  |-------------|
|`View`      | [x] |
|`SafeAreaView`      | [x] |
|`Text`      | [x] |
|`TextInput` | [x]|
|`Switch`    | [x]|
|`Touchable*`| [x]|
|`Picker`    | [x]|
|`Slider`    | [x]|
|`ActivityIndicator` |[x]|
|`ListView`  | [x]|
|`ScrollView` | [x]|
|`Image`     |[x]|
|`RefreshControl` | [x]|
|`Button`    |[x]|
|`NavigatorIOS` |[x] *|
|`DrawerLayoutAndroid` |[x]|
|`ToolbarAndroid` |[x]|
|`Modal`|[x]|
|`ProgressBarAndroid`|[x]|
|`DatePickerIOS`|-|
|`KeyboardAvoidingView`|-|
|`MapView`|-|
|`ProgressViewIOS`|-|
|`SegmentedControlIOS`|-|
|`StatusBar`|-|
|`SnapshotViewIOS`|-|
|`TabBarIOS`|-|
|`TabBarIOSItem`|-|
|`ViewPagerAndroid`|-|
|`WebView`|-|

|API         | Version |
|------------| --------|
|`alert`     | [x]|
|`color`     | [x]|
|`ListViewDataSource` | [x]|

Anything marked with * may not have 100% coverage of API calls yet.

## Contributors

- Jolse Maginnis (`doolse@gmail.com @doolse2`)
- Jens Krause (`@sectore`)
- Nicholas Brady (`nick.brady@smartrac-group.com`)
- Don Abrams (`don.abrams@smartrac-group.com`)
- Ben Fleisch (`bfly2000@gmail.com`)
- Alexander Obi (`alexander.obi@smartrac-group.com`)
