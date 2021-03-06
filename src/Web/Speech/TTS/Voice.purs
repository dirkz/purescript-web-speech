--|The SpeechSynthesisVoice interface of the Web Speech API represents a voice that the system supports. Every SpeechSynthesisVoice has its own relative speech service including information about language, name and URI.
--|[MDN.](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisVoice)
module Web.Speech.TTS.Voice
  ( Voice
  , isDefault
  , lang
  , localService
  , name
  , voiceURI
  ) where

import Data.Function.Uncurried (Fn1, runFn1)

--|Represents a [SpeechSynthesisVoice](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisVoice)
foreign import data Voice :: Type

foreign import _isDefault :: Fn1 Voice Boolean

--|A boolean value indicating whether the voice is the default voice for the current app language (true), or not (false.)
--|[MDN.](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisVoice/default)
isDefault :: Voice -> Boolean
isDefault = runFn1 _isDefault

foreign import _lang :: Fn1 Voice String

--|Returns a BCP 47 language tag indicating the language of the voice.
--|[MDN.](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisVoice/lang)
lang :: Voice -> String
lang = runFn1 _lang

foreign import _localService :: Fn1 Voice Boolean

--|A boolean value indicating whether the voice is supplied by a local speech synthesizer service (true), or a remote speech synthesizer service (false.)
--|[MDN.](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisVoice/localService)
localService :: Voice -> Boolean
localService = runFn1 _localService

foreign import _name :: Fn1 Voice String

--|Returns a human-readable name that represents the voice.
--|[MDN.](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisVoice/name)
name :: Voice -> String
name = runFn1 _name

foreign import _voiceURI :: Fn1 Voice String

--|Returns the type of URI and location of the speech synthesis service for this voice.
--|[MDN.](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisVoice/voiceURI)
voiceURI :: Voice -> String
voiceURI = runFn1 _voiceURI
