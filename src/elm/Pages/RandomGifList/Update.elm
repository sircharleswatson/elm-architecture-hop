module Pages.RandomGifList.Update where

import Effects exposing (Effects)

import Pages.RandomGifList.Model exposing (Model)
import RandomGifList.Update exposing (Action)


type Action
  = RandomGifList RandomGifList.Update.Action


update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    RandomGifList act ->
      let
        (newModel, newEffects) = RandomGifList.Update.update act model
      in
        (newModel, Effects.map RandomGifList newEffects)
