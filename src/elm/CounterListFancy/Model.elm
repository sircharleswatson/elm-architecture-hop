module CounterListFancy.Model where

import Counter.Model as Counter


type alias Model =
  { counters : List (ID, Counter.Model)
  , nextID : ID
  }


type alias ID = Int


init : Model
init =
  { counters = []
  , nextID = 0
  }