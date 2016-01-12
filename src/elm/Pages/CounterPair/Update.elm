module Pages.CounterPair.Update where

import Effects exposing (Effects)

import Pages.CounterPair.Model exposing (Model)
import CounterPair.Update as CounterPair


type Action
  = CounterPair CounterPair.Action


update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    CounterPair act ->
      (CounterPair.update act model, Effects.none)