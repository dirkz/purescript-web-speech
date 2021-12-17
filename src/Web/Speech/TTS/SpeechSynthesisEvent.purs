module Web.Speech.TTS.SpeechSynthesisEvent
  ( SpeechSynthesisEvent
  , charIndex
  , elapsedTime
  , fromEvent
  , name
  , toEvent
  , utterance
  )
  where

import Prelude

import Data.Function.Uncurried (Fn1, runFn1)
import Data.Int (floor)
import Data.Maybe (Maybe)
import Unsafe.Coerce (unsafeCoerce)
import Web.Event.Event (Event)
import Web.Internal.FFI (unsafeReadProtoTagged)
import Web.Speech.TTS.Utterance (Utterance)

--|(Partly) wraps a [SpeechSynthesisEvent](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisEvent)
foreign import data SpeechSynthesisEventimport Web.Speech.TTS.Utterance (Utterance)
 :: Type

fromEvent :: Event -> Maybe SpeechSynthesisEvent
fromEvent = unsafeReadProtoTagged "SpeechSynthesisEvent"

toEvent :: SpeechSynthesisEvent -> Event
toEvent = unsafeCoerce

foreign import _charIndex :: Fn1 SpeechSynthesisEvent Number

--|[SpeechSynthesisEvent.charIndex](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisEvent/charIndex)
charIndex :: SpeechSynthesisEvent -> Int
charIndex = runFn1 _charIndex >>> floor

foreign import _elapsedTime :: Fn1 SpeechSynthesisEvent Number

--|[SpeechSynthesisEvent.charIndex](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisEvent/charIndex)
elapsedTime :: SpeechSynthesisEvent -> Number
elapsedTime = runFn1 _elapsedTime

foreign import _name :: Fn1 SpeechSynthesisEvent String

--|[SpeechSynthesisEvent.name](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisEvent/name)
name :: SpeechSynthesisEvent -> String
name = runFn1 _name

foreign import _utterance :: Fn1 SpeechSynthesisEvent Utterance

--|[SpeechSynthesisEvent.utterance](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisEvent/utterance)
utterance :: SpeechSynthesisEvent -> Utterance
utterance = runFn1 _utterance
