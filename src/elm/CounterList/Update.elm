module CounterList.Update where

import Counter.Model as Counter exposing (init)
import Counter.Update exposing (Action)
import CounterList.Model exposing (Model, ID)


type Action
  = Insert
  | Remove
  | Modify ID Counter.Update.Action


update : Action -> Model -> Model
update action model =
  case action of
    Insert ->
      let
        newCounter = (model.nextID, Counter.init 0)
        newCounters = model.counters ++ [ newCounter ]
      in
        { model
            | counters = newCounters
            , nextID = model.nextID + 1
        }

    Remove ->
      { model | counters = List.drop 1 model.counters }

    Modify id counterAction ->
      let
        updateCounter (counterID, counterModel) =
          if counterID == id then
            (counterID, Counter.Update.update counterAction counterModel)
          else
            (counterID, counterModel)
      in
        { model | counters = List.map updateCounter model.counters }










