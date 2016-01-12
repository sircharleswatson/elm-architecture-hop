module Pages.Counter.Model where

import Counter.Model exposing (Model, init)

type alias Model = Counter.Model.Model


initialModel : Model
initialModel = Counter.Model.init 0