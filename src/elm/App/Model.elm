module App.Model where

import Counter.Model as Counter
import CounterPair.Model as CounterPair
import CounterList.Model as CounterList
import CounterListFancy.Model as CounterListFancy
import RandomGif.Model
import RandomGif.Update as RandomGif
import RandomGifPair.Model
import RandomGifPair.Update as RandomGifPair

import Router.Model as Router


type alias Model =
  { router : Router.Model
  , counter : Counter.Model
  , counterPair : CounterPair.Model
  , counterList : CounterList.Model
  , counterListFancy : CounterListFancy.Model
  , randomGif : RandomGif.Model.Model
  , randomGifPair : RandomGifPair.Model.Model
  }


initialModel : Model
initialModel =
  { router = Router.initialModel
  , counter = (Counter.init 0)
  , counterPair = (CounterPair.init 0 0)
  , counterList = CounterList.init
  , counterListFancy = CounterListFancy.init
  , randomGif = RandomGif.initialModel "funny cats"
  , randomGifPair = (RandomGifPair.initialModel "funny cats" "funny dogs")
  }