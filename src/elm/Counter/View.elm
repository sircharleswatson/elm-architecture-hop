module Counter.View where

import Html exposing (Html, Attribute, button, div, text)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)

import Counter.Model exposing (Model)
import Counter.Update as Counter exposing (Action)


type alias Context =
  { actions : Signal.Address Action
  , remove : Signal.Address ()
  }


view : Signal.Address Action -> Model -> Html
view address model =
  div []
    [ button [ onClick address Counter.Decrement, class "ui negative button" ] [ text "-" ]
    , div [ countStyle ] [ text (toString model) ]
    , button [ onClick address Counter.Increment, class "ui positive button" ] [ text "+" ]
    ]


viewWithRemoveButton : Context -> Model -> Html
viewWithRemoveButton context model =
  div []
    [ button [ onClick context.actions Counter.Decrement, class "ui negative button" ] [ text "-" ]
    , div [ countStyle ] [ text (toString model) ]
    , button [ onClick context.actions Counter.Increment, class "ui positive button" ] [ text "+" ]
    , div [ countStyle ] []
    , button [ onClick context.remove (), class "ui button" ] [ text "X" ]
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