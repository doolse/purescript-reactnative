module ReactNative.Components.NavigationExperimental where

import Data.Function.Uncurried (Fn2, runFn2)
import React (ReactClass, ReactElement, createElement)
import ReactNative.Events (UnitEventHandler)

foreign import cardStackClass :: forall props. ReactClass props
foreign import popRoute :: forall r. NavigationState r -> NavigationState r
foreign import pushRouteImpl :: forall r. Fn2 (NavigationState r) (NavigationRoute r) (NavigationState r)

type NavigationState route = { index::Int, routes::Array (NavigationRoute route) }
type NavigationRoute r = {key::String|r}
type NavigationScene r = {index:: Int, isActive:: Boolean, isStale:: Boolean, key:: String, route:: NavigationRoute r }
type NavigationSceneRendererProps r = {scene::NavigationScene r}

navigationCardStack :: forall sp eff. UnitEventHandler eff ->
  NavigationState sp -> (NavigationSceneRendererProps sp -> ReactElement) -> ReactElement
navigationCardStack onNavigateBack navigationState renderScene = createElement cardStackClass {onNavigateBack,navigationState,renderScene} []

pushRoute :: forall r. NavigationState r -> NavigationRoute r -> NavigationState r
pushRoute s r = runFn2 pushRouteImpl s r
