module App.Model where

import Pages.Counter.Model as Counter exposing (initialModel, Model)
import Pages.CounterPair.Model as CounterPair exposing (initialModel, Model)
import Pages.CounterList.Model as CounterList exposing (initialModel, Model)
import Pages.CounterListFancy.Model as CounterListFancy exposing (initialModel, Model)
import Pages.RandomGif.Model as RandomGif exposing (initialModel, Model)
import Pages.RandomGifPair.Model as RandomGifPair exposing (initialModel, Model)
import Pages.RandomGifList.Model as RandomGifList exposing (initialModel, Model)
import Pages.SpinSquarePair.Model as SpinSquarePair exposing (initialModel, Model)

import Router.Model as Router


type alias Model =
  { router : Router.Model
  , counter : Counter.Model
  , counterPair : CounterPair.Model
  , counterList : CounterList.Model
  , counterListFancy : CounterListFancy.Model
  , randomGif : RandomGif.Model
  , randomGifPair : RandomGifPair.Model
  , randomGifList : RandomGifList.Model
  , spinSquarePair : SpinSquarePair.Model
  }


initialModel : Model
initialModel =
  { router = Router.initialModel
  , counter = Counter.initialModel
  , counterPair = CounterPair.initialModel
  , counterList = CounterList.initialModel
  , counterListFancy = CounterListFancy.initialModel
  , randomGif = RandomGif.initialModel
  , randomGifPair = RandomGifPair.initialModel
  , randomGifList = RandomGifList.initialModel
  , spinSquarePair = SpinSquarePair.initialModel
  }