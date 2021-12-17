module Web.Speech.TTS.SpeechSynthesisEvent
  ( SpeechSynthesisEvent
  , fromEvent
  , toEvent
  )
  where

import Data.Maybe (Maybe)
import Unsafe.Coerce (unsafeCoerce)
import Web.Event.Event (Event)
import Web.Internal.FFI (unsafeReadProtoTagged)

--|(Partly) wraps a [SpeechSynthesisEvent](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesisEvent)
foreign import data SpeechSynthesisEvent :: Type

fromEvent :: Event -> Maybe SpeechSynthesisEvent
fromEvent = unsafeReadProtoTagged "SpeechSynthesisEvent"

toEvent :: SpeechSynthesisEvent -> Event
toEvent = unsafeCoerce
