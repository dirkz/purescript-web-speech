"strict";

exports._create = function (text) {
    return new SpeechSynthesisUtterance(text);
};

exports._setVoice = function (utterance, voice) {
    utterance.voice = voice;
};

exports._createWithVoiceAndPitch = function (voice, pitch, text) {
    let utt = new SpeechSynthesisUtterance(text);
    utt.voice = voice;
    utt.pitch = pitch.pitch;
    utt.rate = pitch.rate;
    utt.volume = pitch.volume;
    return utt;
};
