-- vim: ft=elm sw=4 ts=4 et
-- 
-- Main.elm
-- main entry-point for Elm micro-benchmarks
--

import Window

import Html (..)
import Html.Tags (..)
import Html.Events (..)
import Graphics.Input

import Fib


---- Model ----

type BenchTask =
    { fun : Int -> Int
    , arg : Int
    , desc : String
}

type BenchResult =
    { display : String
    , elapsed : TimeElapsed
}

type TimeElapsed =
    { number : Float
    , unit : String
}

data Action
    = NoOp
    | Start

type State =
    { tasks : [BenchTask]
    , results : [BenchResult]
}


initialState : State
initialState = { tasks = benchmarks, results = [] }

benchmarks : [BenchTask]
benchmarks =
    [ {fun = Fib.fib_naive, arg = 35, desc = "fib_naive(35)"}
    , {fun = Fib.fib, arg = 35, desc = "fib(35)"}
    ]


---- Update ----

-- call all benchmarks
runAll : [BenchTask] -> [BenchResult]
runAll benchmarks = map runSingle benchmarks

-- call a single benchmark
runSingle : BenchTask -> BenchResult
runSingle task =
    let result_ = task.fun task.arg
        display_ = task.desc ++ " = " ++ (show result_)
    in
       {display = display_, elapsed = {number = 0, unit = "ms"}}

-- advance app state
nextState : Action -> State -> State
nextState action state = 
    case action of
        NoOp -> state
        Start -> { state | results <- runAll state.tasks }



---- View ----

view : [BenchResult] -> Html
view result =
    div []
    [ h1 [] [ text "Elm Benchmarks" ]
    , div []
        [ button [ onclick action.handle (always Start) ]
            [ text "Start Benchmarks" ]
        ]
    , div [] [ (renderAllBenchmark result) ]
    ]

renderSingleBenchmark : BenchResult -> Html
renderSingleBenchmark res =
    li []
    [ ul []
        [ li [] [ text (res.display) ]
        , li [] [ text ("Elapsed time: " ++ (show res.elapsed.number) ++ res.elapsed.unit) ]
        ]
    ]

renderAllBenchmark : [BenchResult] -> Html
renderAllBenchmark res =
    ul []
    (map renderSingleBenchmark res)



---- Inputs ----

action : Graphics.Input.Input Action
action = Graphics.Input.input NoOp

scene : State -> (Int, Int) -> Element
scene state (w, h) =
    let w_ = (toFloat w) * 0.8 |> round
        results = state.results
    in
        container w h midTop (toElement w_ h <| view results)

state : Signal State
state = foldp nextState initialState action.signal

--main : Signal Element
--main = lift scene results
main = lift2 scene state Window.dimensions

