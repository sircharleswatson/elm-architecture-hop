module RandomGif.View where

import Html exposing (Html, Attribute, div, button, h2, text, br)
import Html.Attributes exposing (style, class)
import Html.Events exposing (onClick)

import RandomGif.Model exposing (Model)
import RandomGif.Update exposing (Action)


(=>) = (,)


view : Signal.Address Action -> Model -> Html
view address model =
  div []
    [ h2 [ class "ui header" ]
        [ text model.topic ]
    , div [ imgStyle model.gifUrl ] []
    , br [] []
    , button [ onClick address RandomGif.Update.RequestMore, class "ui button"]
        [ text "MOAR!!"]
    ]


imgStyle : String -> Attribute
imgStyle url =
  style
    [ "display" => "inline-block"
    , "width" => "200px"
    , "height" => "200px"
    , "background-position" => "center center"
    , "background-size" => "cover"
    , "background-image" => ("url('" ++ url ++ "')")
    ]