module Main exposing (main)

import Html exposing (Html, button, div, text)
import Html.Attributes exposing (class)
import List

pluralize : String -> String -> Int -> String
pluralize singular plural amount =
    let amountStr = String.fromInt amount
        prefix = amountStr ++ " : "
    in
    if amount == 1 then
       prefix ++ singular
     else prefix ++ plural

tag t = button [class "btn btn-outline-secondary mx-2"] [text t]
backend = ["java", "kotlin", "haskel"]

renderTags : List String -> Html msg
renderTags lst = div [class "container"] (List.map tag lst)

main = text ""
