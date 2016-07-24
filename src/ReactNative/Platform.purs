module ReactNative.Platform where

data Platform = Android | IOS

foreign import platformVersion :: Int 
