--|The SpeechSynthesisVoice interface of the Web Speech API represents a voice that the system supports. Every SpeechSynthesisVoice has its own relative speech service including information about language, name and URI.
--|
--|[MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisVoice)
module Web.Speech.Synthesis.Voice (default, Voice) where

import Data.Function.Uncurried (Fn1, runFn1)

--|Represents [SpeechSynthesisVoice](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisVoice)
foreign import data Voice :: Type

foreign import _default :: Fn1 Voice Boolean

--|A boolean value indicating whether the voice is the default voice for the current app language (true), or not (false.)
--|
--|[MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisVoice/default)
default :: Voice -> Boolean
default = runFn1 _default
