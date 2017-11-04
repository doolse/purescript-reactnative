module ReactNative.Optional where

-- | Proof that row `r` is a subset of row `s`
class Optional (r :: # Type) (s :: # Type)
instance srInst :: Union r t s => Optional r s
