-- |Wrapper around Web Speech Text-to-speech (TTS)
module Web.Speech.TTS (Voice, getVoices) where

import Effect.Aff (Aff)
import Effect.Aff.Compat (EffectFnAff, fromEffectFnAff)

type Voice
  = { name :: String, lang :: String }

foreign import _getVoices :: EffectFnAff (Array Voice)

getVoices :: Aff (Array Voice)
getVoices = fromEffectFnAff _getVoices
