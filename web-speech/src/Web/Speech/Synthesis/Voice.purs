--|The SpeechSynthesisVoice interface of the Web Speech API represents a voice that the system supports. Every SpeechSynthesisVoice has its own relative speech service including information about language, name and URI.
--|
--|[MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisVoice)
module Web.Speech.Synthesis.Voice (Voice, default, lang, localService) where

import Data.Function.Uncurried (Fn1, runFn1)

--|Represents a [SpeechSynthesisVoice](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisVoice)
foreign import data Voice :: Type

foreign import _default :: Fn1 Voice Boolean

--|A boolean value indicating whether the voice is the default voice for the current app language (true), or not (false.)
--|
--|[MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisVoice/default)
default :: Voice -> Boolean
default = runFn1 _default

foreign import _lang :: Fn1 Voice String

--|Returns a BCP 47 language tag indicating the language of the voice.
--|
--|[MDN](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisVoice/lang)
lang :: Voice -> String
lang = runFn1 _lang

foreign import _localService :: Fn1 Voice Boolean

--|A boolean value indicating whether the voice is supplied by a local speech synthesizer service (true), or a remote speech synthesizer service (false.)
--|
--|[MDN](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisVoice/localService)
localService :: Voice -> Boolean
localService = runFn1 _localService
