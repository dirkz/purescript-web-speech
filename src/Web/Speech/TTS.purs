-- |Wrapper around Web Speech Text-to-speech (TTS)
module Web.Speech.TTS where

import Effect.Aff.Compat (EffectFnAff)

type Voice = {lang :: String, name :: String}

foreign import _getVoices :: EffectFnAff (Array Voice)
