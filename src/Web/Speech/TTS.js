"strict";

exports._tts = function (window) {
    return window.speechSynthesis;
};

exports._voices = function (synth) {
    return function (onError, onSuccess) {
        var numberOfAttemptsWithZeroVoices = 0;

        let unsetVoiceListener = function () {
            if (speechSynthesis.onvoiceschanged !== undefined) {
                speechSynthesis.onvoiceschanged = undefined;
            }
        };

        let innerGetVoices = function () {
            let voices = synth.getVoices();

            if (voices.length == 0) {
                if (numberOfAttemptsWithZeroVoices > 0) {
                    unsetVoiceListener();
                    onError("No voices found");
                } else {
                    numberOfAttemptsWithZeroVoices++;
                }
            } else if (voices.length > 0) {
                unsetVoiceListener();
                onSuccess(voices);
            }
        };

        if (speechSynthesis.onvoiceschanged !== undefined) {
            speechSynthesis.onvoiceschanged = innerGetVoices;
        }

        innerGetVoices();
    };
};

exports._speak = function (tts, utterance) {
    tts.speak(utterance);
};
