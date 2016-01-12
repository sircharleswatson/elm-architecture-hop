module Pages.RandomGifPair.View where

import Html exposing (Html, div, h1, text)
import Html.Attributes exposing (class)

import Pages.RandomGifPair.Update exposing (Action)
import RandomGifPair.Model exposing (Model)
import RandomGifPair.View as RandomGifPair exposing (view)


view : Signal.Address Action -> Model -> Html
view address model =
  let
    randomGifPairAddress =
      Signal.forwardTo address Pages.RandomGifPair.Update.RandomGifPair
  in
    div []
      [ h1 [ class "ui header"]
          [ text "Random Gif Pair" ]
      , div []
          [ RandomGifPair.view randomGifPairAddress model ]
      ]