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
import Pages.RandomGif.View as RandomGifPage
import Pages.RandomGifPair.View as RandomGifPairPage
import Pages.RandomGifList.View as RandomGifListPage
import Pages.SpinSquarePair.View as SpinSquarePairPage


-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  div [ class "ui grid container" ]
    [ div [ class "sixteen wide column" ]
        [ navContent address model ]
    , div [ class "five wide column" ]
        [ appState address model ]
    , div [ class "ui eleven wide column grid" ]
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
          , a [ onClick routerAction (navigateTo "/random-gif"), classList (activeClass Page.RandomGif) ]
              [ text "RandomGif"]
          , a [ onClick routerAction (navigateTo "/random-gif-pair"), classList (activeClass Page.RandomGifPair) ]
              [ text "RandomGifPair"]
          , a [ onClick routerAction (navigateTo "/random-gif-list"), classList (activeClass Page.RandomGifList) ]
              [ text "RandomGifList"]
          , a [ onClick routerAction (navigateTo "/spin-square-pair"), classList (activeClass Page.SpinSquarePair) ]
              [ text "SpinSquarePair"]
          ]
      ]


mainContent : Signal.Address Action -> Model -> Html
mainContent address model =
  case model.router.currentPage of
    Page.Main ->
      div [ class "ui sixteen wide column grid" ]
        [ text "Main" ]

    Page.Counter ->
      let
        counterPageAddress =
          Signal.forwardTo address App.Update.CounterAction
      in
        CounterPage.view counterPageAddress model.counter

    Page.CounterPair ->
      let
        counterPairPageAddress =
          Signal.forwardTo address App.Update.CounterPairAction
      in    
        CounterPairPage.view counterPairPageAddress model.counterPair

    Page.CounterList ->
      let counterListPageAddress =
        Signal.forwardTo address App.Update.CounterListAction
      in
        CounterListPage.view counterListPageAddress model.counterList

    Page.CounterListFancy ->
      let counterListFancyPageAddress =
        Signal.forwardTo address App.Update.CounterListFancyAction
      in
        CounterListFancyPage.view counterListFancyPageAddress model.counterListFancy

    Page.RandomGif ->
      let randomGifPageAddress =
        Signal.forwardTo address App.Update.RandomGifAction
      in 
        RandomGifPage.view randomGifPageAddress model.randomGif

    Page.RandomGifPair ->
      let randomGifPairPageAddress =
        Signal.forwardTo address App.Update.RandomGifPairAction
      in 
        RandomGifPairPage.view randomGifPairPageAddress model.randomGifPair

    Page.RandomGifList ->
      let randomGifListPageAddress =
        Signal.forwardTo address App.Update.RandomGifListAction
      in
        RandomGifListPage.view randomGifListPageAddress model.randomGifList

    Page.SpinSquarePair ->
      let spinSquarePairPageAddress =
        Signal.forwardTo address App.Update.SpinSquarePairAction
      in
        SpinSquarePairPage.view spinSquarePairPageAddress model.spinSquarePair


appState : Signal.Address Action -> Model -> Html
appState address model =
  div [ class "ui secondary segment" ]
    [ h2 [ class "ui header" ] [ text "App State" ]
    , code []
      [ pre [] [ text ("router = {") ]
      , pre [] [ text ("  currentPage = " ++ (toString model.router.currentPage)) ]
      , pre [] [ text ("}") ]
      , pre [] [ text ("counter = " ++ (toString model.counter)) ]
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
      , pre [] [ text ("randomGif = {") ]
      , pre [] [ text ("  topic = " ++ (toString model.randomGif.topic)) ]
      , pre [] [ text ("  gifUrl = " ++ (toString model.randomGif.gifUrl)) ]
      , pre [] [ text ("}") ]
      , pre [] [ text ("randomGifPair = {") ]
      , pre [] [ text ("  left = {")]
      , pre [] [ text ("    topic = " ++ (toString model.randomGifPair.left.topic)) ]
      , pre [] [ text ("  }") ]
      , pre [] [ text ("  right = {") ]
      , pre [] [ text ("    topic = " ++ (toString model.randomGifPair.right.topic)) ]
      , pre [] [ text ("  }") ]
      , pre [] [ text ("}") ]
      , pre [] [ text ("randomGifList = {") ]
      , pre [] [ text ("  topic =" ++ (toString model.randomGifList.topic))]
      , pre [] [ text ("  gifList = " ++ (toString model.randomGifList.gifList)) ]
      , pre [] [ text ("  uid = " ++ (toString model.randomGifList.uid)) ]
      , pre [] [ text ("}") ]
      , pre [] [ text ("spinSquarePair = {") ]
      , pre [] [ text ("  left = {")]
      , pre [] [ text ("    angle = " ++ (toString model.spinSquarePair.left.angle)) ]
      , pre [] [ text ("    animationState = " ++ (toString model.spinSquarePair.left.animationState)) ]
      , pre [] [ text ("  }") ]
      , pre [] [ text ("  right = {") ]
      , pre [] [ text ("    angle = " ++ (toString model.spinSquarePair.right.angle)) ]
      , pre [] [ text ("    animationState = " ++ (toString model.spinSquarePair.right.animationState)) ]
      , pre [] [ text ("  }") ]
      , pre [] [ text ("}") ]
      ]
    ]



isActivePage : Page.Page -> Page.Page -> Bool
isActivePage activePage page =
  case activePage of
    _ ->
      activePage == page



