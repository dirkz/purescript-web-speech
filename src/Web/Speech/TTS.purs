-- |Wrapper around Web Speech Text-to-speech (TTS)
module Web.Speech.TTS (Voice, getVoices, voiceName, voiceLanguage) where

import Data.Function.Uncurried (Fn1, runFn1)
import Effect.Aff (Aff)
import Effect.Aff.Compat (EffectFnAff, fromEffectFnAff)

foreign import data Voice :: Type

foreign import _getVoices :: EffectFnAff (Array Voice)

getVoices :: Aff (Array Voice)
getVoices = fromEffectFnAff _getVoices

foreign import _voiceName :: Fn1 Voice String

voiceName :: Voice -> String
voiceName = runFn1 _voiceName

foreign import _voiceLanguage :: Fn1 Voice String

voiceLanguage :: Voice -> String
voiceLanguage = runFn1 _voiceLanguage
