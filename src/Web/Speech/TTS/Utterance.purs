module Web.Speech.TTS.Utterance
  ( Utterance
  , create
  )
  where

import Effect (Effect)
import Effect.Aff.Compat (runEffectFn1)
import Effect.Uncurried (EffectFn1)

--|Represents a [SpeechSynthesisUtterance](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisUtterance)
foreign import data Utterance :: Type

foreign import _create :: EffectFn1 String Utterance

--|The SpeechSynthesisUtterance() constructor of the SpeechSynthesisUtterance interface returns a new SpeechSynthesisUtterance object instance.
--|[MDN.](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisUtterance/SpeechSynthesisUtterance)
create :: String -> Effect Utterance
create = runEffectFn1 _create
