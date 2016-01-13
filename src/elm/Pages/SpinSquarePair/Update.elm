module Pages.SpinSquarePair.Update where

import Effects exposing (Effects)

import Pages.SpinSquarePair.Model exposing (initialModel, Model)
import SpinSquarePair.Update


type Action
  = SpinSquarePair SpinSquarePair.Update.Action


init : (Model, Effects Action)
init = 
  let
    (childModel, childEffects) =
      SpinSquarePair.Update.init
  in
    (childModel, Effects.map SpinSquarePair childEffects)


update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    SpinSquarePair act ->
      let
        (newModel, newEffects) = SpinSquarePair.Update.update act model
      in
        (newModel, Effects.map SpinSquarePair newEffects)