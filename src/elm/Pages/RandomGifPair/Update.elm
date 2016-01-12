module Pages.RandomGifPair.Update where

import Effects exposing (Effects)

import RandomGifPair.Model exposing (Model)
import RandomGifPair.Update


type Action
  = RandomGifPair RandomGifPair.Update.Action





update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    RandomGifPair act ->
      let
        (newModel, newEffects) = RandomGifPair.Update.update act model
      in
        (newModel, Effects.map RandomGifPair newEffects)