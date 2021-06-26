module App.Components.ListVoices (jsListVoices) where

import Prelude
import Data.Either (Either(..))
import Data.Tuple.Nested ((/\))
import Effect.Aff (runAff_)
import Effect.Console (log)
import Effect.Random (randomInt)
import Effect.Unsafe (unsafePerformEffect)
import React.Basic.DOM (button, div_, h3_, li, text, ul_)
import React.Basic.DOM as D
import React.Basic.Events (handler_)
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
        , content state currentInt
        ]
  where
  receivedVoices setState eitherVoices = case eitherVoices of
    Left err -> setState $ VoiceStateError $ show err
    Right theVoices -> setState $ VoiceStateVoices theVoices

  listItem int voice =
    let
      string = voice.name <> " (" <> voice.lang <> ")"

      speakIt = do
        log $ "*** speak " <> show int

      sayItText = "Say " <> show int

      theButton = button { children: [ text sayItText ], onClick: handler_ speakIt }
    in
      li { title: string, children: [ D.div { children: [ text string, theButton ] } ] }

  content state int = case state of
    VoiceStateInitial -> text "Waiting for voices ..."
    VoiceStateError s -> text $ "Error: " <> s
    VoiceStateVoices vs -> ul_ (map (listItem int) vs)

  nextRandomInt setter = do
    anInt <- randomInt 1 999
    setter anInt
