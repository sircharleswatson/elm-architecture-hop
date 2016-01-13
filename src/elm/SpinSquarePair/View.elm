module SpinSquarePair.View where

import Html exposing (Html, div)

import SpinSquare.View as SpinSquare exposing (view)
import SpinSquarePair.Model exposing (Model)
import SpinSquarePair.Update as SpinSquarePair exposing (Action)


view : Signal.Address Action -> Model -> Html
view address model =
  div []
    [ SpinSquare.view (Signal.forwardTo address SpinSquarePair.Left) model.left
    , SpinSquare.view (Signal.forwardTo address SpinSquarePair.Right) model.right
    ]