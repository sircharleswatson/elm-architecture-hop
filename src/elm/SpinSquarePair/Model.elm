module SpinSquarePair.Model where

import SpinSquare.Model as SpinSquare exposing (Model)

type alias Model =
  { left : SpinSquare.Model
  , right : SpinSquare.Model
  }