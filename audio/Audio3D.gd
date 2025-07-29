## Version: 1.0
##
## Plays audio streams in 3D space.
## This module must be added as an autoload.
##
## This script is part the [Quark Collection](https://github.com/Brasonite/Quark) under the MIT license.

class_name QuarkAudio3D extends Node

func play(sound: AudioStream, position: Vector3, volume := 1.0, pitch := 1.0) -> AudioStreamPlayer3D:
    var player := AudioStreamPlayer3D.new()
    player.stream = sound
    player.position = position
    player.volume_linear = volume
    player.pitch_scale = pitch

    player.finished.connect(player.queue_free.bind())

    add_child(player)
    player.play()

    return player

func play_on(sound: AudioStream, position: Vector3, bus: StringName, volume := 1.0, pitch := 1.0) -> AudioStreamPlayer3D:
    var player := AudioStreamPlayer3D.new()
    player.stream = sound
    player.position = position
    player.volume_linear = volume
    player.pitch_scale = pitch
    player.bus = bus

    player.finished.connect(player.queue_free.bind())

    add_child(player)
    player.play()

    return player