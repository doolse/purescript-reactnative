module ReactNative.Components.ListView where

import Prelude
import Data.Function.Eff (EffFn2)
import Data.Function.Uncurried (Fn2, Fn3, mkFn4)
import Data.StrMap (StrMap)
import React (ReactElement)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Components.ScrollView (ScrollViewPropsEx)
import ReactNative.Events (EventHandler2, TouchEvent, EventHandler)
import ReactNative.PropTypes (Prop)
import ReactNative.Unsafe.Components (listViewU)
import Unsafe.Coerce (unsafeCoerce)

foreign import data ListViewDataSource :: * -> *

foreign import data RowRenderer :: * -> *

rowRenderer :: forall a. (a -> ReactElement) -> RowRenderer a
rowRenderer = unsafeCoerce

rowRenderer' :: forall a. (a -> String -> String -> (forall eff. EffFn2 eff String String Unit) -> ReactElement) -> RowRenderer a
rowRenderer' = unsafeCoerce <<< mkFn4

type RowMap = StrMap (StrMap Boolean)

type ListViewProps a eff = ScrollViewPropsEx eff (
    dataSource :: ListViewDataSource a
  , enableEmptySections :: Boolean
  , initialListSize :: Int
  , onChangeVisibleRows :: EventHandler2 eff RowMap RowMap
  , onEndReached :: EventHandler eff TouchEvent
  , onEndReachedThreshold :: Int
  , pageSize :: Int
  , renderFooter :: Unit -> ReactElement
  , renderHeader :: Unit -> ReactElement
  , renderRow :: RowRenderer a
  , renderScrollComponent :: forall props. props -> ReactElement
  , renderSectionHeader :: Fn2 String String ReactElement
  , renderSeparator :: Fn3 String String Boolean ReactElement
  , scrollRenderAheadDistance :: Int
)

foreign import refEquality :: forall a. Fn2 a a Boolean

listViewDataSource :: forall a. Array a -> ListViewDataSource a
listViewDataSource = listViewDataSourceImpl refEquality

foreign import listViewDataSourceImpl :: forall a. Fn2 a a Boolean -> Array a -> ListViewDataSource a
foreign import cloneWithRows :: forall a. ListViewDataSource a -> Array a -> ListViewDataSource a
foreign import getRowCount :: forall a. ListViewDataSource a -> Int


listView :: forall a. ListViewDataSource a -> (a -> ReactElement) ->  ReactElement
listView dataSource rf = listViewU {dataSource,renderRow:rowRenderer rf,enableEmptySections:true}

listView' :: forall a eff. Prop (ListViewProps a eff) -> ListViewDataSource a -> RowRenderer a ->  ReactElement
listView' f dataSource renderRow = listViewU (unsafeApplyProps {dataSource,renderRow,enableEmptySections:true} f)
