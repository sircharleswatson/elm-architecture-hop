module Router.Model where

import Hop

import App.Page as Page
import Router.Update exposing (router)


-- MODEl

type alias Model =
  { routerPayload : Hop.Payload
  , currentPage: Page.Page
  }

initialModel : Model
initialModel =
  { routerPayload = router.payload
  , currentPage = Page.Main
  }

