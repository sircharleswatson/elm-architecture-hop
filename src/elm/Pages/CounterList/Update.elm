module Pages.CounterList.Update where

import Effects exposing (Effects)

import CounterList.Model exposing (Model)
import CounterList.Update as CounterList exposing (update)


type Action
  = CounterList CounterList.Action


update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    CounterList act ->
      (CounterList.update act model, Effects.none)