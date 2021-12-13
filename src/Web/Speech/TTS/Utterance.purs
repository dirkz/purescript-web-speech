module Web.Speech.TTS.Utterance
  ( PitchRateVolume
  , Utterance
  , create
  , createWithVoiceAndPitch
  , defaultPitchRateVolume
  , pitchMax
  , pitchMin
  , rateMax
  , rateMin
  , setVoice
  , volumeMax
  , volumeMin
  ) where

import Prelude
import Effect (Effect)
import Effect.Aff.Compat (runEffectFn1, runEffectFn2)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, runEffectFn3)
import Web.Speech.TTS.Voice (Voice)

--|Represents a [SpeechSynthesisUtterance](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisUtterance)
foreign import data Utterance :: Type

foreign import _create :: EffectFn1 String Utterance

--|The SpeechSynthesisUtterance() constructor of the SpeechSynthesisUtterance interface returns a new SpeechSynthesisUtterance object instance.
--|[MDN.](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisUtterance/SpeechSynthesisUtterance)
create :: String -> Effect Utterance
create = runEffectFn1 _create

foreign import _setVoice :: EffectFn2 Utterance Voice Unit

--|Sets the voice for this utterance.
--|[MDN.](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisUtterance/voice)
setVoice :: Utterance -> Voice -> Effect Unit
setVoice = runEffectFn2 _setVoice

foreign import _createWithVoiceAndPitch :: EffectFn3 Voice PitchRateVolume String Utterance

--|Creates an utterance with voice, pitch, rate and volume, and text.
createWithVoiceAndPitch :: Voice -> PitchRateVolume -> String -> Effect Utterance
createWithVoiceAndPitch = runEffectFn3 _createWithVoiceAndPitch

--|Pitch, rate and volume for an utterance.
--|
--|* [Pitch](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisUtterance/pitch):
--|  Between 0 (lowest) and 2 (highest), with 1 being the default pitch for the current platform or voice.
--|* [Rate](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisUtterance/rate):
--|  Between 0.1 (lowest) and 10 (highest), with 1 being the default pitch for the current platform or voice.
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
