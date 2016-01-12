module App.Model where

import Counter.Model as Counter
import CounterPair.Model as CounterPair
import CounterList.Model as CounterList
import CounterListFancy.Model as CounterListFancy
import RandomGIF.Update as RandomGIF
import RandomGIF.Model
import Router.Model as Router


type alias Model =
  { router : Router.Model
  , counter : Counter.Model
  , counterPair : CounterPair.Model
  , counterList : CounterList.Model
  , counterListFancy : CounterListFancy.Model
  , randomGIF : RandomGIF.Model.Model
  }


initialModel : Model
initialModel =
  { router = Router.initialModel
  , counter = (Counter.init 0)
  , counterPair = (CounterPair.init 0 0)
  , counterList = CounterList.init
  , counterListFancy = CounterListFancy.init
  , randomGIF = RandomGIF.initialModel "funny cats"
  }