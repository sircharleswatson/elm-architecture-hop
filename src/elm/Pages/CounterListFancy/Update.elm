module Pages.CounterListFancy.Update where

import Effects exposing (Effects)

import Pages.CounterListFancy.Model exposing (Model)
import CounterListFancy.Update as CounterListFancy exposing (update)


type Action
  = CounterListFancy CounterListFancy.Action


update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    CounterListFancy act ->
      (CounterListFancy.update act model, Effects.none)