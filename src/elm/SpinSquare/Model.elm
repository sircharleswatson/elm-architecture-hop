module SpinSquare.Model where

import Effects exposing (Effects)
import Time exposing (Time, second)


type alias Model =
  { angle : Float
  , animationState : AnimationState
  }


type alias AnimationState =
  Maybe { prevClockTime : Time, elapsedTime: Time }


initialModel : Model
initialModel =
  { angle = 0
  , animationState = Nothing
  }


rotateStep = 90
duration = second