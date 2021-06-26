module App.Components.ListVoices (jsListVoices) where

import Prelude
import Data.Either (Either(..))
import Data.Tuple.Nested ((/\))
import Effect.Aff (runAff_)
import Effect.Unsafe (unsafePerformEffect)
import React.Basic.DOM (div_, li, p, text, ul_)
import React.Basic.Hooks (Component, JSX, component, useState', useEffectOnce)
import React.Basic.Hooks as Hooks
import Web.Speech.TTS as TTS

type Props
  = {}

jsListVoices :: Props -> JSX
jsListVoices = unsafePerformEffect mkListVoices

mkListVoices :: Component Props
mkListVoices =
  component "ListVoices" \_ -> Hooks.do
    voices /\ setVoices <- useState' []
    useEffectOnce do
      runAff_
        (receivedVoices setVoices)
        TTS.getVoices
      pure mempty
    pure do
      div_
        [ text "Voices"
        , ul_ (map listItem voices)
        ]
  where
  receivedVoices setter eitherVoices = case eitherVoices of
    Left _ -> setter [] -- TODO: Show the error
    Right theVoices -> setter theVoices

  listItem voice =
    let
      string = voice.name
    in
      li { title: string }
