-- | React Native styles, see https://facebook.github.io/react-native/docs/style.html for the full documentation
module ReactNative.Styles (
  Styles, StyleProp
, styles, styles', staticStyles, unsafeStyleProp
, Position, absolute, relative, position
, BorderStyle, solid, dotted, dashed, borderStyle
, backgroundColor, flex, flexBasis
, left, right, top, bottom
, margin, marginBottom, marginHorizontal, marginLeft, marginRight, marginTop, marginVertical
, width, height, maxHeight, maxWidth, minHeight, minWidth
, Overflow, scroll, overflow
, padding, paddingBottom, paddingHorizontal, paddingLeft, paddingRight, paddingTop, paddingVertical
, BackfaceVisibility, backfaceVisibility
, borderBottomWidth, borderLeftWidth, borderRightWidth, borderTopWidth, borderWidth
, borderBottomColor, borderBottomLeftRadius, borderBottomRightRadius, borderColor, borderLeftColor, borderRadius, borderRightColor
, borderTopColor, borderTopLeftRadius, borderTopRightRadius
, opacity, elevation, zIndex
, ResizeMode, cover, contain, stretch, repeat, resizeMode
, hairlineWidth
) where


import ReactNative.PropTypes (class CenterEnum, class VisibilityEnum)
import ReactNative.PropTypes.Color (Color)
import Unsafe.Coerce (unsafeCoerce)

-- | A type that represents things that can be passed into 'style' properties
foreign import data Styles :: Type

-- | A type which represents a single style
foreign import data StyleProp :: Type

foreign import unsafeStyleProp :: forall a. String -> a -> StyleProp

-- | Register an array of static styles, internally using React Native's `StyleSheet.create` function
foreign import staticStyles :: Array StyleProp -> Styles

-- | Create styles from an array, if the styles are static, use `staticStyles`
foreign import styles :: Array StyleProp -> Styles

-- | Create `Styles` from an array of them, last style has precedence
styles' :: Array Styles -> Styles
styles' = unsafeCoerce

foreign import hairlineWidth :: Int


-- | position in React Native is similar to regular CSS, but everything is set to relative by default, so absolute positioning is always just relative to the parent.
-- | If you want to position a child using specific numbers of logical pixels relative to its parent, set the child to have absolute position.
-- | If you want to position a child relative to something that is not its parent, just don't use styles for that. Use the component tree.
-- | See https://github.com/facebook/css-layout for more details on how position differs between React Native and CSS.
position :: Position -> StyleProp
position = unsafeStyleProp "position"

newtype Position = Position String

absolute :: Position
absolute = Position "absolute"

relative :: Position
relative = Position "relative"

backgroundColor :: Color -> StyleProp
backgroundColor = unsafeStyleProp "backgroundColor"

-- | left is the number of logical pixels to offset the left edge of this component.
-- | It works similarly to left in CSS, but in React Native you must use logical pixel units, rather than percents, ems, or any of that.
-- | See https://developer.mozilla.org/en-US/docs/Web/CSS/left for more details of how left affects layout.
left :: Int -> StyleProp
left = unsafeStyleProp "left"

-- | right is the number of logical pixels to offset the right edge of this component.
-- | It works similarly to right in CSS, but in React Native you must use logical pixel units, rather than percents, ems, or any of that.
-- | See https://developer.mozilla.org/en-US/docs/Web/CSS/right for more details of how right affects layout.
right :: Int -> StyleProp
right = unsafeStyleProp "right"

-- | top is the number of logical pixels to offset the top edge of this component.
-- | It works similarly to top in CSS, but in React Native you must use logical pixel units, rather than percents, ems, or any of that.
-- | See https://developer.mozilla.org/en-US/docs/Web/CSS/top for more details of how top affects layout.
top :: Int -> StyleProp
top = unsafeStyleProp "top"

-- | bottom is the number of logical pixels to offset the bottom edge of this component.
-- | It works similarly to bottom in CSS, but in React Native you must use logical pixel units, rather than percents, ems, or any of that.
-- | See https://developer.mozilla.org/en-US/docs/Web/CSS/bottom for more details of how bottom affects layout.
bottom :: Int -> StyleProp
bottom = unsafeStyleProp "bottom"

flex :: Int -> StyleProp
flex = unsafeStyleProp "flex"

flexBasis :: Int -> StyleProp
flexBasis = unsafeStyleProp "flexBasis"




-- | Setting margin has the same effect as setting each of marginTop, marginLeft, marginBottom, and marginRight. See https://developer.mozilla.org/en-US/docs/Web/CSS/margin for more details.
margin :: Int -> StyleProp
margin = unsafeStyleProp "margin"

-- | marginBottom works like margin-bottom in CSS. See https://developer.mozilla.org/en-US/docs/Web/CSS/margin-bottom for more details.
marginBottom :: Int -> StyleProp
marginBottom = unsafeStyleProp "marginBottom"

-- | Setting marginHorizontal has the same effect as setting both marginLeft and marginRight.
marginHorizontal :: Int -> StyleProp
marginHorizontal = unsafeStyleProp "marginHorizontal"

-- | marginLeft works like margin-left in CSS. See https://developer.mozilla.org/en-US/docs/Web/CSS/margin-left for more details.
marginLeft :: Int -> StyleProp
marginLeft = unsafeStyleProp "marginLeft"

-- | marginRight works like margin-right in CSS. See https://developer.mozilla.org/en-US/docs/Web/CSS/margin-right for more details.
marginRight :: Int -> StyleProp
marginRight = unsafeStyleProp "marginRight"

-- | marginTop works like margin-top in CSS. See https://developer.mozilla.org/en-US/docs/Web/CSS/margin-top for more details.
marginTop :: Int -> StyleProp
marginTop = unsafeStyleProp "marginTop"

-- | Setting marginVertical has the same effect as setting both marginTop and marginBottom.
marginVertical :: Int -> StyleProp
marginVertical = unsafeStyleProp "marginVertical"

-- | width sets the width of this component.
-- | It works similarly to width in CSS, but in React Native you must use logical pixel units, rather than percents, ems, or any of that. See https://developer.mozilla.org/en-US/docs/Web/CSS/width for more details.
width :: Int -> StyleProp
width = unsafeStyleProp "width"

-- | height sets the height of this component.
-- | It works similarly to height in CSS, but in React Native you must use logical pixel units, rather than percents, ems, or any of that. See https://developer.mozilla.org/en-US/docs/Web/CSS/height for more details.
height :: Int -> StyleProp
height = unsafeStyleProp "height"

-- | maxHeight is the maximum height for this component, in logical pixels.
-- | It works similarly to max-height in CSS, but in React Native you must use logical pixel units, rather than percents, ems, or any of that.
-- | See https://developer.mozilla.org/en-US/docs/Web/CSS/max-height for more details.
maxHeight :: Int -> StyleProp
maxHeight = unsafeStyleProp "maxHeight"

-- | maxWidth is the maximum width for this component, in logical pixels.
-- | It works similarly to max-width in CSS, but in React Native you must use logical pixel units, rather than percents, ems, or any of that.
-- | See https://developer.mozilla.org/en-US/docs/Web/CSS/max-width for more details.
maxWidth :: Int -> StyleProp
maxWidth = unsafeStyleProp "maxWidth"

-- | minHeight is the minimum height for this component, in logical pixels.
-- | It works similarly to min-height in CSS, but in React Native you must use logical pixel units, rather than percents, ems, or any of that.
-- | See https://developer.mozilla.org/en-US/docs/Web/CSS/min-height for more details.
minHeight :: Int -> StyleProp
minHeight = unsafeStyleProp "minHeight"

-- | minWidth is the minimum width for this component, in logical pixels.
-- | It works similarly to min-width in CSS, but in React Native you must use logical pixel units, rather than percents, ems, or any of that.
-- | See https://developer.mozilla.org/en-US/docs/Web/CSS/min-width for more details.
minWidth :: Int -> StyleProp
minWidth = unsafeStyleProp "minWidth"

newtype Overflow = Overflow String

instance overflowV :: VisibilityEnum Overflow where
  visible = Overflow "visible"
  hidden = Overflow "hidden"

scroll :: Overflow
scroll = Overflow "scroll"


-- | overflow controls how a children are measured and displayed. overflow: hidden causes views to be clipped while overflow: scroll causes views to be measured independently of their parents main axis.It works likeoverflow` in CSS (default: visible). See https://developer.mozilla.org/en/docs/Web/CSS/overflow for more details.
overflow :: Overflow -> StyleProp
overflow = unsafeStyleProp "overflow"

-- | Setting padding has the same effect as setting each of paddingTop, paddingBottom, paddingLeft, and paddingRight. See https://developer.mozilla.org/en-US/docs/Web/CSS/padding for more details.
padding :: Int -> StyleProp
padding = unsafeStyleProp "padding"

-- | paddingBottom works like padding-bottom in CSS. See https://developer.mozilla.org/en-US/docs/Web/CSS/padding-bottom for more details.
paddingBottom :: Int -> StyleProp
paddingBottom = unsafeStyleProp "paddingBottom"

-- | Setting paddingHorizontal is like setting both of paddingLeft and paddingRight.
paddingHorizontal :: Int -> StyleProp
paddingHorizontal = unsafeStyleProp "paddingHorizontal"

-- | paddingLeft works like padding-left in CSS. See https://developer.mozilla.org/en-US/docs/Web/CSS/padding-left for more details.
paddingLeft :: Int -> StyleProp
paddingLeft = unsafeStyleProp "paddingLeft"

-- | paddingRight works like padding-right in CSS. See https://developer.mozilla.org/en-US/docs/Web/CSS/padding-right for more details.
paddingRight :: Int -> StyleProp
paddingRight = unsafeStyleProp "paddingRight"

-- | paddingTop works like padding-top in CSS. See https://developer.mozilla.org/en-US/docs/Web/CSS/padding-top for more details.
paddingTop :: Int -> StyleProp
paddingTop = unsafeStyleProp "paddingTop"

-- | Setting paddingVertical is like setting both of paddingTop and paddingBottom.
paddingVertical :: Int -> StyleProp
paddingVertical = unsafeStyleProp "paddingVertical"

newtype BackfaceVisibility = BackfaceVisibility String

instance visibleBackface :: VisibilityEnum BackfaceVisibility where
  hidden = BackfaceVisibility "hidden"
  visible = BackfaceVisibility "visible"

backfaceVisibility :: BackfaceVisibility -> StyleProp
backfaceVisibility = unsafeStyleProp "backfaceVisibility"


-- | borderBottomWidth works like border-bottom-width in CSS. See https://developer.mozilla.org/en-US/docs/Web/CSS/border-bottom-width for more details.
borderBottomWidth :: Int -> StyleProp
borderBottomWidth = unsafeStyleProp "borderBottomWidth"

-- | borderLeftWidth works like border-left-width in CSS. See https://developer.mozilla.org/en-US/docs/Web/CSS/border-left-width for more details.
borderLeftWidth :: Int -> StyleProp
borderLeftWidth = unsafeStyleProp "borderLeftWidth"

-- | borderRightWidth works like border-right-width in CSS. See https://developer.mozilla.org/en-US/docs/Web/CSS/border-right-width for more details.
borderRightWidth :: Int -> StyleProp
borderRightWidth = unsafeStyleProp "borderRightWidth"

-- | borderTopWidth works like border-top-width in CSS. See https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-width for more details.
borderTopWidth :: Int -> StyleProp
borderTopWidth = unsafeStyleProp "borderTopWidth"

-- | borderWidth works like border-width in CSS. See https://developer.mozilla.org/en-US/docs/Web/CSS/border-width for more details.
borderWidth :: Int -> StyleProp
borderWidth = unsafeStyleProp "borderWidth"

newtype BorderStyle = BorderStyle String

solid :: BorderStyle
solid = BorderStyle "solid"

dotted :: BorderStyle
dotted = BorderStyle "dotted"

dashed :: BorderStyle
dashed = BorderStyle "dashed"

borderStyle :: BorderStyle -> StyleProp
borderStyle = unsafeStyleProp "borderStyle"

borderBottomColor :: Color -> StyleProp
borderBottomColor = unsafeStyleProp "borderBottomColor"

borderBottomLeftRadius :: Int -> StyleProp
borderBottomLeftRadius = unsafeStyleProp "borderBottomLeftRadius"

borderBottomRightRadius :: Int -> StyleProp
borderBottomRightRadius = unsafeStyleProp "borderBottomRightRadius"

borderColor :: Color -> StyleProp
borderColor = unsafeStyleProp "borderColor"

borderLeftColor :: Color -> StyleProp
borderLeftColor = unsafeStyleProp "borderLeftColor"

borderRadius :: Int -> StyleProp
borderRadius = unsafeStyleProp "borderRadius"

borderRightColor :: Color -> StyleProp
borderRightColor = unsafeStyleProp "borderRightColor"

borderTopColor :: Color -> StyleProp
borderTopColor = unsafeStyleProp "borderTopColor"

borderTopLeftRadius :: Int -> StyleProp
borderTopLeftRadius = unsafeStyleProp "borderTopLeftRadius"

borderTopRightRadius :: Int -> StyleProp
borderTopRightRadius = unsafeStyleProp "borderTopRightRadius"

opacity :: Number -> StyleProp
opacity = unsafeStyleProp "opacity"

elevation :: Int -> StyleProp
elevation = unsafeStyleProp "elevation"

zIndex :: Int -> StyleProp
zIndex = unsafeStyleProp "zIndex"

newtype ResizeMode = ResizeMode String

cover :: ResizeMode
cover = ResizeMode "cover"

contain :: ResizeMode
contain = ResizeMode "contain"

stretch :: ResizeMode
stretch = ResizeMode "stretch"

repeat :: ResizeMode
repeat = ResizeMode "repeat"

instance rmCenter :: CenterEnum ResizeMode where
  center = ResizeMode "center"

resizeMode :: ResizeMode -> StyleProp
resizeMode = unsafeStyleProp "resizeMode"
