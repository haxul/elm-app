module Login exposing (..)

-- model



import Browser
import Html exposing (..)
import Html.Attributes exposing (placeholder, type_, value)
import Html.Events exposing (onInput)
type alias Model =
    { username : String
    , password : String
    }

initModel : Model
initModel =
    { username = ""
    , password = ""
    }

-- update



type Msg =
    UsernameInput String
    | PasswordInput String

update : Msg -> Model -> Model
update msg model =
    case msg of
        UsernameInput username -> { model | username = username }
        PasswordInput password -> { model | password = password }



-- view

view : Model -> Html Msg
view model =
    div []
        [ h3 [] [text  "Login page .. so far "]
        , Html.form []
                    [ input [type_  "text", value model.username, placeholder "username", onInput UsernameInput ] []
                    , input [type_ "password", value model.password, placeholder "password", onInput PasswordInput ] []
                    , input [type_ "submit"] [text "Login"]
                    ]
        ]
