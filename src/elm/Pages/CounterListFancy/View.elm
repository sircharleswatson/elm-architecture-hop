module Pages.CounterListFancy.View where

import Html exposing (Html, div, button, text, h1)
import Html.Attributes exposing (class)

import CounterListFancy.Model exposing (Model)
import CounterListFancy.View as CounterListFancy exposing (view)

import Pages.CounterListFancy.Update as Update exposing (Action)



view : Signal.Address Action -> Model -> Html
view address model =
  div []
    [ h1 [ class "ui header" ] 
        [ text "Counter List - Fancy" ]
    , div []
        [ CounterListFancy.view (Signal.forwardTo address Update.CounterListFancy) model]
    ]