module App.Update where

import Effects exposing (Effects)

import App.Model exposing (initialModel, Model)
import Pages.Counter.Update exposing (Action)
import Pages.CounterList.Update exposing (Action)
import Pages.CounterListFancy.Update exposing (Action)
import Pages.CounterPair.Update exposing (Action)
import Pages.RandomGif.Update exposing (Action)
import Pages.RandomGifPair.Update exposing (Action)
import Router.Update as Router


-- UPDATE

type Action
  = RouterAction Router.Action
  | CounterAction Pages.Counter.Update.Action
  | CounterPair Pages.CounterPair.Update.Action
  | CounterList Pages.CounterList.Update.Action
  | CounterListFancy Pages.CounterListFancy.Update.Action
  | RandomGif Pages.RandomGif.Update.Action
  | RandomGifPair Pages.RandomGifPair.Update.Action
  | NoOp


initialEffects : List (Effects Action)
initialEffects =
  [ Effects.map RandomGif <| (Pages.RandomGif.Update.init "funny dogs") ]

init : (Model, Effects Action)
init =
  ( initialModel
  , Effects.batch initialEffects
  )


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

    CounterPair subAction ->
      let
        updatedModel =
          { model
              | counterPair = Pages.CounterPair.Update.update subAction model.counterPair
          }
      in
        (updatedModel, Effects.none)

    CounterList subAction ->
      let
        updatedModel =
          { model
              | counterList = Pages.CounterList.Update.update subAction model.counterList
          }
      in
        (updatedModel, Effects.none)

    CounterListFancy subAction ->
      let
        updatedModel =
          { model
              | counterListFancy = Pages.CounterListFancy.Update.update subAction model.counterListFancy
          }
      in
        (updatedModel, Effects.none)

    RandomGif subAction ->
      let
        (updatedModel, updatedEffects) = Pages.RandomGif.Update.update subAction model.randomGif
      in
        ( { model | randomGif = updatedModel }, Effects.map RandomGif updatedEffects)

    RandomGifPair subAction ->
      let
        (updatedModel, updatedEffects) = Pages.RandomGifPair.Update.update subAction model.randomGifPair
      in
        ( { model | randomGifPair = updatedModel }, Effects.map RandomGifPair updatedEffects)

    _ ->
      (model, Effects.none)

      