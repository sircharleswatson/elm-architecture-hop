module CounterPair.View where

import Html exposing (Html, div, button, text, br)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

import Counter.View as Counter exposing (view)
import CounterPair.Model exposing (Model)
import CounterPair.Update exposing (Action)


view : Signal.Address Action -> Model -> Html
view address model =
  div []
    [ Counter.view (Signal.forwardTo address CounterPair.Update.Top) model.topCounter
    , br [] []
    , Counter.view (Signal.forwardTo address CounterPair.Update.Bottom) model.bottomCounter
    , br [] []
    , button [ onClick address CounterPair.Update.Reset, class "ui button" ] [ text "RESET" ]
    ]