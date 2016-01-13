module Pages.RandomGifList.Model where

import RandomGifList.Model as RandomGifList


type alias Model = RandomGifList.Model


initialModel : Model
initialModel =
  { topic = ""
  , gifList = []
  , uid = 0
  }