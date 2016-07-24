module ReactNative.Unsafe.ApplyProps where

foreign import unsafeApplyProps :: forall p p2 a. p -> (a -> a) -> p2
