module App.View where

import Html exposing (Html, text, div)
import Html.Attributes exposing (class)

import App.Model exposing (Model)
import App.Page as Page
import App.Update exposing (Action)

import Pages.Counter.View as CounterPage


-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  div [] [
    mainContent address model
  ]


mainContent : Signal.Address Action -> Model -> Html
mainContent address model =
  case model.router.currentPage of
    Page.Main ->
      div [] [
        text "Main"
      ]
    Page.Counter ->
      CounterPage.view (Signal.forwardTo address App.Update.CounterAction) model.counter