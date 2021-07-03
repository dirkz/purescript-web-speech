module App.Components.ListVoices (jsListVoices) where

import Prelude
import Data.Either (Either(..))
import Data.Tuple.Nested ((/\))
import Effect.Aff (runAff_)
import Effect.Console (log)
import Effect.Random (randomInt)
import Effect.Unsafe (unsafePerformEffect)
import Prim.Row (class Nub)
import React.Basic.DOM (button, div_, h1_, text)
import React.Basic.DOM as D
import React.Basic.Events (handler_)
import React.Basic.Hooks (Component, JSX, component, useEffectOnce, useState')
import React.Basic.Hooks as Hooks
import Record (merge)
import Web.HTML (window)
import Web.HTML.HTMLDocument (setTitle)
import Web.HTML.Window (document)
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
    useEffectOnce do
      w <- window
      doc <- document w
      setTitle "Voices" doc
      pure mempty
    pure do
      div_
        [ h1_ [ text "Voices" ]
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

      theButton = elem button { onClick: handler_ speakIt } [ text sayItText ]
    in
      elemClass D.div "voice-row" { title: string }
        [ elemClass D.div "voice-col-1" {} [ text string ]
        , elemClass D.div "voice-col-2" {} [ theButton ]
        ]

  content state int = case state of
    VoiceStateInitial -> text "Waiting for voices ..."
    VoiceStateError s -> text $ "Error: " <> s
    VoiceStateVoices vs -> elemClass D.div "voice-container" {} (map (listItem int) vs)

  nextRandomInt setter = do
    anInt <- randomInt 1 999
    setter anInt

elem ::
  forall a b c d.
  Nub
    ( children :: a
    | b
    )
    c =>
  (Record c -> d) -> Record b -> a -> d
elem name props children = name merged
  where
  merged = merge { children } props

elemClass ::
  forall a b c d e.
  Nub
    ( children :: b
    , className :: a
    | c
    )
    d =>
  (Record d -> e) -> a -> Record c -> b -> e
elemClass name className props children = name merged
  where
  merged = merge { className, children } props
