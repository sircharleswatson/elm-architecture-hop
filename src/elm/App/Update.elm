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
  | CounterPairAction Pages.CounterPair.Update.Action
  | CounterListAction Pages.CounterList.Update.Action
  | CounterListFancyAction Pages.CounterListFancy.Update.Action
  | RandomGifAction Pages.RandomGif.Update.Action
  | RandomGifPairAction Pages.RandomGifPair.Update.Action
  | NoOp


initialEffects : List (Effects Action)
initialEffects =
  [ Effects.map RandomGifAction <| snd Pages.RandomGif.Update.init
  , Effects.map RandomGifPairAction <| snd Pages.RandomGifPair.Update.init
  ]

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
        (updatedRouter, fx) = 
          Router.update subAction model.router

        updatedModel =
          { model
              | router = updatedRouter
          }
      in
        (updatedModel, Effects.map RouterAction fx)

    CounterAction subAction ->
      let
        (childModel, childEffects) =
          Pages.Counter.Update.update subAction model.counter
      in
        ( { model
              | counter = childModel
          }
        , Effects.map CounterAction childEffects
        )

    CounterPairAction subAction ->
      let
        (childModel, childEffects) =
          Pages.CounterPair.Update.update subAction model.counterPair
      in
        ( { model
              | counterPair = childModel
          }
        , Effects.map CounterPairAction childEffects
        )

    CounterListAction subAction ->
      let
        (childModel, childEffects) =
          Pages.CounterList.Update.update subAction model.counterList
      in
        ( { model
              | counterList = childModel
          }
        , Effects.map CounterListAction childEffects
        )

    CounterListFancyAction subAction ->
      let
        (childModel, childEffects) =
          Pages.CounterListFancy.Update.update subAction model.counterListFancy
      in
        ( { model
              | counterListFancy = childModel
          }
        , Effects.map CounterListFancyAction childEffects
        )

    RandomGifAction subAction ->
      let
        (childModel, childEffects) =
          Pages.RandomGif.Update.update subAction model.randomGif
      in
        ( { model 
              | randomGif = childModel
          }
        , Effects.map RandomGifAction childEffects
        )

    RandomGifPairAction subAction ->
      let
        (childModel, childEffects) =
          Pages.RandomGifPair.Update.update subAction model.randomGifPair
      in
        ( { model
              | randomGifPair = childModel
          }
        , Effects.map RandomGifPairAction childEffects
        )

    _ ->
      (model, Effects.none)

      