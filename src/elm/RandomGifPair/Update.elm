module RandomGifPair.Update where

import Effects exposing (Effects)

import RandomGif.Update as RandomGif exposing (Action, init, initialModel)
import RandomGifPair.Model exposing (Model)


init : String -> String -> (Model, Effects Action)
init leftTopic rightTopic =
  let
    (left, leftFx) = RandomGif.init leftTopic
    (right, rightFx) = RandomGif.init rightTopic
  in
    ( Model left right
    , Effects.batch
        [ Effects.map Left leftFx
        , Effects.map Right rightFx
        ]
    )

initialModel : String -> String -> Model
initialModel leftTopic rightTopic =
  { left = RandomGif.initialModel leftTopic
  , right = RandomGif.initialModel rightTopic
  }


type Action
  = Left RandomGif.Action
  | Right RandomGif.Action


update : Action -> Model -> (Model, Effects Action)
update msg model =
  case msg of
    Left msg ->
      let
        (left, fx) = RandomGif.update msg model.left
      in
        ( Model left model.right
        , Effects.map Left fx
        )

    Right msg ->
      let
        (right, fx) = RandomGif.update msg model.right
      in
        ( Model model.left right
        , Effects.map Right fx
        )


