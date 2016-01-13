module Pages.RandomGifList.View where

import Html exposing (Html, div, text, h1)
import Html.Attributes exposing (class)

import Pages.RandomGifList.Model exposing (Model)
import Pages.RandomGifList.Update exposing (Action)
import RandomGifList.View as RandomGifList exposing (view)


view : Signal.Address Action -> Model -> Html
view address model =
  let
    randomGifListAddress =
      Signal.forwardTo address Pages.RandomGifList.Update.RandomGifList
  in
    div [ class "ui sixteen wide column grid" ]
      [ h1 [ class "ui header" ]
          [ text "Random Gif List" ]
      , RandomGifList.view randomGifListAddress model
      ]