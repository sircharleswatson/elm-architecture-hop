module Pages.Counter.Update where

import Effects exposing (Effects)

import Pages.Counter.Model exposing (Model)
import Counter.Update as Counter


type Action
  = Counter Counter.Action


update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    Counter counterAction ->
      (Counter.update counterAction model, Effects.none)