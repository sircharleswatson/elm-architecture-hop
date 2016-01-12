module RandomGifPair.View where

import Html exposing (Html, div)

import RandomGif.View as RandomGif exposing (view)
import RandomGifPair.Model exposing (Model)
import RandomGifPair.Update exposing (Action)


view : Signal.Address Action -> Model -> Html
view address model =
  div []
    [ RandomGif.view (Signal.forwardTo address RandomGifPair.Update.Left) model.left
    , RandomGif.view (Signal.forwardTo address RandomGifPair.Update.Right) model.right
    ]