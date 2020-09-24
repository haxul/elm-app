module Main exposing (main)

import Html exposing (Html, div, h1, h2, li, text, ul)
import Html.Attributes exposing (class, id)
import List exposing (map)

pluralize singular plural amount =
    let amountStr = String.fromInt amount
        prefix = amountStr ++ " : "
    in
    if amount == 1 then
       prefix ++ singular
     else prefix ++ plural

languages = ul [class "langs" ]
    [ li [] [ text "js"]
     ,li [] [ text "ts" ]
     ,li [] [ text  "elm" ]
    ]


banner = h2 [class "banner"] [text "nice banner"]

result = div []
    [
     h1 [id "header"] [ text "Application"]
     , languages
     , banner
    ]


backend = ["java", "kotlin", "haskel"]

renderLi : List String -> Html msg
renderLi lst = ul [] (List.map (\x -> li [class "pretty"] [text x]) lst)

main = renderLi backend

