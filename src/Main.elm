module Main exposing (..)

import Browser
import Html exposing (Html, button, div, p, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Article

-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }

-- MODEL


type alias Model =
    { selectedTag : String
      , buttons: List String
      , articles : List Article.Article
    }

init : Model
init =
    {selectedTag = "elm"
     ,buttons = Article.tags
     ,articles = Article.feed
    }

-- UPDATE

type Operation = SelectTag

type alias Msg =
    { operation : Operation
      ,data : Int
    }

update msg model =
  case msg.operation of
    SelectTag ->
      { model | selectedTag = msg.data }



-- VIEW

view model =
  let viewButton buttonName  =
        button [class (isSelected buttonName) , onClick {operation = SelectTag, data = buttonName}] [text buttonName]
      isSelected b = if b == model.selectedTag then "selected" else ""
      viewText t = div []
            [p [] [text ("title: " ++ t.title)]
            , p [] [text ("desc: " ++ t.description)]
            ]
  in
  div []
    [ div []  (List.map viewButton model.buttons )
      , div [] (List.map viewText  (List.filter (\article -> article.description == model.selectedTag) model.articles))
    ]