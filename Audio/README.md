<div align="center">

![Quark Audio banner](./banner.png)

</div>

This collection contains all utilities related to audio.

## Audio playing modules

The audio playing modules, comprised of [`QuarkAudio1D`](./Audio1D.gd), [`QuarkAudio2D`](./Audio2D.gd) and [`QuarkAudio3D`](./Audio3D.gd), are responsible for playing audio from anywhere in the project. They must each be added as autoload singletons from the editor in order to work.

These modules will play an `AudioStream` on demand with the given parameters and will automatically clean up afterwards.