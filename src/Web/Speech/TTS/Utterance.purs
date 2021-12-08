module Web.Speech.TTS.Utterance
  ( defaultSpec
  )
  where

--|Represents a [SpeechSynthesisUtterance](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisUtterance)
foreign import data Utterance :: Type

--|Variable parameters for an utterance.
type UtteranceSpec
  = { pitch :: Number
    , rate :: Number
    , volume :: Number
    }

defaultSpec :: UtteranceSpec
defaultSpec = { pitch: 1.0, rate: 1.0, volume: 1.0 }
