-- |Wrapper around Web Speech Text-to-speech (TTS)
module Web.Speech.TTS (getVoices) where

import Prelude

import Effect.Aff (Aff)
import Effect.Aff.Compat (EffectFnAff, fromEffectFnAff)

type Voice = {lang :: String, name :: String}

foreign import _getVoices :: EffectFnAff (Array Voice)

getVoices :: Aff (Array Voice)
getVoices = fromEffectFnAff _getVoices
