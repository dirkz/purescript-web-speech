"strict";

exports._createWithVoiceAndPitch = function (voice, pitch, text) {
    let utt = new SpeechSynthesisUtterance(text);
    utt.voice = voice;
    utt.pitch = pitch.pitch;
    utt.rate = pitch.rate;
    utt.volume = pitch.volume;
    return utt;
};

exports._createWithVoiceAndRate = function (voice, rate, text) {
    let utt = new SpeechSynthesisUtterance(text);
    utt.voice = voice;
    utt.rate = rate;
    return utt;
};

exports._lang = function(utterance) {
    return utterance.lang;
};

exports._pitch = function(utterance) {
    return utterance.pitch;
};

exports._rate = function(utterance) {
    return utterance.rate;
};
