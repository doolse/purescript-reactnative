-- | See [ListView](https://facebook.github.io/react-native/docs/listview.html)
module ReactNative.Components.ListView (
  ListViewProps, listView, listView'
, ListViewDataSource, ListViewDataSource', listViewDataSource, listViewDataSource', sectionListViewDataSource
, getRowCount, getRowAndSectionCount, rowShouldUpdate, getRowData, getRowIDForFlatIndex, getSectionIDForFlatIndex
, getSectionLengths, sectionHeaderShouldUpdate, getSectionHeaderData
, class DataSourceRowCloneable, class DataSourceSectionCloneable
, cloneWithRows, cloneWithRows', cloneWithRowsAndSections, cloneWithRowsAndSections'
, RowRenderer, rowRenderer, rowRenderer'
, SectionRenderer, sectionRenderer, sectionRenderer'
, SectionIndex, RowIndex
, RowMap
) where

import Prelude
import Control.Monad.Eff.Uncurried (EffFn2)
import Data.Function.Uncurried (Fn2, Fn3, Fn4, mkFn2, mkFn4, runFn3, runFn4)
import Data.Maybe (Maybe(..))
import Data.Nullable (Nullable, toNullable)
import Data.StrMap (StrMap)
import React (ReactElement)
import ReactNative.Components.ScrollView (ScrollViewPropsEx)
import ReactNative.Events (EventHandler, EventHandler2, ScrollEvent)
import ReactNative.PropTypes (Prop)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps)
import ReactNative.Unsafe.Components (listViewU)
import Unsafe.Coerce (unsafeCoerce)

type SectionIndex = String
type RowIndex = String

type ListViewProps a section blob eff = ScrollViewPropsEx eff (
    dataSource :: ListViewDataSource' blob a section
  , enableEmptySections :: Boolean
  , initialListSize :: Int
  , onChangeVisibleRows :: EventHandler2 eff RowMap RowMap
  , onEndReached :: EventHandler eff (Nullable ScrollEvent)
  , onEndReachedThreshold :: Int
  , pageSize :: Int
  , renderFooter :: Unit -> ReactElement
  , renderHeader :: Unit -> ReactElement
  , renderRow :: RowRenderer a
  , renderScrollComponent :: forall props. props -> ReactElement
  , renderSectionHeader :: SectionRenderer section
  , renderSeparator :: Fn3 SectionIndex RowIndex Boolean ReactElement
  , scrollRenderAheadDistance :: Int
)

-- | Create a list view with a data source and a simple row rendering function
listView :: forall blob a section. ListViewDataSource' blob a section -> (a -> ReactElement) ->  ReactElement
listView dataSource rf = listViewU {dataSource,renderRow:rowRenderer rf,enableEmptySections:true}

-- | Create a list view with props, a data source and a row renderer
listView' :: forall blob a section eff.
  Prop (ListViewProps blob a section  eff)
  -> ListViewDataSource' blob a section
  -> RowRenderer a
  -> ReactElement
listView' f dataSource renderRow = listViewU (unsafeApplyProps {dataSource,renderRow} f)

type ListViewDataSourceProps blob a section = {
    getRowData :: Fn3 blob SectionIndex RowIndex a
  , getSectionHeaderData :: Fn2 blob SectionIndex section
  , rowHasChanged :: Fn2 a a Boolean
  , sectionHeaderHasChanged :: Fn2 section section Boolean
}

foreign import refEquality :: forall a. Fn2 a a Boolean

-- | Create a ListViewDataSource from an Array
-- |
-- | Uses reference equality for `rowHasChanged`
listViewDataSource :: forall a. Array a -> ListViewDataSource a
listViewDataSource = cloneWithRows (listViewDataSource' id)

sectionListViewDataSource :: forall blob a section. DataSourceSectionCloneable blob a section => blob -> ListViewDataSource' blob a section
sectionListViewDataSource = cloneWithRowsAndSections (listViewDataSource' _ {sectionHeaderHasChanged=refEquality})

listViewDataSource' :: forall blob a section. Prop (ListViewDataSourceProps blob a section) -> ListViewDataSource' blob a section
listViewDataSource' p = listViewDataSourceImpl (unsafeApplyProps {rowHasChanged:refEquality} p)

cloneWithRows :: forall a. ListViewDataSource' (Array a) a (Array a) -> Array a -> ListViewDataSource' (Array a) a (Array a)
cloneWithRows = cloneWithRows' Nothing

cloneWithRows' :: forall blob a. Maybe (Array RowIndex) -> DataSourceRowCloneable blob a => ListViewDataSource' blob a blob -> blob -> ListViewDataSource' blob a blob
cloneWithRows' ids ds blob  = runFn3 cloneWithRowsImpl ds blob (toNullable ids)

class DataSourceRowCloneable blob a | blob -> a
class DataSourceSectionCloneable blob a section | blob -> a, blob -> section

instance arrayRowCloneable :: DataSourceRowCloneable (Array a) a
instance strMapMapCloneable :: DataSourceSectionCloneable (StrMap (StrMap a)) a (StrMap a)
instance strMapArrayCloneable :: DataSourceSectionCloneable (StrMap (Array a)) a (Array a)
instance arrayArrayCloneable :: DataSourceSectionCloneable (Array (Array a)) a (Array a)

cloneWithRowsAndSections :: forall blob a section. DataSourceSectionCloneable blob a section => ListViewDataSource' blob a section -> blob -> ListViewDataSource' blob a section
cloneWithRowsAndSections ds blob = runFn4 cloneWithRowsAndSectionsImpl ds blob (toNullable Nothing) (toNullable Nothing)

cloneWithRowsAndSections' :: forall blob a section. DataSourceSectionCloneable blob a section =>
  ListViewDataSource' blob a section -> blob
  -> Maybe (Array SectionIndex)
  -> Maybe (Array (Array RowIndex))
  -> ListViewDataSource' blob a section
cloneWithRowsAndSections' ds blob sIds rIds = runFn4 cloneWithRowsAndSectionsImpl ds blob (toNullable sIds) (toNullable rIds)

foreign import cloneWithRowsImpl :: forall blob a section. Fn3 (ListViewDataSource' blob a section) blob (Nullable (Array RowIndex)) (ListViewDataSource' blob a section)
foreign import cloneWithRowsAndSectionsImpl :: forall blob a section. Fn4 (ListViewDataSource' blob a section) blob (Nullable (Array SectionIndex)) (Nullable (Array (Array RowIndex))) (ListViewDataSource' blob a section)

foreign import listViewDataSourceImpl :: forall blob a section. ListViewDataSourceProps blob a section -> ListViewDataSource' blob a section
foreign import getRowCount :: forall blob a section. ListViewDataSource' blob a section -> Int
foreign import getRowAndSectionCount :: forall blob a section. ListViewDataSource' blob a section -> Int
foreign import rowShouldUpdate :: forall blob a section. ListViewDataSource' blob a section -> SectionIndex -> RowIndex -> Boolean
foreign import getRowData :: forall blob a section. ListViewDataSource' blob a section -> SectionIndex -> RowIndex -> a
foreign import getRowIDForFlatIndex :: forall blob a section. ListViewDataSource' blob a section -> Int -> Nullable String
foreign import getSectionIDForFlatIndex :: forall blob a section. ListViewDataSource' blob a section -> Int -> Nullable String
foreign import getSectionLengths  :: forall blob a section. ListViewDataSource' blob a section -> Array Int
foreign import sectionHeaderShouldUpdate :: forall blob a section. ListViewDataSource' blob a section -> SectionIndex -> Boolean
foreign import getSectionHeaderData  :: forall blob a section. ListViewDataSource' blob a section -> SectionIndex -> section

-- | See [ListView.DataSource](https://facebook.github.io/react-native/docs/listviewdatasource.html)
type ListViewDataSource a = ListViewDataSource' (Array a) a (Array a)
foreign import data ListViewDataSource' :: Type -> Type -> Type -> Type

foreign import data RowRenderer :: Type -> Type
foreign import data SectionRenderer :: Type -> Type

rowRenderer :: forall a. (a -> ReactElement) -> RowRenderer a
rowRenderer = unsafeCoerce

rowRenderer' :: forall a eff. (a -> SectionIndex -> RowIndex -> EffFn2 eff SectionIndex RowIndex Unit -> ReactElement) -> RowRenderer a
rowRenderer' = unsafeCoerce <<< mkFn4

sectionRenderer :: forall section. (section -> ReactElement) -> SectionRenderer section
sectionRenderer = unsafeCoerce

sectionRenderer' :: forall section. (section -> SectionIndex -> ReactElement) -> SectionRenderer section
sectionRenderer' = unsafeCoerce <<< mkFn2

type RowMap = StrMap (StrMap Boolean)
