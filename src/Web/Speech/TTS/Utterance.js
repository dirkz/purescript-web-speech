"strict";

exports._create = function (text) {
    return new SpeechSynthesisUtterance(text);
};

exports._setVoice = function (utterance, voice) {
    utterance.voice = voice;
};
