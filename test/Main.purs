module Test.Main where

import Test.Spec.Runner
import Control.Monad.Aff.AVar (AVAR)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Eff.Timer (TIMER)
import Data.Eq (class Eq)
import Data.Generic (class Generic)
import Data.Show (class Show)
import Data.Unit (Unit)
import Global.Unsafe (unsafeStringify)
import Node.Process (PROCESS)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import Test.Spec (describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter.Console (consoleReporter)

main :: forall eff. Eff ( avar :: AVAR, timer :: TIMER, process :: PROCESS, console :: CONSOLE | eff) Unit
main = run [consoleReporter] do
  describe "purescript-reactnative" do
    unsafeApplySpec

newtype AppliedProps = AppliedProps {
  default:: String, ok:: String, second::String, iosProp:: Int, whatever:: String
}
derive instance genAP :: Generic AppliedProps
derive instance eqAP :: Eq AppliedProps
instance showAP :: Show AppliedProps where
  show = unsafeStringify

unsafeApplySpec = it "unsafeApplyProps" do
  let defaults = {default:"prop"}
  let props = _ {ok = "1", second = "2", ios = _ {iosProp=12}, android = _ {whatever="something"} }
  let after = AppliedProps {default:"prop", ok: "1", second:"2", iosProp: 12, whatever: "something"}
  unsafeApplyProps defaults props `shouldEqual` after
