module App.Components.ListVoices (jsListVoices) where

import Prelude
import Data.Either (Either(..))
import Data.Tuple.Nested ((/\))
import Effect.Aff (runAff_)
import Effect.Random (randomInt)
import Effect.Unsafe (unsafePerformEffect)
import React.Basic.DOM (div_, h3_, li, text, ul_)
import React.Basic.Hooks (Component, JSX, component, useEffectOnce, useState')
import React.Basic.Hooks as Hooks
import Web.Speech.TTS (Voice, getVoices)

type Props
  = {}

jsListVoices :: Props -> JSX
jsListVoices = unsafePerformEffect mkListVoices

data VoiceState
  = VoiceStateInitial
  | VoiceStateVoices (Array Voice)
  | VoiceStateError String

mkListVoices :: Component Props
mkListVoices =
  component "ListVoices" \_ -> Hooks.do
    state /\ setState <- useState' VoiceStateInitial
    currentInt /\ setCurrentInt <- useState' 0
    useEffectOnce do
      runAff_
        (receivedVoices setState)
        getVoices
      pure mempty
    useEffectOnce do
      nextRandomInt setCurrentInt
      pure mempty
    pure do
      div_
        [ h3_ [ text "Voices" ]
        , content state
        ]
  where
  receivedVoices setState eitherVoices = case eitherVoices of
    Left err -> setState $ VoiceStateError $ show err
    Right theVoices -> setState $ VoiceStateVoices theVoices

  listItem voice =
    let
      string = voice.name <> " (" <> voice.lang <> ")"
    in
      li { title: string, children: [ text string ] }

  content state = case state of
    VoiceStateInitial -> text "Waiting for voices ..."
    VoiceStateError s -> text $ "Error: " <> s
    VoiceStateVoices vs -> ul_ (map listItem vs)

  nextRandomInt setter = do
    anInt <- randomInt 1 999
    setter anInt
