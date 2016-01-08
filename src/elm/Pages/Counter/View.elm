module Pages.Counter.View where

import Html exposing (..)
import Html.Attributes exposing (class)

import Counter.Model exposing (Model)
import Pages.Counter.Update exposing (Action)
import Counter.View as Counter exposing (view)


view : Signal.Address Action -> Model -> Html
view address model =
  let
    counterAddress = 
      Signal.forwardTo address Pages.Counter.Update.Counter
  in
    div []
      [ h1 [ class "ui header" ] [ text "Counter" ]
      , div []
          [ Counter.view counterAddress model ]
      ]