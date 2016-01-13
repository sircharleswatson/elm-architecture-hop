module SpinSquare.Update where

import Effects exposing (Effects)
import Time exposing (Time)

import SpinSquare.Model exposing (Model, duration, rotateStep)


init : (Model, Effects Action)
init =
  ( { angle = 0
    , animationState = Nothing
    }
  , Effects.none
  )


type Action
  = Spin
  | Tick Time


update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    Spin ->
      case model.animationState of
        Nothing ->
          ( model, Effects.tick Tick )

        Just _ ->
          ( model, Effects.none )

    Tick clockTime ->
      let
        newElapsedTime =
          case model.animationState of
            Nothing ->
              0

            Just { elapsedTime, prevClockTime } ->
              elapsedTime + (clockTime - prevClockTime)
      in
        if newElapsedTime > duration then
          ( { angle = model.angle + rotateStep
            , animationState = Nothing
            }
          , Effects.none
          )
        else
          ( { angle = model.angle
            , animationState = Just { elapsedTime = newElapsedTime, prevClockTime = clockTime }
            }
          , Effects.tick Tick
          )








