module Pages.CounterPair.View where

import Html exposing (..)
import Html.Attributes exposing (class)

import CounterPair.Model exposing (Model)
import CounterPair.View as CounterPair

import Pages.CounterPair.Update as Update exposing (Action)


view : Signal.Address Action -> Model -> Html
view address model =
  div [ class "ui sixteen wide column grid" ]
    [ h1 [ class "ui header" ]
        [ text "Counter Pair"]
    , CounterPair.view (Signal.forwardTo address Update.CounterPair) model
    ]