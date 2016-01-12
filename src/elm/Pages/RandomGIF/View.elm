module Pages.RandomGIF.View where

import Html exposing (Html, div, h1, text)
import Html.Attributes exposing (class)

import Pages.RandomGIF.Update exposing (Action)
import RandomGIF.Model exposing (Model)
import RandomGIF.View as RandomGIF exposing (view)



view : Signal.Address Action -> Model -> Html
view address model =
  let
    randomGIFAddress =
      Signal.forwardTo address Pages.RandomGIF.Update.RandomGIF
  in
    div []
      [ h1 [ class "ui header"]
          [ text "Random GIF" ]
      , div []
          [ RandomGIF.view randomGIFAddress model ]
      ]