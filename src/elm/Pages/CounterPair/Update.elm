module Pages.CounterPair.Update where

import CounterPair.Model exposing (Model)
import CounterPair.Update as CounterPair exposing (update)


type Action
  = CounterPair CounterPair.Action


update : Action -> Model -> Model
update action model =
  case action of
    CounterPair act ->
      CounterPair.update act model