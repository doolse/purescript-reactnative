module ReactNative.Styles.Text where

import ReactNative.PropTypes (class AutoEnum, class CenterEnum, class NormalEnum)
import ReactNative.PropTypes.Color (Color)
import ReactNative.Styles (StyleProp, unsafeStyleProp)

newtype TextAlign = TextAlign String
newtype TextDecoration = TextDecoration String
newtype FontStyle = FontStyle String
newtype FontWeight = FontWeight String
newtype TextAlignVertical = TextAlignVertical String
newtype FontVariant = FontVariant String
newtype TextDecorationStyle = TextDecorationStyle String
newtype WritingDirection = WritingDirection String

smallCaps :: FontVariant
smallCaps = FontVariant "small-caps"

oldstyleNums :: FontVariant
oldstyleNums = FontVariant "oldstyle-nums"

liningNums :: FontVariant
liningNums = FontVariant "lining-nums"

tabularNums :: FontVariant
tabularNums = FontVariant "tabular-nums"

proportionalNums :: FontVariant
proportionalNums = FontVariant "proportional-nums"

solid :: TextDecorationStyle
solid = TextDecorationStyle "solid"

double :: TextDecorationStyle
double = TextDecorationStyle "double"

dotted :: TextDecorationStyle
dotted = TextDecorationStyle "dotted"

dashed :: TextDecorationStyle
dashed = TextDecorationStyle "dashed"

ltr :: WritingDirection
ltr = WritingDirection "ltr"

rtl :: WritingDirection
rtl = WritingDirection "rtl"

instance autoWD :: AutoEnum WritingDirection where
  auto = WritingDirection "auto"

top :: TextAlignVertical
top = TextAlignVertical "top"

bottom :: TextAlignVertical
bottom = TextAlignVertical "bottom"

instance centerTAV :: CenterEnum TextAlignVertical
  where center = TextAlignVertical "center"

instance autoTAV :: AutoEnum TextAlignVertical
  where auto = TextAlignVertical "auto"

left :: TextAlign
left = TextAlign "left"

right :: TextAlign
right = TextAlign "right"

instance centerTextAlign :: CenterEnum TextAlign where
  center = TextAlign "center"

justify :: TextAlign
justify = TextAlign "justify"

instance taAuto :: AutoEnum TextAlign where
  auto = TextAlign "auto"

none :: TextDecoration
none = TextDecoration "none"

underline :: TextDecoration
underline = TextDecoration "underline"

lineThrough :: TextDecoration
lineThrough = TextDecoration "line-through"

underlineLineThrough :: TextDecoration
underlineLineThrough = TextDecoration "underline line-through"

instance normalFontStyle :: NormalEnum FontStyle where
  normal = FontStyle "normal"

instance normalFontWeight :: NormalEnum FontWeight where
  normal = FontWeight "normal"

bold :: FontWeight
bold = FontWeight "bold"

weight100 :: FontWeight
weight100 = FontWeight "100"

weight200 :: FontWeight
weight200 = FontWeight "200"

weight300 :: FontWeight
weight300 = FontWeight "300"

weight400 :: FontWeight
weight400 = FontWeight "400"

weight500 :: FontWeight
weight500 = FontWeight "500"

weight600 :: FontWeight
weight600 = FontWeight "600"

weight700 :: FontWeight
weight700 = FontWeight "700"

weight800 :: FontWeight
weight800 = FontWeight "800"

weight900 :: FontWeight
weight900 = FontWeight "900"


italic :: FontStyle
italic = FontStyle "italic"

color :: Color -> StyleProp
color = unsafeStyleProp "color"

fontFamily ::String -> StyleProp
fontFamily = unsafeStyleProp "fontFamily"

fontSize :: Int -> StyleProp
fontSize = unsafeStyleProp "fontSize"

fontStyle :: FontStyle -> StyleProp
fontStyle = unsafeStyleProp "fontStyle"

-- Specifies font weight. The values 'normal' and 'bold' are supported for most fonts. Not all fonts have a variant for each of the numeric values, in that case the closest one is chosen.
fontWeight :: FontWeight -> StyleProp
fontWeight = unsafeStyleProp "fontWeight"

lineHeight :: Int -> StyleProp
lineHeight = unsafeStyleProp "lineHeight"

-- Specifies text alignment. The value 'justify' is only supported on iOS and fallbacks to left on Android.
textAlign :: TextAlign -> StyleProp
textAlign = unsafeStyleProp "textAlign"

textDecorationLine :: TextDecoration -> StyleProp
textDecorationLine = unsafeStyleProp "textDecorationLine"

textShadowColor :: Color -> StyleProp
textShadowColor = unsafeStyleProp "textShadowColor"

textShadowOffset :: {width:: Number, height:: Number} -> StyleProp
textShadowOffset = unsafeStyleProp "textShadowOffset"

textShadowRadius :: Int -> StyleProp
textShadowRadius = unsafeStyleProp "textShadowRadius"

androidTextAlignVertical :: TextAlignVertical -> StyleProp
androidTextAlignVertical = unsafeStyleProp "textAlignVertical"

iosFontVariant :: FontVariant -> StyleProp
iosFontVariant = unsafeStyleProp "fontVariant"

iosLetterSpacing :: Int -> StyleProp
iosLetterSpacing = unsafeStyleProp "letterSpacing"

iosTextDecorationColor :: Color -> StyleProp
iosTextDecorationColor = unsafeStyleProp "textDecorationColor"

iosTextDecorationStyle :: TextDecorationStyle -> StyleProp
iosTextDecorationStyle = unsafeStyleProp "textDecorationStyle"

iosWritingDirection :: WritingDirection -> StyleProp
iosWritingDirection = unsafeStyleProp "writingDirection"
