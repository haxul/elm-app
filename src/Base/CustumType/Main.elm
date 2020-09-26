module Main exposing (main)


import Browser
import Html.Events exposing (onClick)
import Html exposing (Html, a, button, div, label, li, nav, p, text, ul)
import Html.Attributes exposing (class, href)


-- MAIN

main =
  Browser.sandbox { init = init, update = update, view = view }

-- MODEL


type Tab = YourFeed | GlobalFeed | TagFeed String

type alias Model =
    {
    tab: Tab
    , selectedPage : Int
    }

type Msg = ClickedPage Int | ClickedTag String

init: Model
init =
    {
    tab = YourFeed
    , selectedPage = 1
    }

--UPDATE


update : Msg -> Model -> Model
update msg model =
    case msg of
        ClickedPage page -> { model | selectedPage = page }
        ClickedTag tag -> model

--VIEW

pageButton : Int -> Html Msg
pageButton n = li [class  "page-item"]
                    [a [class "page-link" , onClick (ClickedPage n)] [text (String.fromInt n)]]

view : Model -> Html Msg

view model = nav []
    [ul [class "pagination"] (List.map pageButton [1,2,3,4,5])
    , p [] [text (String.fromInt model.selectedPage)]
    ]