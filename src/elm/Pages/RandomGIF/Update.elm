module Pages.RandomGIF.Update where

import Effects exposing (Effects)

import RandomGIF.Model exposing (Model)
import RandomGIF.Update exposing (Action)


type Action
  = RandomGIF RandomGIF.Update.Action


init : String -> Effects Action
init topic = 
  let
    (newModel, newEffects) = RandomGIF.Update.init topic
  in
    Effects.map RandomGIF newEffects


update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    RandomGIF act ->
      let
        (newModel, newEffects) = RandomGIF.Update.update act model
      in
        (newModel, Effects.map RandomGIF newEffects)