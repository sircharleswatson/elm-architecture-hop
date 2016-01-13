module SpinSquare.View where

import Easing exposing (ease, easeOutBounce, float)
import Html exposing (Html)
import Svg exposing (svg, rect, g, text, text')
import Svg.Attributes exposing (..)
import Svg.Events exposing (onClick)

import SpinSquare.Model exposing (Model, rotateStep, duration, AnimationState)
import SpinSquare.Update exposing (Action)


toOffset : AnimationState -> Float
toOffset animationState =
  case animationState of
    Nothing ->
      0

    Just { elapsedTime } ->
      ease easeOutBounce float 0 rotateStep duration elapsedTime


view : Signal.Address Action -> Model -> Html
view address model =
  let
    angle =
      model.angle + toOffset model.animationState
  in
    svg
      [ width "200", height "200", viewBox "0 0 200 200" ]
      [ g [ transform ("translate(100, 100) rotate(" ++ toString angle ++ ")")
          , onClick (Signal.message address SpinSquare.Update.Spin)
          ]
          [ rect
              [ x "-50"
              , y "-50"
              , width "100"
              , height "100"
              , rx "15"
              , ry "15"
              , style "fill: #60B5CC"
              ]
              []
          , text' [ fill "white", textAnchor "middle" ] [ text "Click me!"]
          ]
      ]


