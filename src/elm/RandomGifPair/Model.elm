module RandomGifPair.Model where

import RandomGif.Model as RandomGif exposing (Model)


type alias Model =
  { left : RandomGif.Model
  , right : RandomGif.Model}