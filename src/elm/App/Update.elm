module App.Update where

import Effects exposing (Effects)

import App.Model exposing (initialModel, Model)
import Router.Update as Router


-- UPDATE

type Action
  = RouterAction Router.Action
  | NoOp


init : (Model, Effects Action)
init =
  (initialModel, Effects.none)


update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    RouterAction subAction ->
      let
        (updatedRouter, fx) = Router.update subAction model.router

        updatedModel =
          { model
              | router = updatedRouter
          }
      in
        (updatedModel, Effects.map RouterAction fx)

    _ ->
      (model, Effects.none)