"strict";

exports._windowInstance = function () {
    return window.speechSynthesis;
};

exports._voices = function (speech) {
    return speech.voices();
};
