module App.Components.ListVoices (jsListVoices) where

import Prelude
import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Effect.Aff (runAff_)
import Effect.Unsafe (unsafePerformEffect)
import React.Basic.DOM (div_, li, text, ul_)
import React.Basic.Hooks (Component, JSX, component, useState', useEffectOnce)
import React.Basic.Hooks as Hooks
import Web.DOM.ParentNode (children)
import Web.Speech.TTS as TTS

type Props
  = {}

jsListVoices :: Props -> JSX
jsListVoices = unsafePerformEffect mkListVoices

mkListVoices :: Component Props
mkListVoices =
  component "ListVoices" \_ -> Hooks.do
    voices /\ setVoices <- useState' []
    maybeError /\ setMaybeError <- useState' Nothing
    useEffectOnce do
      runAff_
        (receivedVoices setMaybeError setVoices)
        TTS.getVoices
      pure mempty
    pure do
      div_
        [ errorJsx maybeError
        , ul_ (map listItem voices)
        ]
  where
  receivedVoices setterError setterVoices eitherVoices = case eitherVoices of
    Left err -> do
      setterVoices []
      setterError $ Just $ show err
    Right theVoices -> setterVoices theVoices

  listItem voice =
    let
      string = voice.name
    in
      li { title: string, children: [ text voice.name ] }

  errorJsx :: forall a. Show a => Maybe a -> JSX
  errorJsx theMaybeError = case theMaybeError of
    Nothing -> text "Found the following voices"
    Just err -> text $ "Error: " <> show err
