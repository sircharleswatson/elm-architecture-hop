module Pages.SpinSquarePair.Model where

import SpinSquare.Model as SpinSquare
import SpinSquarePair.Model as SpinSquarePair


type alias Model = SpinSquarePair.Model


initialModel : Model
initialModel =
  { left = SpinSquare.initialModel
  , right = SpinSquare.initialModel
  }