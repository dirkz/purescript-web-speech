--|The SpeechSynthesis interface of the Web Speech API is the controller interface for the speech service; this can be used to retrieve information about the synthesis voices available on the device, start and pause speech, and other commands besides.
--|[MDN.](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis)
module Web.Speech.Synthesis.Voice.Synthesis where

import Effect (Effect)

--|Represents a [SpeechSynthesis](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis)
foreign import data Synthesis :: Type

foreign import _windowInstance :: Effect Synthesis

--|The global `window.speechSynthesis` object.
--|[MDN.](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis)
windowInstance :: Effect Synthesis
windowInstance = _windowInstance
