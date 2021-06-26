"strict";

exports._getVoices = function (onError, onSuccess) {
    let innerGetVoices = function (theSynth, ev) {
        let voices = theSynth.getVoices();
        onSuccess(voices);
    }

    let synth = window.speechSynthesis;

    if (speechSynthesis.onvoiceschanged !== undefined) {
        speechSynthesis.onvoiceschanged = innerGetVoices;
        synth.getVoices(); // trigger a voice fetch
    } else {
        innerGetVoices();
    }
}
