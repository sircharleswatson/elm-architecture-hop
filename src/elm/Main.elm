import StartApp as StartApp
import Effects exposing (Effects, Never)
import Task exposing (Task)

import App.Update exposing (init, update)
import App.View exposing (view)
import Router.Update exposing (router)


-- ENTRY

app =
  StartApp.start
    { init = App.Update.init
    , update = App.Update.update
    , view = App.View.view
    , inputs =
        [ routerSignal ]
    }


main =
  app.html


-- SIGNALS && PORTS

routerSignal =
  Signal.map App.Update.RouterAction router.signal


port tasks : Signal (Task Never ())
port tasks =
  app.tasks


port routeRunTask : Task () ()
port routeRunTask =
  router.run