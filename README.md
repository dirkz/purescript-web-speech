# purescript-web-speech

A purescript wrapper around the most basic functionality of [speech synthises](https://developer.mozilla.org/en-US/docs/Web/API/SpeechSynthesis/speak).

Operations in a nutshell:

* Get access to the window SpeechSynthesis object.
* List voices.
* Create an utterance.
* Cancel the queue.
* Speak.

Pull requests are welcome. Please be aware of the LICENSE and format your code with `purty`.

## Author's Notes

### Updating the package on pursuit

The process looks like this:

```
# Check the created documentation, improve it if needed.
# Note: You need bower.json to do that, in case you deleted that (see the next step).
pulp docs -- --format html

# Create (update) a bower.json, create the next version tag.
spago bump-version minor --no-dry-run

# Log into github
pulp login

# Push the package to pursuit, push the tags.
pulp publish
```
