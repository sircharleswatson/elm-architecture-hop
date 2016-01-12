module Pages.RandomGif.Update where

import Effects exposing (Effects)

import RandomGif.Model exposing (Model)
import RandomGif.Update exposing (Action)


type Action
  = RandomGif RandomGif.Update.Action


init : String -> Effects Action
init topic = 
  let
    (newModel, newEffects) = RandomGif.Update.init topic
  in
    Effects.map RandomGif newEffects


update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    RandomGif act ->
      let
        (newModel, newEffects) = RandomGif.Update.update act model
      in
        (newModel, Effects.map RandomGif newEffects)