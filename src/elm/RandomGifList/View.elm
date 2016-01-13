module RandomGifList.View where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Json

import RandomGif.Model as RandomGif
import RandomGif.View
import RandomGifList.Model exposing (Model)
import RandomGifList.Update as RandomGifList exposing (Action)


(=>) = (,)


view : Signal.Address Action -> Model -> Html
view address model =
  div [ class "ui sixteen wide column grid" ]
    [ div [ class "ui eight wide column centered row"]
        [ div [ class "ui fluid input" ]
            [ input
                [ placeholder "What kind of gifs do you want?"
                , value model.topic
                , onEnter address RandomGifList.Create
                , on "input" targetValue (Signal.message address << RandomGifList.Topic)
                , class "ui input"
                ]
                []
            ]
        ]
    , div [ class "ui sixteen wide column grid" ]
        (List.map (elementView address) model.gifList)
    ]


elementView : Signal.Address Action -> (Int, RandomGif.Model) -> Html
elementView address (id, model) =
  div [ class "ui eight wide column" ]
    [ RandomGif.View.view (Signal.forwardTo address (RandomGifList.SubMsg id)) model ]


onEnter : Signal.Address a -> a -> Attribute
onEnter address value =
  on "keydown"
    (Json.customDecoder keyCode is13)
    (\_ -> Signal.message address value)


is13 : Int -> Result String ()
is13 code =
  if code == 13 then
    Ok ()

  else
    Err "not the right key code"



