module Main exposing (main)


import Html exposing (..)
import Json.Decode exposing (..)


json =
    """
        {
            "type" : "success",
            "value" : {
                "id" : 496,
                "joke" : "is so fun",
                "categories" : ["nerdy"]

            }
        }
    """
decoder : Decoder String
decoder =
    at ["value", "joke"] string
jokeResult: Result Error String
jokeResult = decodeString decoder json

main : Html msg
main =
    case jokeResult of
        Ok joke -> text joke
        Err err -> text (Debug.toString err)