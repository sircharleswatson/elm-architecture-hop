module CounterListFancy.Update where

import Counter.Model as Counter exposing (init)
import Counter.Update exposing (Action)
import CounterListFancy.Model exposing (Model, ID)


type Action
  = Insert
  | Remove ID
  | Modify ID Counter.Update.Action


update : Action -> Model -> Model
update action model =
  case action of
    Insert ->
      { model
          | counters = (model.nextID, Counter.init 0) :: model.counters
          , nextID = model.nextID + 1
      }

    Remove id ->
      { model
          | counters = List.filter (\(counterID, _) -> counterID /= id) model.counters
      }

    Modify id counterAction ->
      let
        updateCounter (counterID, counterModel) =
          if counterID == id then
            (counterID, Counter.Update.update counterAction counterModel)
          else
            (counterID, counterModel)
      in
        { model | counters = List.map updateCounter model.counters }

