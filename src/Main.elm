module Main exposing (main)

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

type Operation = SelectTag | Clear

type alias Msg =
    { operation : Operation
      ,data : String
    }

update : Msg -> Model -> Model
update msg model =
  case msg.operation of
    SelectTag ->
      { model | selectedTag = msg.data }
    Clear -> { model | selectedTag = "" }


-- VIEW
view : Model -> Html Msg
view model =
  let viewButton b = button [class (isSelected b) , onClick (handleClick b)] [text b]
      isSelected b = if b == model.selectedTag then "selected" else ""
      handleClick b = {operation = (if b /= "clear" then SelectTag else Clear ), data = b}
      viewText t = div []
            [p [] [text ("title: " ++ t.title)]
            , p [] [text ("desc: " ++ t.description)]
            ]
  in
  div []
    [ div []  (List.map viewButton model.buttons )
      , div [] (List.map viewText  (List.filter (\article -> article.description == model.selectedTag) model.articles))
    ]