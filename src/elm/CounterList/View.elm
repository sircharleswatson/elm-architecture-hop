module CounterList.View where

import Html exposing (Html, button, div, text, br)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

import Counter.Model exposing (Model)
import Counter.View as Counter exposing (view)
import CounterList.Update exposing (Action)
import CounterList.Model exposing (Model)



view : Signal.Address Action -> CounterList.Model.Model -> Html
view address model =
  let
    counters = List.map (viewCounter address) model.counters
    remove = 
      button [ class "ui button", onClick address CounterList.Update.Remove ]
        [ text "Remove" ]
    insert = 
      button [ class "ui button", onClick address CounterList.Update.Insert ]
        [ text "Add" ]
  in
    div [] ([remove, insert] ++ counters)


viewCounter : Signal.Address Action -> (CounterList.Model.ID, Counter.Model.Model) -> Html
viewCounter address (id, model) =
  div [] 
    [ Counter.view (Signal.forwardTo address (CounterList.Update.Modify id)) model
    , br [] []
    ]