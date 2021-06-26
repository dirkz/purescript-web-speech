module App.Components.ListVoices (jsListVoices) where

import Prelude
import Data.Interpolate (i)
import Data.Tuple.Nested ((/\))
import Effect.Unsafe (unsafePerformEffect)
import React.Basic.DOM (button, div_, p_, text)
import React.Basic.Events (handler_)
import React.Basic.Hooks (Component, JSX, component, useState')
import React.Basic.Hooks as Hooks

type Props
  = {}

jsListVoices :: Props -> JSX
jsListVoices = unsafePerformEffect mkListVoices

mkListVoices :: Component Props
mkListVoices =
  component "Counter" \props -> Hooks.do
    count /\ setCount <- useState' 0
    pure do
      div_
        [ p_ [ text $ i "You clicked " count " times" ]
        , button
            { onClick: handler_ $ setCount (count + 1)
            , children: [ text "Click me" ]
            }
        ]
