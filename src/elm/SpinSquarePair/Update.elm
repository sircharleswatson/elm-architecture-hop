module SpinSquarePair.Update where

import Effects exposing (Effects)

import SpinSquare.Model
import SpinSquare.Update as SpinSquare exposing (Action, init)
import SpinSquarePair.Model exposing (Model)


init : (Model, Effects Action)
init =
  let
    (left, leftFx) = SpinSquare.init
    (right, rightFx) = SpinSquare.init
  in
    ( Model left right
    , Effects.batch
        [ Effects.map Left leftFx
        , Effects.map Right rightFx
        ]
    )


type Action
  = Left SpinSquare.Action
  | Right SpinSquare.Action


update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    Left act ->
      let
        (left, fx) = SpinSquare.update act model.left
      in
        ( Model left model.right
        , Effects.map Left fx
        )

    Right act ->
      let
        (right, fx) = SpinSquare.update act model.right
      in
        ( Model model.left right
        , Effects.map Right fx
        )


