module Main exposing (..)

import Html exposing (text)
x = Tuple.first (1, 2)

main = text (String.fromInt x)