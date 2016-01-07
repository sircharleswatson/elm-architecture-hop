module Router.Update where

import Effects exposing (Effects)
import Hop

import App.Page as Page


type Action
  = HopAction Hop.Action
  | ShowMain Hop.Payload
  | ShowCounter Hop.Payload
  | ShowNotFound Hop.Payload


update action model =
  case action of
    ShowMain payload ->
      ({ model | currentPage = Page.Main, routerPayload = payload }, Effects.none)

    ShowCounter payload ->
      ({ model | currentPage = Page.Counter, routerPayload = payload }, Effects.none)

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
  , ("/test", ShowNotFound)
  ]