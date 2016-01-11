module CounterListFancy.View where

import Html exposing (Html, button, div, text, br)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

import Counter.Model exposing (Model)
import Counter.View as Counter exposing (view, viewWithRemoveButton)
import CounterListFancy.Update exposing (Action)
import CounterListFancy.Model exposing (Model)


view : Signal.Address Action -> CounterListFancy.Model.Model -> Html
view address model =
  let
    insert =
      button [ class "ui button", onClick address CounterListFancy.Update.Insert ] [ text "Add" ]
  in
    div [] ( insert :: List.map (viewCounter address) model.counters )


viewCounter : Signal.Address Action -> (CounterListFancy.Model.ID, Counter.Model.Model) -> Html
viewCounter address (id, model) =
  let
    context =
      Counter.Context
        (Signal.forwardTo address (CounterListFancy.Update.Modify id))
        (Signal.forwardTo address (always (CounterListFancy.Update.Remove id)))
  in
    Counter.viewWithRemoveButton context model