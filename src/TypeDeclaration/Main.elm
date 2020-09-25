module Main exposing (main)

import Html exposing (Html, div, text)

type Profile = Account String | User

type alias Search =
    {
     name : String
     , star: Int
     , profile : Profile
     }

searchResult : Search
searchResult =
    {
    name = "hello"
    , star = 10
    , profile = User
    }
convertToString : Search -> String
convertToString r =
    case r.profile of
        Account name -> r.name ++ "->" ++ String.fromInt r.star ++ "->" ++ name

        User -> r.name ++ "-> User "

sum : Int -> Int -> Int
sum a b = a + b

sum10 = sum 10

banner : Float -> Html msg
banner a = div [] [text (String.fromFloat a)]
main = banner 10.1