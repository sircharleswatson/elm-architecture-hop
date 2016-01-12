module Pages.RandomGif.View where

import Html exposing (Html, div, h1, text)
import Html.Attributes exposing (class)

import Pages.RandomGif.Update exposing (Action)
import RandomGif.Model exposing (Model)
import RandomGif.View as RandomGif exposing (view)



view : Signal.Address Action -> Model -> Html
view address model =
  let
    randomGifAddress =
      Signal.forwardTo address Pages.RandomGif.Update.RandomGif
  in
    div []
      [ h1 [ class "ui header"]
          [ text "Random GIF" ]
      , div []
          [ RandomGif.view randomGifAddress model ]
      ]