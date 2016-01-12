module Pages.CounterList.Model where

import CounterList.Model


type alias Model = CounterList.Model.Model


initialModel : Model
initialModel =
  CounterList.Model.init