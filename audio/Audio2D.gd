## Version: 1.0
##
## Plays audio streams in 2D space.
## This module must be added as an autoload.
##
## This script is part the [Quark Collection](https://github.com/Brasonite/Quark) under the MIT license.

class_name QuarkAudio2D extends Node

func play(sound: AudioStream, position: Vector2, volume := 1.0, pitch := 1.0) -> AudioStreamPlayer2D:
    var player := AudioStreamPlayer2D.new()
    player.stream = sound
    player.position = position
    player.volume_linear = volume
    player.pitch_scale = pitch

    player.finished.connect(player.queue_free.bind())

    add_child(player)
    player.play()

    return player

func play_on(sound: AudioStream, position: Vector2, bus: StringName, volume := 1.0, pitch := 1.0) -> AudioStreamPlayer2D:
    var player := AudioStreamPlayer2D.new()
    player.stream = sound
    player.position = position
    player.volume_linear = volume
    player.pitch_scale = pitch
    player.bus = bus

    player.finished.connect(player.queue_free.bind())

    add_child(player)
    player.play()

    return player