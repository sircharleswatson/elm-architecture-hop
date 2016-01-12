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
import Pages.CounterPair.View as CounterPairPage
import Pages.CounterList.View as CounterListPage
import Pages.CounterListFancy.View as CounterListFancyPage
import Pages.RandomGIF.View as RandomGIFPage


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
          , a [ onClick routerAction (navigateTo "/counter-pair"), classList (activeClass Page.CounterPair) ]
              [ text "CounterPair"]
          , a [ onClick routerAction (navigateTo "/counter-list"), classList (activeClass Page.CounterList) ]
              [ text "CounterList"]
          , a [ onClick routerAction (navigateTo "/counter-list-fancy"), classList (activeClass Page.CounterListFancy) ]
              [ text "CounterListFancy"]
          , a [ onClick routerAction (navigateTo "/random-gif"), classList (activeClass Page.RandomGIF) ]
              [ text "RandomGIF"]    
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

    Page.CounterPair ->
      let
        counterPairPageAddress =
          Signal.forwardTo address App.Update.CounterPair
      in    
        CounterPairPage.view counterPairPageAddress model.counterPair

    Page.CounterList ->
      let counterListPageAddress =
        Signal.forwardTo address App.Update.CounterList
      in
        CounterListPage.view counterListPageAddress model.counterList

    Page.CounterListFancy ->
      let counterListFancyPageAddress =
        Signal.forwardTo address App.Update.CounterListFancy
      in
        CounterListFancyPage.view counterListFancyPageAddress model.counterListFancy

    Page.RandomGIF ->
      let randomGIFPageAddress =
        Signal.forwardTo address App.Update.RandomGIF
      in 
        RandomGIFPage.view randomGIFPageAddress model.randomGIF


appState : Signal.Address Action -> Model -> Html
appState address model =
  div [ class "ui secondary segment" ]
    [ h2 [ class "ui header" ] [ text "App State" ]
    , code []
      [ pre [] [ text ("counter = " ++ (toString model.counter)) ]
      , pre [] [ text ("counterPair = {") ]
      , pre [] [ text ("  topCounter = " ++ (toString model.counterPair.topCounter)) ]
      , pre [] [ text ("  bottomCounter = " ++ (toString model.counterPair.bottomCounter)) ]
      , pre [] [ text ("}") ]
      , pre [] [ text ("counterList = {")]
      , pre [] [ text ("  counters = " ++ (toString model.counterList.counters)) ]
      , pre [] [ text ("  nextID = " ++ (toString model.counterList.nextID)) ]
      , pre [] [ text ("}") ]
      , pre [] [ text ("counterListFancy = {")]
      , pre [] [ text ("  counters = " ++ (toString model.counterListFancy.counters)) ]
      , pre [] [ text ("  nextID = " ++ (toString model.counterListFancy.nextID)) ]
      , pre [] [ text ("}") ]
      , pre [] [ text ("randomGIF = {") ]
      , pre [] [ text ("  topic = " ++ (toString model.randomGIF.topic)) ]
      , pre [] [ text ("  gifUrl = " ++ (toString model.randomGIF.gifUrl)) ]
      , pre [] [ text ("}") ]
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



