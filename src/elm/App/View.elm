module App.View where

import Html exposing (Html, text, div)
import Html.Attributes exposing (class)

import App.Model exposing (Model)
import App.Page as Page
import App.Update exposing (Action)


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