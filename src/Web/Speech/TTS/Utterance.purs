module Web.Speech.TTS.Utterance
  ( Utterance
  , create
  , setVoice
  ) where

import Prelude
import Effect (Effect)
import Effect.Aff.Compat (runEffectFn1, runEffectFn2)
import Effect.Uncurried (EffectFn1, EffectFn2)
import Web.Speech.TTS.Voice (Voice)

--|Represents a [SpeechSynthesisUtterance](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisUtterance)
foreign import data Utterance :: Type

foreign import _create :: EffectFn1 String Utterance

--|The SpeechSynthesisUtterance() constructor of the SpeechSynthesisUtterance interface returns a new SpeechSynthesisUtterance object instance.
--|[MDN.](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisUtterance/SpeechSynthesisUtterance)
create :: String -> Effect Utterance
create = runEffectFn1 _create

foreign import _setVoice :: EffectFn2 Voice Utterance Unit

--|Sets the voice for this utterance.
--|[MDN.](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisUtterance/voice)
setVoice :: Voice -> Utterance -> Effect Unit
setVoice = runEffectFn2 _setVoice
