module RandomGif.Model where


type alias Model =
  { topic : String
  , gifUrl : String
  }


initialModel : String -> Model
initialModel topic =
  { topic = topic
  , gifUrl = "assets/waiting.png"
  }