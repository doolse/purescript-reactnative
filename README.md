# purescript-reactnative

Purescript bindings for [react-native](http://facebook.github.io/react-native)

- [Movie example project](https://github.com/doolse/purescript-reactnative-example)
- `bower install purescript-reactnative --save`

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
I have also made a very small and simple library for dispatching react actions [purescript-react-simpelaction](http://github.com/doolse/purescript-react-simpelaction).

## Examples and Naming conventions

All component functions follow the naming convention of:

- `image` - The most common properties
- `image_` - Only mandatory properties
- `image'` - Mandatory properties and all optional properties
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
  , ios :: Prop {
        shouldRasterizeIOS :: Boolean
    },
  , android :: Prop {
        needsOffscreenAlphaCompositing :: Boolean
    }
}
```


## Component support table

The plan is to initially support a subset of the components fully, and provide unsafe functions for many of the others. Type safe versions of the components are created based off the react-native documentation, this table shows the current status:

|Component   | Version|
|----------  |-------------|
|`View`      | 0.39        |
|`Text`      | 0.39        |
|`TextInput` | 0.39|
|`Switch`    | 0.39|
|`Touchable*`| 0.39|
|`Picker`    | 0.39|
|`Slider`    | 0.39|
|`ActivityIndicator` |0.39|
|`ListView`  | 0.39|
|`ScrollView` | 0.39|
|`Image`     |0.39|
|`RefreshControl` | 0.39|
|`Button`    |0.39|
|`Navigator` |0.39 *|
|`NavigatorIOS` |0.39 *|
|`DrawerLayoutAndroid` |0.39|
|`ToolbarAndroid` |0.39|
|`DatePickerIOS`|-|
|`KeyboardAvoidingView`|-|
|`MapView`|-|
|`Modal`|-|
|`ProgressBarAndroid`|-|
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
|`alert`     | 0.39|
|`color`     | 0.39|
|`ListViewDataSource` | 0.39|
|`NavigationExpiremental` | 0.39 *|

Anything marked with * may not have 100% coverage of API calls yet.

## Contributors

Jolse Maginnis (`doolse@gmail.com @doolse2`)
Jens Krause (`@sectore`)
