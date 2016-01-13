module Pages.CounterList.View where


import Html exposing (Html, div, button, text, h1)
import Html.Attributes exposing (class)

import CounterList.Model exposing (Model)
import CounterList.View as CounterList exposing (view)

import Pages.CounterList.Update as Update exposing (Action)



view : Signal.Address Action -> Model -> Html
view address model =
  div [ class "ui sixteen wide column grid" ]
    [ h1 [ class "ui header" ] 
        [ text "Counter List" ]
    , CounterList.view (Signal.forwardTo address Update.CounterList) model
    ]