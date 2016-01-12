module RandomGIF.Update where

import Effects exposing (Effects)
import Http
import Json.Decode as Json
import Task

import RandomGIF.Model exposing (Model)


init : String -> (Model, Effects Action)
init topic =
  ( Model topic "assets/waiting.gif"
  , getRandomGif topic
  )

initialModel : String -> Model
initialModel topic = 
  { topic = "funny cats"
  , gifUrl = "assets/waiting.gif"
  }


type Action
  = RequestMore
  | NewGif (Maybe String)


update : Action -> Model -> (Model, Effects Action)
update msg model =
  case msg of
    RequestMore ->
      ( model, getRandomGif model.topic )

    NewGif maybeUrl ->
      ( Model model.topic (Maybe.withDefault model.gifUrl maybeUrl), Effects.none)


-- EFFECTS

(=>) = (,)

getRandomGif : String -> Effects Action
getRandomGif topic =
  Http.get decodeImageUrl (randomUrl topic)
    |> Task.toMaybe
    |> Task.map NewGif
    |> Effects.task


randomUrl : String -> String
randomUrl topic =
  Http.url "http://api.giphy.com/v1/gifs/random"
    [ "api_key" => "dc6zaTOxFJmzC"
    , "tag" => topic
    ]


decodeImageUrl : Json.Decoder String
decodeImageUrl =
  Json.at ["data", "image_url"] Json.string