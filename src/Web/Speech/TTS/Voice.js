"strict";

exports._isDefault = function (voice) {
    return voice.default;
};

exports._lang = function (voice) {
    return voice.lang;
};

exports._localService = function (voice) {
    return voice.localService;
};

exports._name = function (voice) {
    return voice.name;
};

exports._voiceURI = function (voice) {
    return voice.voiceURI;
};
