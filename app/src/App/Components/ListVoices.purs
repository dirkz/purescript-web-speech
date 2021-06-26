module App.Components.ListVoices (jsListVoices) where

import Prelude
import Data.Either (Either(..))
import Data.Tuple.Nested ((/\))
import Effect.Aff (runAff_)
import Effect.Unsafe (unsafePerformEffect)
import React.Basic.DOM (div_, h3_, li, text, ul_)
import React.Basic.Hooks (Component, JSX, component, useState', useEffectOnce)
import React.Basic.Hooks as Hooks
import Web.Speech.TTS (Voice, getVoices)

type Props
  = {}

jsListVoices :: Props -> JSX
jsListVoices = unsafePerformEffect mkListVoices

data State
  = StateInitial
  | StateVoices (Array Voice)
  | StateError String

mkListVoices :: Component Props
mkListVoices =
  component "ListVoices" \_ -> Hooks.do
    state /\ setState <- useState' StateInitial
    useEffectOnce do
      runAff_
        (receivedVoices setState)
        getVoices
      pure mempty
    pure do
      div_
        [ h3_ [ text "Voices" ]
        , content state
        ]
  where
  receivedVoices setState eitherVoices = case eitherVoices of
    Left err -> setState $ StateError $ show err
    Right theVoices -> setState $ StateVoices theVoices

  listItem voice =
    let
      string = voice.name <> " (" <> voice.lang <> ")"
    in
      li { title: string, children: [ text string ] }

  content state = case state of
    StateInitial -> text "Waiting for voices ..."
    StateError s -> text $ "Error: " <> s
    StateVoices vs -> ul_ (map listItem vs)
