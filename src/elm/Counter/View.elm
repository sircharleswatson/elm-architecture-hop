module Counter.View where

import Html exposing (Html, Attribute, button, div, text)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)

import Counter.Model exposing (Model)
import Counter.Update as Counter exposing (Action)


view : Signal.Address Action -> Model -> Html
view address model =
  div []
    [ button [ onClick address Counter.Decrement, class "ui negative button" ] [ text "-" ]
    , div [ countStyle ] [ text (toString model) ]
    , button [ onClick address Counter.Increment, class "ui positive button" ] [ text "+" ]
    ]


countStyle : Attribute
countStyle =
  style
    [ ("font-size", "20px")
    , ("font-family", "monospace")
    , ("display", "inline-block")
    , ("width", "50px")
    , ("text-align", "center")
    ]