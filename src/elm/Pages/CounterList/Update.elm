module Pages.CounterList.Update where

import CounterList.Model exposing (Model)
import CounterList.Update as CounterList exposing (update)


type Action
  = CounterList CounterList.Action


update : Action -> Model -> Model
update action model =
  case action of
    CounterList act ->
      CounterList.update act model