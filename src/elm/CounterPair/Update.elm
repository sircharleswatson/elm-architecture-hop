module CounterPair.Update where

import Counter.Update as Counter exposing (Action, update)
import CounterPair.Model exposing (Model, init)


type Action
  = Reset
  | Top Counter.Action
  | Bottom Counter.Action


update : Action -> Model -> Model
update action model =
  case action of
    Reset -> init 0 0

    Top act ->
      { model
          | topCounter = Counter.update act model.topCounter
      }

    Bottom act ->
      { model
          | bottomCounter = Counter.update act model.bottomCounter
      }