module RandomGifPair.View where

import Html exposing (Html, div)
import Html.Attributes exposing (class)

import RandomGif.View as RandomGif exposing (view)
import RandomGifPair.Model exposing (Model)
import RandomGifPair.Update exposing (Action)


view : Signal.Address Action -> Model -> Html
view address model =
  div [ class "ui sixteen column grid" ]
    [ div [ class "ui eight wide column" ]
        [ RandomGif.view (Signal.forwardTo address RandomGifPair.Update.Left) model.left ]
    , div [ class "ui eight wide column" ]
        [ RandomGif.view (Signal.forwardTo address RandomGifPair.Update.Right) model.right ]
    ]