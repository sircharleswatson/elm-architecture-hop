module Pages.RandomGifPair.Model where

import RandomGif.Model as RandomGif
import RandomGifPair.Model as RandomGifPair


type alias Model = RandomGifPair.Model


initialModel : Model
initialModel =
  { left = RandomGif.initialModel "funny cats"
  , right = RandomGif.initialModel "funny dogs"
  }