module ReactNative.PropTypes.Color where

import Prelude
import Data.Int (hexadecimal, toStringAs)

newtype Color = Color String

rgb :: Int -> Int -> Int -> Color
rgb r g b = Color $ "rgb(" <> show r <> ", " <> show g <> ", " <> show b <> ")"

rgba :: Int -> Int -> Int -> Number -> Color
rgba r g b a = Color $ "rgba(" <> show r <> ", " <> show g <> ", " <> show b <> ", " <> show a <> ")"

rgbi :: Int -> Color
rgbi i = Color $ "#" <> toStringAs hexadecimal i

transparent :: Color
transparent = Color "transparent"

aliceblue :: Color
aliceblue = Color "aliceblue"

antiquewhite :: Color
antiquewhite = Color "antiquewhite"

aqua :: Color
aqua = Color "aqua"

aquamarine :: Color
aquamarine = Color "aquamarine"

azure :: Color
azure = Color "azure"

beige :: Color
beige = Color "beige"

bisque :: Color
bisque = Color "bisque"

black :: Color
black = Color "black"

blanchedalmond :: Color
blanchedalmond = Color "blanchedalmond"

blue :: Color
blue = Color "blue"

blueviolet :: Color
blueviolet = Color "blueviolet"

brown :: Color
brown = Color "brown"

burlywood :: Color
burlywood = Color "burlywood"

cadetblue :: Color
cadetblue = Color "cadetblue"

chartreuse :: Color
chartreuse = Color "chartreuse"

chocolate :: Color
chocolate = Color "chocolate"

coral :: Color
coral = Color "coral"

cornflowerblue :: Color
cornflowerblue = Color "cornflowerblue"

cornsilk :: Color
cornsilk = Color "cornsilk"

crimson :: Color
crimson = Color "crimson"

cyan :: Color
cyan = Color "cyan"

darkblue :: Color
darkblue = Color "darkblue"

darkcyan :: Color
darkcyan = Color "darkcyan"

darkgoldenrod :: Color
darkgoldenrod = Color "darkgoldenrod"

darkgray :: Color
darkgray = Color "darkgray"

darkgreen :: Color
darkgreen = Color "darkgreen"

darkgrey :: Color
darkgrey = Color "darkgrey"

darkkhaki :: Color
darkkhaki = Color "darkkhaki"

darkmagenta :: Color
darkmagenta = Color "darkmagenta"

darkolivegreen :: Color
darkolivegreen = Color "darkolivegreen"

darkorange :: Color
darkorange = Color "darkorange"

darkorchid :: Color
darkorchid = Color "darkorchid"

darkred :: Color
darkred = Color "darkred"

darksalmon :: Color
darksalmon = Color "darksalmon"

darkseagreen :: Color
darkseagreen = Color "darkseagreen"

darkslateblue :: Color
darkslateblue = Color "darkslateblue"

darkslategray :: Color
darkslategray = Color "darkslategray"

darkslategrey :: Color
darkslategrey = Color "darkslategrey"

darkturquoise :: Color
darkturquoise = Color "darkturquoise"

darkviolet :: Color
darkviolet = Color "darkviolet"

deeppink :: Color
deeppink = Color "deeppink"

deepskyblue :: Color
deepskyblue = Color "deepskyblue"

dimgray :: Color
dimgray = Color "dimgray"

dimgrey :: Color
dimgrey = Color "dimgrey"

dodgerblue :: Color
dodgerblue = Color "dodgerblue"

firebrick :: Color
firebrick = Color "firebrick"

floralwhite :: Color
floralwhite = Color "floralwhite"

forestgreen :: Color
forestgreen = Color "forestgreen"

fuchsia :: Color
fuchsia = Color "fuchsia"

gainsboro :: Color
gainsboro = Color "gainsboro"

ghostwhite :: Color
ghostwhite = Color "ghostwhite"

gold :: Color
gold = Color "gold"

goldenrod :: Color
goldenrod = Color "goldenrod"

gray :: Color
gray = Color "gray"

green :: Color
green = Color "green"

greenyellow :: Color
greenyellow = Color "greenyellow"

grey :: Color
grey = Color "grey"

honeydew :: Color
honeydew = Color "honeydew"

hotpink :: Color
hotpink = Color "hotpink"

indianred :: Color
indianred = Color "indianred"

indigo :: Color
indigo = Color "indigo"

ivory :: Color
ivory = Color "ivory"

khaki :: Color
khaki = Color "khaki"

lavender :: Color
lavender = Color "lavender"

lavenderblush :: Color
lavenderblush = Color "lavenderblush"

lawngreen :: Color
lawngreen = Color "lawngreen"

lemonchiffon :: Color
lemonchiffon = Color "lemonchiffon"

lightblue :: Color
lightblue = Color "lightblue"

lightcoral :: Color
lightcoral = Color "lightcoral"

lightcyan :: Color
lightcyan = Color "lightcyan"

lightgoldenrodyellow :: Color
lightgoldenrodyellow = Color "lightgoldenrodyellow"

lightgray :: Color
lightgray = Color "lightgray"

lightgreen :: Color
lightgreen = Color "lightgreen"

lightgrey :: Color
lightgrey = Color "lightgrey"

lightpink :: Color
lightpink = Color "lightpink"

lightsalmon :: Color
lightsalmon = Color "lightsalmon"

lightseagreen :: Color
lightseagreen = Color "lightseagreen"

lightskyblue :: Color
lightskyblue = Color "lightskyblue"

lightslategray :: Color
lightslategray = Color "lightslategray"

lightslategrey :: Color
lightslategrey = Color "lightslategrey"

lightsteelblue :: Color
lightsteelblue = Color "lightsteelblue"

lightyellow :: Color
lightyellow = Color "lightyellow"

lime :: Color
lime = Color "lime"

limegreen :: Color
limegreen = Color "limegreen"

linen :: Color
linen = Color "linen"

magenta :: Color
magenta = Color "magenta"

maroon :: Color
maroon = Color "maroon"

mediumaquamarine :: Color
mediumaquamarine = Color "mediumaquamarine"

mediumblue :: Color
mediumblue = Color "mediumblue"

mediumorchid :: Color
mediumorchid = Color "mediumorchid"

mediumpurple :: Color
mediumpurple = Color "mediumpurple"

mediumseagreen :: Color
mediumseagreen = Color "mediumseagreen"

mediumslateblue :: Color
mediumslateblue = Color "mediumslateblue"

mediumspringgreen :: Color
mediumspringgreen = Color "mediumspringgreen"

mediumturquoise :: Color
mediumturquoise = Color "mediumturquoise"

mediumvioletred :: Color
mediumvioletred = Color "mediumvioletred"

midnightblue :: Color
midnightblue = Color "midnightblue"

mintcream :: Color
mintcream = Color "mintcream"

mistyrose :: Color
mistyrose = Color "mistyrose"

moccasin :: Color
moccasin = Color "moccasin"

navajowhite :: Color
navajowhite = Color "navajowhite"

navy :: Color
navy = Color "navy"

oldlace :: Color
oldlace = Color "oldlace"

olive :: Color
olive = Color "olive"

olivedrab :: Color
olivedrab = Color "olivedrab"

orange :: Color
orange = Color "orange"

orangered :: Color
orangered = Color "orangered"

orchid :: Color
orchid = Color "orchid"

palegoldenrod :: Color
palegoldenrod = Color "palegoldenrod"

palegreen :: Color
palegreen = Color "palegreen"

paleturquoise :: Color
paleturquoise = Color "paleturquoise"

palevioletred :: Color
palevioletred = Color "palevioletred"

papayawhip :: Color
papayawhip = Color "papayawhip"

peachpuff :: Color
peachpuff = Color "peachpuff"

peru :: Color
peru = Color "peru"

pink :: Color
pink = Color "pink"

plum :: Color
plum = Color "plum"

powderblue :: Color
powderblue = Color "powderblue"

purple :: Color
purple = Color "purple"

rebeccapurple :: Color
rebeccapurple = Color "rebeccapurple"

red :: Color
red = Color "red"

rosybrown :: Color
rosybrown = Color "rosybrown"

royalblue :: Color
royalblue = Color "royalblue"

saddlebrown :: Color
saddlebrown = Color "saddlebrown"

salmon :: Color
salmon = Color "salmon"

sandybrown :: Color
sandybrown = Color "sandybrown"

seagreen :: Color
seagreen = Color "seagreen"

seashell :: Color
seashell = Color "seashell"

sienna :: Color
sienna = Color "sienna"

silver :: Color
silver = Color "silver"

skyblue :: Color
skyblue = Color "skyblue"

slateblue :: Color
slateblue = Color "slateblue"

slategray :: Color
slategray = Color "slategray"

slategrey :: Color
slategrey = Color "slategrey"

snow :: Color
snow = Color "snow"

springgreen :: Color
springgreen = Color "springgreen"

steelblue :: Color
steelblue = Color "steelblue"

tan :: Color
tan = Color "tan"

teal :: Color
teal = Color "teal"

thistle :: Color
thistle = Color "thistle"

tomato :: Color
tomato = Color "tomato"

turquoise :: Color
turquoise = Color "turquoise"

violet :: Color
violet = Color "violet"

wheat :: Color
wheat = Color "wheat"

white :: Color
white = Color "white"

whitesmoke :: Color
whitesmoke = Color "whitesmoke"

yellow :: Color
yellow = Color "yellow"

yellowgreen :: Color
yellowgreen = Color "yellowgreen"
