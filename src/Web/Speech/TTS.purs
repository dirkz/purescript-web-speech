--|The SpeechSynthesis interface of the Web Speech API is the controller interface for the speech service; this can be used to retrieve information about the synthesis voices available on the device, start and pause speech, and other commands besides.
--|[MDN.](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis)
module Web.Speech.Synthesis
  ( TTS
  , tts
  , voices
  ) where

import Prelude

import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Aff.Compat (EffectFn1, EffectFnAff, fromEffectFnAff, runEffectFn1)
import Web.HTML.Window (Window)
import Web.Speech.Synthesis.Voice (Voice)
import Data.Maybe (Maybe)

--|Represents a [SpeechSynthesis](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis)
foreign import data TTS :: Type

foreign import _tts :: EffectFn1 Window (Nullable TTS)

--|The `speechSynthesis` object from the given `Window`.
--|[MDN.](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis)
tts :: Window -> Effect (Maybe TTS)
tts = map toMaybe <<< runEffectFn1 _tts

foreign import _voices :: TTS -> EffectFnAff (Array Voice)

--|Returns a list of SpeechSynthesisVoice objects representing all the available voices on the current device.
--|[MDN.](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/getVoices)
voices :: TTS -> Aff (Array Voice)
voices synth = fromEffectFnAff $ _voices synth
