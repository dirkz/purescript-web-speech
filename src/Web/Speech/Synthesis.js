"strict";

exports._synthesis = function () {
    return function (window) {
        return window.speechSynthesis;
    };
};

exports._voices = function (synth) {
    return function (onError, onSuccess) {
        var numberOfAttemptsWithZeroVoices = 0;

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
    };
};
