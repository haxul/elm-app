module Joke exposing (..)


import Browser
import Html exposing (Html, button, div, p, pre, text)
import Html.Events exposing (onClick)
import Http exposing (Error(..))
import Json.Decode exposing (..)



-- MAIN


main =
  Browser.element
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }



-- MODEL


type Model
  = Failure Http.Error
  | Loading
  | Success JokeResponse
  | Start



init : () -> (Model, Cmd Msg)
init _ =
  ( Start
  , Cmd.none
  )



-- UPDATE


type Msg
  = GotText (Result Http.Error JokeResponse) | Load


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    GotText result ->
      case result of
        Ok fullText ->
          (Success fullText, Cmd.none)

        Err error ->
          (Failure error, Cmd.none)
    Load -> (Loading , loadJoke)


-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model = Sub.none



-- VIEW


view : Model -> Html Msg
view model =
  case model of
    Start -> div [] [button [onClick Load] [text "fetch joke"] ]
    Failure err ->
      text ("Some gets wrong : " ++ errorToString err)

    Loading ->
      text "Loading..."

    Success joke ->
      div []
          [ button [onClick Load] [text  "fetch joke"]
          , p [] [ text joke.joke ]
          ]


-- HTTP

type  alias JokeResponse =
    {
    id: Int
    , joke : String
    , categories : List String
    }

loadJoke : Cmd Msg
loadJoke =  Http.get
                 { url = "http://api.icndb.com/jokes/random"
                 , expect = Http.expectJson GotText jsonDecoder
                 }


jsonDecoder : Decoder JokeResponse
jsonDecoder =
    map3 JokeResponse
        (field "id" int)
        (field "joke" string)
        (field "categories" (list string))
        |> at [ "value"]

errorToString : Http.Error -> String
errorToString error =
    case error of
        BadBody errorMessage ->
            errorMessage
        _ -> "unknown error"

