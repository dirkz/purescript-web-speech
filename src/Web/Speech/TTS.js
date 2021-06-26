"strict";

exports._getVoices = function(onError, onSuccess) {
    let innerGetVoices = function() {
        let voices = synth.getVoices();
        console.log("*** have voices")
        onSuccess(voices);
    }
    let synth = window.speechSynthesis;
    if (speechSynthesis.onvoiceschanged !== undefined) {
        console.log("*** have onvoiceschanged")
        speechSynthesis.onvoiceschanged = innerGetVoices;
        let voices = synth.getVoices();
        if (voices.length > 0) {
            onError(voices);
        }
    } else {
        console.log("*** can call directly")
        innerGetVoices();
    }
}
