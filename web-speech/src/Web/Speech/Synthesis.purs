--|The SpeechSynthesis interface of the Web Speech API is the controller interface for the speech service; this can be used to retrieve information about the synthesis voices available on the device, start and pause speech, and other commands besides.
--|[MDN.](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis)
module Web.Speech.Synthesis
  ( Synthesis
  , windowInstance
  , voices
  , getVoices
  ) where

import Prelude

import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Aff.Compat (EffectFn1, EffectFnAff, fromEffectFnAff, runEffectFn1)
import Web.Speech.Synthesis.Voice (Voice)

--|Represents a [SpeechSynthesis](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis)
foreign import data Synthesis :: Type

foreign import _windowInstance :: Effect Synthesis

--|The global `window.speechSynthesis` object.
--|[MDN.](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis)
windowInstance :: Effect Synthesis
windowInstance = _windowInstance

foreign import _voices :: EffectFn1 Synthesis (Array Voice)

--|Returns a list of SpeechSynthesisVoice objects representing all the available voices on the current device.
--|[MDN.](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/getVoices)
voices :: Synthesis -> Effect (Array Voice)
voices = runEffectFn1 _voices

foreign import _getVoices :: Synthesis -> EffectFnAff (Array Voice)

--|Returns a list of SpeechSynthesisVoice objects representing all the available voices on the current device.
--|[MDN.](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/getVoices)
getVoices :: Synthesis -> Aff (Array Voice)
getVoices synth = fromEffectFnAff $ _getVoices synth
