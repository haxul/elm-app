module LeaderBoard exposing (..)


-- model



import Html exposing (Html, div, h3, input, text)
import Html.Attributes exposing (placeholder, type_, value)
import Html.Events exposing (onInput)
type alias Model =
    { runners : List Runner
    , query : String
    }

type alias Runner =
    { id : Int
    , name : String
    , location : String
    }

initModel : Model
initModel =
    { runners = []
    , query = ""
    }

-- update

type Msg =
     QueryInput String

update : Msg -> Model -> Model
update msg model =
    case msg of
        QueryInput query -> { model | query = query }

-- view


view : Model -> Html Msg
view model =
    div []
        [ h3 [] [ text "Leader Board ..." ]
        , input [type_ "text", onInput QueryInput , value model.query , placeholder "search  runner ..."] []
        ]


