module Test.Main where

import Test.Spec.Runner

import Data.Eq (class Eq)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Show (genericShow)
import Data.Show (class Show)
import Data.Unit (Unit)
import Effect (Effect)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter.Console (consoleReporter)

main :: Effect Unit
main = run [consoleReporter] do
  describe "purescript-reactnative" do
    unsafeApplySpec

newtype AppliedProps = AppliedProps {
  ok:: String, second::String, iosProp:: Int, whatever:: String
}
derive instance genAP :: Generic AppliedProps _
derive instance eqAP :: Eq AppliedProps
instance showAP :: Show AppliedProps where
  show = genericShow

unsafeApplySpec :: Spec Unit
unsafeApplySpec = it "unsafeApplyProps" do
  let props = {ok: "1", second: "2", ios: {iosProp:12}, android: {whatever:"something"} }
  let after = AppliedProps {ok: "1", second:"2", iosProp: 12, whatever: "something"}
  unsafeApplyProps props `shouldEqual` after
