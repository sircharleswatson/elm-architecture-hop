module Pages.Counter.Update where

import Counter.Model exposing (Model)
import Counter.Update as Counter
import Debug

type Action
  = Counter Counter.Action


update : Action -> Model -> Model
update action model =
  case action of
    Counter counterAction ->
      Counter.update counterAction model