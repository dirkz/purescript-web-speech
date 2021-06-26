module App.Components.ListVoices (jsListVoices) where

import Prelude
import Control.Monad.Error.Class (try)
import Data.Either (Either(..))
import Data.Interpolate (i)
import Data.Tuple.Nested ((/\))
import Effect.Aff (runAff)
import Effect.Class (liftEffect)
import Effect.Unsafe (unsafePerformEffect)
import React.Basic.DOM (button, div_, li_, p_, text, ul_)
import React.Basic.Events (handler_)
import React.Basic.Hooks (Component, JSX, component, useState', useEffectOnce)
import React.Basic.Hooks as Hooks
import Web.Speech.TTS as TTS

type Props
  = {}

jsListVoices :: Props -> JSX
jsListVoices = unsafePerformEffect mkListVoices

mkListVoices :: Component Props
mkListVoices =
  component "Counter" \_ -> Hooks.do
    voices /\ setVoices <- useState' []
    useEffectOnce do
      runAff do
        eitherVoices <- try TTS.getVoices
        case eitherVoices of
          Left theVoices -> liftEffect $ setVoices theVoices -- TODO: Show the error
          Right theVoices -> liftEffect $ setVoices theVoices
    pure do
      div_
        [ ul_ (map listItem voices) ]
  where
  listItem voice =
    let
      string = voice.name
    in
      li_ string
