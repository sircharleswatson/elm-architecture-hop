module Pages.SpinSquarePair.View where

import Html exposing (Html, div, h1, text)
import Html.Attributes exposing (class)

import Pages.SpinSquarePair.Update exposing (Action)
import Pages.SpinSquarePair.Model exposing (Model)
import SpinSquarePair.View as SpinSquarePair exposing (view)


view : Signal.Address Action -> Model -> Html
view address model =
  let
    spinSquarePairAddress =
      Signal.forwardTo address Pages.SpinSquarePair.Update.SpinSquarePair
  in
    div [ class "ui sixteen wide column grid" ]
      [ h1 
          [ class "ui header" ]
          [ text "Spin Square Pair" ]
      , SpinSquarePair.view spinSquarePairAddress model
      ]