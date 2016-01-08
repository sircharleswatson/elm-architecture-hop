module App.Update where

import Effects exposing (Effects)

import App.Model exposing (initialModel, Model)
import Pages.Counter.Update exposing (Action)
import Router.Update as Router


-- UPDATE

type Action
  = RouterAction Router.Action
  | CounterAction Pages.Counter.Update.Action
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

    CounterAction subAction ->
      let
        updatedModel =
          { model
              | counter = Pages.Counter.Update.update subAction model.counter
          }
      in
        (updatedModel, Effects.none)

    _ ->
      (model, Effects.none)

      