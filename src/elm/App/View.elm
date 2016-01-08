module App.View where

import Html exposing (..)
import Html.Attributes exposing (class, classList, id)
import Html.Events exposing (onClick)
import Graphics.Element exposing (show)

import App.Model exposing (Model)
import App.Page as Page
import App.Update exposing (Action)
import Router.Update

import Pages.Counter.View as CounterPage


-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  div [ class "ui grid container" ]
    [ div [ class "sixteen wide column" ]
        [ navContent address model ]
    , div [ class "four wide column" ]
        [ appState address model ]
    , div [ class "twelve wide column" ]
        [ mainContent address model ]
    ]


navContent : Signal.Address Action -> Model -> Html
navContent address model =
  let
    activeClass page =
      [ ("active", isActivePage model.router.currentPage page)
      , ("item", True)
      ]

    routerAction =
      (Signal.forwardTo address App.Update.RouterAction)

    navigateTo path =
      (Router.Update.NavigateTo path)
  in
    div []
      [ div [ class "ui secondary menu" ]
          [ a [ onClick routerAction (navigateTo "/"), classList (activeClass Page.Main) ]
              [ text "Home"]
          , a [ onClick routerAction (navigateTo "/counter"), classList (activeClass Page.Counter) ]
              [ text "Counter"]
          ]
      ]


mainContent : Signal.Address Action -> Model -> Html
mainContent address model =
  case model.router.currentPage of
    Page.Main ->
      div [] [
        text "Main"
      ]
    Page.Counter ->
      let
        counterPageAddress =
          Signal.forwardTo address App.Update.CounterAction
      in
        CounterPage.view counterPageAddress model.counter


appState : Signal.Address Action -> Model -> Html
appState address model =
  div [ class "ui secondary segment" ]
    [ h2 [ class "ui header" ] [ text "App State" ]
    , code []
      [ pre [] [ text ("counter = " ++ (toString model.counter)) ]
      , pre [] [ text ("router = {") ]
      , pre [] [ text ("  currentPage = " ++ (toString model.router.currentPage)) ]
      , pre [] [ text ("}") ]
      ]
    ]



isActivePage : Page.Page -> Page.Page -> Bool
isActivePage activePage page =
  case activePage of
    _ ->
      activePage == page



