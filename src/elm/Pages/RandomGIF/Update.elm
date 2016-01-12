module Pages.RandomGif.Update where

import Effects exposing (Effects)

import Pages.RandomGif.Model exposing (initialModel, Model)
import RandomGif.Update exposing (Action)


type Action
  = RandomGif RandomGif.Update.Action


init : (Model, Effects Action)
init = 
  let
    (childModel, childEffects) =
      RandomGif.Update.init initialModel.topic
  in
    (childModel, Effects.map RandomGif childEffects)


update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    RandomGif act ->
      let
        (newModel, newEffects) = RandomGif.Update.update act model
      in
        (newModel, Effects.map RandomGif newEffects)