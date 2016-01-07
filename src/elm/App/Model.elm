module App.Model where

import Router.Model as Router


type alias Model =
  { router : Router.Model }


initialModel : Model
initialModel =
  { router = Router.initialModel }