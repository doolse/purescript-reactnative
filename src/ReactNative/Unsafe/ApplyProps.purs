module ReactNative.Unsafe.ApplyProps where

foreign import unsafeApplyProps :: forall p p2 a. p -> (a -> a) -> p2

foreign import unsafeApplyProps2 :: forall p p2. p -> p2
