module Pages.RandomGif.Model where


import RandomGif.Model as RandomGif


type alias Model = RandomGif.Model


initialModel : Model
initialModel =
  RandomGif.initialModel "funny cats"