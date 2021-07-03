"strict";

exports._getVoices = function (onError, onSuccess) {
    var numberOfAttemptsWithZeroVoices = 0;
    let synth = window.speechSynthesis;

    let innerGetVoices = function () {
        let voices = synth.getVoices();

        if (voices.length == 0) {
            if (numberOfAttemptsWithZeroVoices > 0) {
                onError("No voices found");
            } else {
                numberOfAttemptsWithZeroVoices++;
            }
        } else if (voices.length > 0) {
            onSuccess(voices);
        }
    };

    if (speechSynthesis.onvoiceschanged !== undefined) {
        speechSynthesis.onvoiceschanged = innerGetVoices;
    }

    innerGetVoices();
}
