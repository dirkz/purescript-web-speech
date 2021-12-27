# purescript-web-speech

Tags: web speech, TTS (text to speech), purescript

A PureScript wrapper around the most basic functionality of [speech synthesis](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/speak).

Operations in a nutshell:

* Get access to the window SpeechSynthesis object.
* Get the list of voices.
* Create an utterance.
* Speak an utterance.
* Cancel the queue of utterances.
* Get called on the boundaries of what is to be spoken next.
* Get called to when speaking of an utterance has ended.

Pull requests are welcome. Please be aware of the LICENSE and format your code with `purty`.

## Author's Notes

### Creating/updating the package on pursuit

* Follow the [spago docs](https://github.com/purescript/spago#publish-my-library).
* Add your project to [the registry](https://github.com/purescript/registry/blob/master/new-packages.json).
* Update the [package set](https://github.com/purescript/package-sets/blob/master/CONTRIBUTING.md).
  * Add/edit your [group file](https://github.com/purescript/package-sets/tree/master/src/groups).
