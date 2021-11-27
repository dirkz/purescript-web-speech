--|The SpeechSynthesis interface of the Web Speech API is the controller interface for the speech service; this can be used to retrieve information about the synthesis voices available on the device, start and pause speech, and other commands besides.
--|[MDN.](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis)
module Web.Speech.Synthesis
  ( Synthesis
  , windowInstance
  , voices
  ) where

import Prelude

import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Aff.Compat (EffectFnAff, fromEffectFnAff)
import Web.Speech.Synthesis.Voice (Voice)

--|Represents a [SpeechSynthesis](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis)
foreign import data Synthesis :: Type

foreign import _windowInstance :: Effect Synthesis

--|The global `window.speechSynthesis` object.
--|[MDN.](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis)
windowInstance :: Effect Synthesis
windowInstance = _windowInstance

foreign import _voices :: Synthesis -> EffectFnAff (Array Voice)

--|Returns a list of SpeechSynthesisVoice objects representing all the available voices on the current device.
--|[MDN.](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/getVoices)
voices :: Synthesis -> Aff (Array Voice)
voices synth = fromEffectFnAff $ _voices synth
