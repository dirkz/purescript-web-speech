module Web.Speech.TTS.Utterance
  ( PitchRateVolume
  , Utterance
  , createWithVoiceAndPitch
  , createWithVoiceAndRate
  , defaultPitchRateVolume
  , pitchMax
  , pitchMin
  , rateMax
  , rateMin
  , volumeMax
  , volumeMin
  )
  where

import Effect (Effect)
import Effect.Uncurried (EffectFn3, runEffectFn3)
import Web.Speech.TTS.Voice (Voice)

--|Represents a [SpeechSynthesisUtterance](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisUtterance)
foreign import data Utterance :: Type

foreign import _createWithVoiceAndPitch :: EffectFn3 Voice PitchRateVolume String Utterance

--|Creates an utterance with voice, pitch, rate and volume, and text.
createWithVoiceAndPitch :: Voice -> PitchRateVolume -> String -> Effect Utterance
createWithVoiceAndPitch = runEffectFn3 _createWithVoiceAndPitch

foreign import _createWithVoiceAndRate :: EffectFn3 Voice Number String Utterance

--|Creates an utterance with voice, pitch, rate and volume, and text.
createWithVoiceAndRate :: Voice -> Number -> String -> Effect Utterance
createWithVoiceAndRate = runEffectFn3 _createWithVoiceAndRate

--|Pitch, rate and volume for an utterance.
--|
--|* [Pitch](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisUtterance/pitch):
--|  Between 0 (lowest) and 2 (highest), with 1 being the default pitch for the current platform or voice.
--|* [Rate](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisUtterance/rate):
--|  Note that the documentation looks suspicious, and `rateMax` has been set to 2.0.
--|* [Volume](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisUtterance/volume):
--|  Between 0 (lowest) and 1 (highest), with 1 being the default.
type PitchRateVolume
  = { pitch :: Number
    , rate :: Number
    , volume :: Number
    }

defaultPitchRateVolume :: PitchRateVolume
defaultPitchRateVolume =
  { pitch: 1.0
  , rate: 1.0
  , volume: 1.0
  }

pitchMin :: Number
pitchMin = 0.0

pitchMax :: Number
pitchMax = 2.0

rateMin :: Number
rateMin = 0.1

--|Note that this is capped to 2.0. Even though the documentation says 10.0 is possible,
--|I don't think this makes any sense, since even with 2.0 the voice is very fast,
--|and I doesn't accept changes above 3.0 or 4.0 anyways and falls back to 1.0.
--|See [Rate](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisUtterance/rate).
rateMax :: Number
rateMax = 2.0

volumeMin :: Number
volumeMin = 0.0

volumeMax :: Number
volumeMax = 1.0
