module Pages.RandomGifPair.Update where

import Effects exposing (Effects)

import Pages.RandomGifPair.Model exposing (initialModel, Model)
import RandomGifPair.Update


type Action
  = RandomGifPair RandomGifPair.Update.Action


init : (Model, Effects Action)
init = 
  let
    (childModel, childEffects) =
      RandomGifPair.Update.init initialModel.left.topic initialModel.right.topic
  in
    (childModel, Effects.map RandomGifPair childEffects)


update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    RandomGifPair act ->
      let
        (newModel, newEffects) = RandomGifPair.Update.update act model
      in
        (newModel, Effects.map RandomGifPair newEffects)