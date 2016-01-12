module Router.Update where

import Effects exposing (Effects)
import Hop

import App.Page as Page


type Action
  = HopAction Hop.Action
  | NavigateTo String
  | ShowMain Hop.Payload
  | ShowCounter Hop.Payload
  | ShowCounterPair Hop.Payload
  | ShowCounterList Hop.Payload
  | ShowCounterListFancy Hop.Payload
  | ShowRandomGif Hop.Payload
  | ShowRandomGifPair Hop.Payload
  | ShowNotFound Hop.Payload


update action model =
  case action of
    NavigateTo path ->
      (model, Effects.map HopAction (Hop.navigateTo path))
      
    ShowMain payload ->
      ({ model | currentPage = Page.Main, routerPayload = payload }, Effects.none)

    ShowCounter payload ->
      ({ model | currentPage = Page.Counter, routerPayload = payload }, Effects.none)

    ShowCounterPair payload ->
      ({ model | currentPage = Page.CounterPair, routerPayload = payload }, Effects.none)

    ShowCounterList payload ->
      ({ model | currentPage = Page.CounterList, routerPayload = payload }, Effects.none)

    ShowCounterListFancy payload ->
      ({ model | currentPage = Page.CounterListFancy, routerPayload = payload }, Effects.none)

    ShowRandomGif payload ->
      ({ model | currentPage = Page.RandomGif, routerPayload = payload }, Effects.none)

    ShowRandomGifPair payload ->
      ({ model | currentPage = Page.RandomGifPair, routerPayload = payload }, Effects.none)

    _ ->
      (model, Effects.none)


router : Hop.Router Action
router =
  Hop.new
    { routes = routes
    , notFoundAction = ShowNotFound
    }


routes : List (String, Hop.Payload -> Action)
routes =
  [ ("/", ShowMain)
  , ("/counter", ShowCounter)
  , ("/counter-pair", ShowCounterPair)
  , ("/counter-list", ShowCounterList)
  , ("/counter-list-fancy", ShowCounterListFancy)
  , ("/random-gif", ShowRandomGif)
  , ("/random-gif-pair", ShowRandomGifPair)
  ]