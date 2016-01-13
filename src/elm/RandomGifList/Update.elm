module RandomGifList.Update where

import Effects exposing (Effects)

import RandomGif.Update as RandomGif exposing (Action)
import RandomGifList.Model exposing (Model)


init : (Model, Effects Action)
init =
  ( Model "" [] 0
  , Effects.none
  )


type Action
  = Topic String
  | Create
  | SubMsg Int RandomGif.Action


update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    Topic topic ->
      ( { model
            | topic = topic
        }
      , Effects.none
      )

    Create ->
      let
        (newRandomGif, fx) =
          RandomGif.init model.topic

        newModel =
          Model "" (model.gifList ++ [(model.uid, newRandomGif)]) (model.uid + 1)
      in
        ( newModel
        , Effects.map (SubMsg model.uid) fx
        )

    SubMsg msgId msg ->
      let
        subUpdate ((id, randomGif) as entry) =
          if id == msgId then
            let
              (newRandomGif, fx) = RandomGif.update msg randomGif
            in
              ( (id, newRandomGif)
              , Effects.map (SubMsg id) fx
              )
          else
            (entry, Effects.none)

        (newGifList, fxList) =
          model.gifList
            |> List.map subUpdate
            |> List.unzip
      in
        ( { model
              | gifList = newGifList
          }
        , Effects.batch fxList
        )






