module Main exposing (main)

import Html exposing (text)
first : List elem -> Maybe elem
first lst = List.head lst

xs = [1,2,3,4,5,6,7,8]
    |> List.filter (\x -> x < 5)
    |> List.map (\x -> x * 2)

y = 1
    |> (\x -> x + 2)
    |> (\x -> x * 10)

s = "hello world"
    |> String.toUpper
    |> (\x -> x ++ "!")

r : String
r = case first ["hello", "world"] of
    Just v -> v
    Nothing -> ""

rec : List Int -> Int
rec xxs =
    case xxs of
        [] -> 0
        [a] -> a
        x :: xxxs -> x + rec xxxs


resolveAva : Maybe String -> String
resolveAva url =
    case url of
        Just u -> u
        Nothing -> "default"

data : Maybe String
data = Nothing
main = text (resolveAva data)