module App.Model where

import Router.Model as Router
import Counter.Model as Counter
import CounterPair.Model as CounterPair


type alias Model =
  { router : Router.Model
  , counter : Counter.Model
  , counterPair : CounterPair.Model
  }


initialModel : Model
initialModel =
  { router = Router.initialModel
  , counter = (Counter.init 0)
  , counterPair = (CounterPair.init 0 0)
  }