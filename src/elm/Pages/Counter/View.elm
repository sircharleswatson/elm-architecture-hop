module Pages.Counter.View where

import Html exposing (..)

import Counter.Model exposing (Model)
import Pages.Counter.Update exposing (Action)
import Counter.View as Counter exposing (view)


view : Signal.Address Action -> Model -> Html
view address model =
  let
    counter = Pages.Counter.Update.Counter
  in
    div []
      [ div []
          [ h1 [] [ text "Counter" ]
          ]
      , div []
          [ Counter.view (Signal.forwardTo address counter) model ]
      ]