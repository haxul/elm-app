module Main exposing (..)


import Browser
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Login
import LeaderBoard

-- model

type alias Model =
    { page : Page
    , leaderBoard : LeaderBoard.Model
    , login : Login.Model
    }

type Page =
    LeaderBoardPage
    | LoginPage

initModel : Model
initModel =
    { page = LeaderBoardPage
    , leaderBoard = LeaderBoard.initModel
    , login = Login.initModel
    }


-- update

type Msg =
    ChangePage Page
    | LeaderBoardMsg LeaderBoard.Msg
    | LoginMsg Login.Msg

-- update

update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangePage page ->
            { model | page = page}

        LeaderBoardMsg lbmsg ->
            { model | leaderBoard = LeaderBoard.update lbmsg model.leaderBoard}

        LoginMsg lmsg ->
            { model | login = Login.update lmsg model.login}

-- view

view : Model -> Html Msg
view model =
    let
        page =
            case model.page of
                LeaderBoardPage ->
                    Html.map LeaderBoardMsg (LeaderBoard.view model.leaderBoard)
                LoginPage ->
                    Html.map LoginMsg (Login.view model.login)
    in
    div []
        [  div []
               [ a [href "#", onClick (ChangePage LeaderBoardPage)  ] [text "leader board"]
               , span [] [text " | "]
               , a [href "#", onClick (ChangePage LoginPage) ] [ text "login page"]
               , hr [] []
               , page
               ]
        ]

main : Program () Model Msg
main = Browser.sandbox
    { init = initModel
    , update = update
    , view = view
    }

