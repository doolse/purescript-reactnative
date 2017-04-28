module ReactNative.Styles.Flex where

import ReactNative.PropTypes (class AutoEnum, class CenterEnum)
import ReactNative.Styles (StyleProp, unsafeStyleProp)

class FlexStartEnd a where
  flexStart :: a
  flexEnd :: a

newtype FlexAlignment = FlexAlignment String

instance alignmentStartEnd :: FlexStartEnd FlexAlignment where
  flexStart = FlexAlignment "flex-start"
  flexEnd = FlexAlignment "flex-end"

instance flexAlignmentAuto :: AutoEnum FlexAlignment where
  auto = FlexAlignment "auto"

instance flexAlignmentCenter :: CenterEnum FlexAlignment where
  center = FlexAlignment "center"

stretch :: FlexAlignment
stretch = FlexAlignment "stretch"

newtype FlexDirection = FlexDirection String

row :: FlexDirection
row = FlexDirection "row"

rowReverse :: FlexDirection
rowReverse = FlexDirection "row-reverse"

column :: FlexDirection
column = FlexDirection "column"

columnReverse :: FlexDirection
columnReverse = FlexDirection "column-reverse"

newtype FlexWrap = FlexWrap String

wrap :: FlexWrap
wrap = FlexWrap "wrap"

nowrap :: FlexWrap
nowrap = FlexWrap "nowrap"

newtype JustifyContent = JustifyContent String

instance justifyContentFlexSE :: FlexStartEnd JustifyContent where
  flexStart = JustifyContent "flex-start"
  flexEnd = JustifyContent "flex-end"

instance jcCenter :: CenterEnum JustifyContent where
  center = JustifyContent "center"

spaceBetween :: JustifyContent
spaceBetween = JustifyContent "space-between"

spaceAround :: JustifyContent
spaceAround = JustifyContent "space-around"

alignContent :: FlexAlignment -> StyleProp
alignContent = unsafeStyleProp "alignContent"

alignItems :: FlexAlignment -> StyleProp
alignItems = unsafeStyleProp "alignItems"

alignSelf :: FlexAlignment -> StyleProp
alignSelf = unsafeStyleProp "alignSelf"

-- flexDirection controls which directions children of a container go. row goes left to right, column goes top to bottom, and you may be able to guess what the other two do. It works like flex-direction in CSS, except the default is column. See https://developer.mozilla.org/en-US/docs/Web/CSS/flex-direction for more details.
flexDirection :: FlexDirection -> StyleProp
flexDirection = unsafeStyleProp "flexDirection"

flexGrow :: Int -> StyleProp
flexGrow = unsafeStyleProp "flexGrow"
--
flexShrink :: Int -> StyleProp
flexShrink = unsafeStyleProp "flexShrink"

-- flexWrap controls whether children can wrap around after they hit the end of a flex container. It works like flex-wrap in CSS (default: nowrap). See https://developer.mozilla.org/en-US/docs/Web/CSS/flex-wrap for more details.
flexWrap :: FlexWrap -> StyleProp
flexWrap = unsafeStyleProp "flexWrap"

-- justifyContent aligns children in the main direction. For example, if children are flowing vertically, justifyContent controls how they align vertically. It works like justify-content in CSS (default: flex-start). See https://developer.mozilla.org/en-US/docs/Web/CSS/justify-content for more details.
justifyContent :: JustifyContent -> StyleProp
justifyContent = unsafeStyleProp "justifyContent"
