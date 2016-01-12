module Pages.CounterListFancy.Model where

import CounterListFancy.Model as CounterListFancy


type alias Model = CounterListFancy.Model


initialModel : Model
initialModel =
  CounterListFancy.init