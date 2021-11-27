--|The SpeechSynthesis interface of the Web Speech API is the controller interface for the speech service; this can be used to retrieve information about the synthesis voices available on the device, start and pause speech, and other commands besides.
--|[MDN.](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis)
module Web.Speech.Synthesis.Voice.Synthesis
  ( Synthesis
  , windowInstance
  , voices
  ) where

import Effect (Effect)
import Effect.Aff.Compat (EffectFn1, runEffectFn1)
import Web.Speech.Synthesis.Voice (Voice)

--|Represents a [SpeechSynthesis](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis)
foreign import data Synthesis :: Type

foreign import _windowInstance :: Effect Synthesis

--|The global `window.speechSynthesis` object.
--|[MDN.](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis)
windowInstance :: Effect Synthesis
windowInstance = _windowInstance

foreign import _voices :: EffectFn1 Synthesis (Array Voice)

voices :: Synthesis -> Effect (Array Voice)
voices = runEffectFn1 _voices
