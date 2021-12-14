--|The SpeechSynthesis interface of the Web Speech API is the controller interface for the speech service; this can be used to retrieve information about the synthesis voices available on the device, start and pause speech, and other commands besides.
--|[MDN.](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis)
module Web.Speech.TTS
  ( TTS
  , cancel
  , speak
  , tts
  , voices
  )
  where

import Prelude
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Aff.Compat (EffectFnAff, fromEffectFnAff)
import Effect.Uncurried (EffectFn1, EffectFn2, runEffectFn1, runEffectFn2)
import Web.HTML.Window (Window)
import Web.Speech.TTS.Utterance (Utterance)
import Web.Speech.TTS.Voice (Voice)

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
voices speech = fromEffectFnAff $ _voices speech

foreign import _speak :: EffectFn2 TTS Utterance Unit

speak :: TTS -> Utterance -> Effect Unit
speak = runEffectFn2 _speak

foreign import _cancel :: EffectFn1 TTS Unit

--|The cancel() method of the SpeechSynthesis interface removes all utterances from the utterance queue.
--|If an utterance is currently being spoken, speaking will stop immediately.
--|[MDN.](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/cancel)
cancel :: TTS -> Effect Unit
cancel = runEffectFn1 _cancel
