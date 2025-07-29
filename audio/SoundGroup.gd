## Version: 1.0
##
## A sound stream that picks from a list of sounds when played.
##
## This script is part the [Quark Collection](https://github.com/Brasonite/Quark) under the MIT license.

class_name SoundGroup extends AudioStream

## The list of sounds available to the [SoundGroup].
@export var sounds: Array[AudioStream] = []

func _instantiate_playback() -> AudioStreamPlayback:
	return sounds.pick_random().instantiate_playback()
