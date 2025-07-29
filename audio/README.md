# Quark Audio

This collection contains all utilities related to audio.

## Overall design

All resources in Godot are reference-counted, which means no matter how many times you load the same resource, it will occupy the same amount of memory. Quark's audio system makes heavy use of this fact.