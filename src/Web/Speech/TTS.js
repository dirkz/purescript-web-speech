"strict";

exports._getVoices = function() {
    return function(onError, onSuccess) {
        let innerGetVoices = function() {
            let voices = synth.getVoices();
            onSuccess(voices);
        }
        let synth = window.speechSynthesis;
        if (speechSynthesis.onvoiceschanged !== undefined) {
            speechSynthesis.onvoiceschanged = innerGetVoices;
            synth.getVoices();
        } else {
            innerGetVoices();
        }
    }
}
