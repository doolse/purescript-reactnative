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
, SectionId, RowId
, RowMap
) where

import Prelude
import Control.Monad.Eff.Uncurried (EffFn2)
import Data.Function.Uncurried (Fn2, Fn3, Fn4, mkFn2, mkFn4, runFn3, runFn4)
import Data.Maybe (Maybe(..))
import Data.Nullable (Nullable, toNullable)
import Data.Record (merge)
import Data.Record.Class (class Subrow)
import Data.StrMap (StrMap)
import React (ReactElement)
import ReactNative.Components.ScrollView (ScrollViewPropsEx)
import ReactNative.Events (EventHandler, EventHandler2, ScrollEvent)
import ReactNative.Unsafe.ApplyProps (unsafeApplyProps2)
import ReactNative.Unsafe.Components (listViewU)
import Unsafe.Coerce (unsafeCoerce)

type SectionId = String
type RowId = String

type ListViewProps a section blob r = {
    dataSource :: ListViewDataSource' blob a section
  , renderRow :: RowRenderer a
  | r
}

type ListViewPropsO section eff = ScrollViewPropsEx eff (
    enableEmptySections :: Boolean
  , initialListSize :: Int
  , onChangeVisibleRows :: EventHandler2 eff RowMap RowMap
  , onEndReached :: EventHandler eff (Nullable ScrollEvent)
  , onEndReachedThreshold :: Int
  , pageSize :: Int
  , renderFooter :: Unit -> ReactElement
  , renderHeader :: Unit -> ReactElement
  , renderScrollComponent :: forall props. props -> ReactElement
  , renderSectionHeader :: SectionRenderer section
  , renderSeparator :: Fn3 SectionId RowId Boolean ReactElement
  , scrollRenderAheadDistance :: Int
)

-- | Create a list view with a data source and a simple row rendering function
listView :: forall blob a section. ListViewDataSource' blob a section -> (a -> ReactElement) ->  ReactElement
listView dataSource rf = listViewU {dataSource,renderRow:rowRenderer rf,enableEmptySections:true}

-- | Create a list view with props, a data source and a row renderer
listView' :: forall o blob a section eff
  .  Subrow o (ListViewPropsO section eff)
  => ListViewProps a section blob o
  -> ReactElement
listView' = listViewU <<< unsafeApplyProps2

type ListViewDataSourceProps blob a section = {|ListViewDataSourcePropsO blob a section}
type ListViewDataSourcePropsO blob a section = (
    getRowData :: Fn3 blob SectionId RowId a
  , getSectionHeaderData :: Fn2 blob SectionId section
  , rowHasChanged :: Fn2 a a Boolean
  , sectionHeaderHasChanged :: Fn2 section section Boolean
)

foreign import refEquality :: forall a. Fn2 a a Boolean

-- | Create a ListViewDataSource from an Array
-- |
-- | Uses reference equality for `rowHasChanged`
listViewDataSource :: forall a. Array a -> ListViewDataSource a
listViewDataSource = cloneWithRows (listViewDataSource' {})

sectionListViewDataSource :: forall blob a section. DataSourceSectionCloneable blob a section => blob -> ListViewDataSource' blob a section
sectionListViewDataSource = cloneWithRowsAndSections (listViewDataSource' {sectionHeaderHasChanged:refEquality :: Fn2 section section Boolean})

listViewDataSource' :: forall blob a section o
  .  Subrow o (ListViewDataSourcePropsO blob a section)
  => {|o} -> ListViewDataSource' blob a section
listViewDataSource' p = listViewDataSourceImpl $ merge ((unsafeCoerce {rowHasChanged:refEquality}) :: ListViewDataSourceProps blob a section) p

cloneWithRows :: forall a. ListViewDataSource' (Array a) a (Array a) -> Array a -> ListViewDataSource' (Array a) a (Array a)
cloneWithRows = cloneWithRows' Nothing

cloneWithRows' :: forall blob a. Maybe (Array RowId) -> DataSourceRowCloneable blob a => ListViewDataSource' blob a blob -> blob -> ListViewDataSource' blob a blob
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
  -> Maybe (Array SectionId)
  -> Maybe (Array (Array RowId))
  -> ListViewDataSource' blob a section
cloneWithRowsAndSections' ds blob sIds rIds = runFn4 cloneWithRowsAndSectionsImpl ds blob (toNullable sIds) (toNullable rIds)

foreign import cloneWithRowsImpl :: forall blob a section. Fn3 (ListViewDataSource' blob a section) blob (Nullable (Array RowId)) (ListViewDataSource' blob a section)
foreign import cloneWithRowsAndSectionsImpl :: forall blob a section. Fn4 (ListViewDataSource' blob a section) blob (Nullable (Array SectionId)) (Nullable (Array (Array RowId))) (ListViewDataSource' blob a section)

foreign import listViewDataSourceImpl :: forall blob a section. ListViewDataSourceProps blob a section -> ListViewDataSource' blob a section
foreign import getRowCount :: forall blob a section. ListViewDataSource' blob a section -> Int
foreign import getRowAndSectionCount :: forall blob a section. ListViewDataSource' blob a section -> Int
foreign import rowShouldUpdate :: forall blob a section. ListViewDataSource' blob a section -> SectionId -> RowId -> Boolean
foreign import getRowData :: forall blob a section. ListViewDataSource' blob a section -> SectionId -> RowId -> a
foreign import getRowIDForFlatIndex :: forall blob a section. ListViewDataSource' blob a section -> Int -> Nullable String
foreign import getSectionIDForFlatIndex :: forall blob a section. ListViewDataSource' blob a section -> Int -> Nullable String
foreign import getSectionLengths  :: forall blob a section. ListViewDataSource' blob a section -> Array Int
foreign import sectionHeaderShouldUpdate :: forall blob a section. ListViewDataSource' blob a section -> SectionId -> Boolean
foreign import getSectionHeaderData  :: forall blob a section. ListViewDataSource' blob a section -> SectionId -> section

-- | See [ListView.DataSource](https://facebook.github.io/react-native/docs/listviewdatasource.html)
type ListViewDataSource a = ListViewDataSource' (Array a) a (Array a)
foreign import data ListViewDataSource' :: Type -> Type -> Type -> Type

foreign import data RowRenderer :: Type -> Type
foreign import data SectionRenderer :: Type -> Type

rowRenderer :: forall a. (a -> ReactElement) -> RowRenderer a
rowRenderer = unsafeCoerce

rowRenderer' :: forall a eff. (a -> SectionId -> RowId -> EffFn2 eff SectionId RowId Unit -> ReactElement) -> RowRenderer a
rowRenderer' = unsafeCoerce <<< mkFn4

sectionRenderer :: forall section. (section -> ReactElement) -> SectionRenderer section
sectionRenderer = unsafeCoerce

sectionRenderer' :: forall section. (section -> SectionId -> ReactElement) -> SectionRenderer section
sectionRenderer' = unsafeCoerce <<< mkFn2

type RowMap = StrMap (StrMap Boolean)
