## Version: 1.0
##
## Plays audio streams in 1D space.
## This module must be added as an autoload.
##
## This script is part the [Quark Collection](https://github.com/Brasonite/Quark) under the MIT license.

class_name QuarkAudio1D extends Node

## Plays an [AudioStream], optionally altering its volume and/or pitch.
func play(sound: AudioStream, volume := 1.0, pitch := 1.0) -> AudioStreamPlayer:
    var player := AudioStreamPlayer.new()
    player.stream = sound
    player.volume_linear = volume
    player.pitch_scale = pitch

    player.finished.connect(player.queue_free.bind())

    add_child(player)
    player.play()

    return player

## Plays an [AudioStream] on the given audio bus, optionally altering its volume and/or pitch.
func play_on(sound: AudioStream, bus: StringName, volume := 1.0, pitch := 1.0) -> AudioStreamPlayer:
    var player := AudioStreamPlayer.new()
    player.stream = sound
    player.volume_linear = volume
    player.pitch_scale = pitch
    player.bus = bus

    player.finished.connect(player.queue_free.bind())

    add_child(player)
    player.play()

    return player