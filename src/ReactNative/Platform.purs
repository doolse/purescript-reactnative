module ReactNative.Platform where

data Platform = Android | IOS

foreign import platformVersion :: Int
foreign import platformOSImpl :: String

platformOS :: Platform
platformOS = case platformOSImpl of
  "ios" -> IOS
  _ -> Android

foreign import platformSelect :: forall a. {ios::a, android::a} -> a
