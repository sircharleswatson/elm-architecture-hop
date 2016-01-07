module App.Model where

import Router.Model as Router
import Counter.Model as Counter


type alias Model =
  { router : Router.Model
  , counter : Counter.Model }


initialModel : Model
initialModel =
  { router = Router.initialModel
  , counter = Counter.initialModel }