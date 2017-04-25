# 3.0.1
 - `ProgressBarAndroid` support (`@NicholasAaronBrady`)
 - Hello world example @NicholasAaronBrady

# 3.0.0

- Purescript 0.11 support (Don Abrams `@donabrams`)
- `Modal` support (`@NicholasAaronBrady`)
- Stop using RN version numbering

# 2.42.0

## Breaking change

- `keyboardShouldPersistTaps` for ScrollView is now an enum instead of a boolean (`@sectore`)

# 2.39.0

## New

- `NavigatorIOS` (Jens Krause `@sectore`)

## Breaking changes

- `exitApi` now returns an `Eff`
- Fix name of `touchableHighlight` - was `touchableHilight` (Jens Krause `@sectore`)
- Moved `touchableNativeFeedback` to it's own module and fixed it so it won't break on iOS (Jens Krause `@sectore`)

# 1.0.0

## New

- Documentation added for most styles, prop types and components
- Completed ListView and ListViewDataSource
- Add OS and select to platform module

## Breaking changes

- `BackfaceVisiblity` spelling fixed to `BackfaceVisibility`
- `urisSrc` now takes an array of ImageSource instead of the uri/height/width
- `drawerLayoutAndroid'` takes the mandatory properties as a record
- Renamed the `NativeBackground` type to `TouchableNativeBackground`
