module CounterPair.Model where

import Counter.Model as Counter


type alias Model =
  { topCounter : Counter.Model
  , bottomCounter : Counter.Model
  }


init : Int -> Int -> Model
init top bottom =
  { topCounter = Counter.init top
  , bottomCounter = Counter.init bottom
  }