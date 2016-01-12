module Pages.CounterPair.Model where

import CounterPair.Model exposing (Model)


type alias Model = CounterPair.Model.Model


initialModel : Model
initialModel =
  CounterPair.Model.init 0 0