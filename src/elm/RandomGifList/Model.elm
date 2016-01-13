module RandomGifList.Model where

import RandomGif.Model as RandomGif


type alias Model =
  { topic : String
  , gifList : List (Int, RandomGif.Model)
  , uid : Int
  }